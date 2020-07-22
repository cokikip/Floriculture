package com.mvc.controllers;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.data.Flower;
import com.mvc.data.FlowerRepository;
import com.mvc.data.Item;
import com.mvc.data.OrderList;
import com.mvc.data.OrderListRepository;
import com.mvc.data.Orders;
import com.mvc.data.UserRepository;
import com.mvc.data.Users;

@Controller
@RequestMapping("/flower")
@SessionAttributes({"cart","cartsize","user"})
public class FlowerController {
	
	@Autowired
	FlowerRepository flowerrepo;
	@Autowired
	OrderListRepository orderrepo;
	@Autowired
	UserRepository userrepo;
	
	@ModelAttribute(value="flower")
	public Flower getFlower() {
		return new Flower();			
	}
	
	@RequestMapping(value = "/farmer/add", method=RequestMethod.GET)
	public String addFlower() {
		return "addflower";
	}
	//Method for saving the flower controller

	@RequestMapping(value = "/farmer/add", method=RequestMethod.POST)
	public String saveFlower(@ModelAttribute Flower flower ) throws Exception {
		String username=SecurityContextHolder.getContext().getAuthentication().getName();
		Users us=userrepo.findOne(username);
		
		MultipartFile file=flower.getFile();
	    byte[] ibyte=file.getBytes();	
	    Blob blob=new SerialBlob(ibyte);
	    flower.setImage(blob);
		flower.setFarmersName(username);
		flower.setCompany(us.getCompany());
		flowerrepo.save(flower);		
		return "redirect:/flower/farmer/products";
	}
	
	//Method for showing the flower in for every farmer
	@RequestMapping(value="/farmer/products")
	public String products(Model model,Pageable pageable) throws Exception {
		String farmersName=SecurityContextHolder.getContext().getAuthentication().getName();
		List<Flower> flowers=flowerrepo.findByFarmersName(farmersName);
		for (Flower flower : flowers) {
			Blob image=flower.getImage();
			int bloblength=(int) image.length();
			byte[] b=image.getBytes(1, bloblength);
			String baseImage =Base64.getEncoder().encodeToString(b);
			flower.setBase64image(baseImage);	
			
		}
		model.addAttribute("flowerlist", flowers);
		return "product-list";	
	}
	
	@RequestMapping(value="/farmer/delete")
	public String remove(@RequestParam int id) {
		Flower flower=flowerrepo.findOne(id);
		flower.setDeleted(1);	
		flowerrepo.save(flower);
		return "redirect:/flower/farmer/products";
	}

	
	@RequestMapping(value="/customer/find")
	public String findFlowers(Model model) throws Exception {
		List<Flower> flowers=flowerrepo.findAll();
		List<Flower> flowers1=flowerrepo.findByOrderByPriceDesc();
		List<Flower> flowers2=flowerrepo.findByOrderByPriceAsc();
		for (Flower flower : flowers) {
			Blob image=flower.getImage();
			int bloblength=(int) image.length();
			
			byte[] b=image.getBytes(1, bloblength);
			
			String baseImage =Base64.getEncoder().encodeToString(b);
			flower.setBase64image(baseImage);
			
		}
		model.addAttribute("flowerlist", flowers);
		model.addAttribute("flowerlist1", flowers1);
		model.addAttribute("flowerlist2", flowers2);
		return "flowers";	
	}
	
	@RequestMapping("/customer/{flowerId}")
	public String viewFlower(@PathVariable("flowerId") int flowerId, Model model) throws Exception {
		Flower flower=flowerrepo.findOne(flowerId);
		Blob image=flower.getImage();
		int bloblength=(int) image.length();

		byte[] b=image.getBytes(1, bloblength);
		
		String baseImage =Base64.getEncoder().encodeToString(b);
		flower.setBase64image(baseImage);
		model.addAttribute("flower", flower);
		return "flower";
	}
	
	@RequestMapping(value="/customer/buy/{id}", method=RequestMethod.POST)
	public String buy(@PathVariable int id,Model model,@ModelAttribute Item item,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int itemquantity=item.getItemquantity();
		if(session.getAttribute("cart") == null) {			
			List<Item> cart = new ArrayList<Item>();
			int i=cart.size();
			model.addAttribute("cartsize", i);
			cart.add(new Item(flowerrepo.findOne(id), itemquantity));
	
			model.addAttribute("cart", cart);
		}else {
			@SuppressWarnings("unchecked")
			List<Item> cart =(List<Item>)session.getAttribute("cart");
			int index=isExisting(id, cart);
			if (index==-1) {
				cart.add(new Item(flowerrepo.findOne(id), itemquantity));
			} else {
				cart.get(index).setItemquantity(itemquantity);

			}
			int cartsize=cart.size();		
			model.addAttribute("cartsize", cartsize);
			model.addAttribute("cart", cart);
			
		}
		
		

		return "cart";
	}

	private int isExisting(int id,List<Item> cart) {
		for (int i = 0; i < cart.size()	; i++) {
			if (cart.get(i).getFlower().getFlowerId()==id) {
				return i;
			}

		}
		return -1;
	}
	@RequestMapping(value="/customer/cart")
	public  String cart() {
		
		return "cart";
	}
     @RequestMapping(value="/customer/order")
	public String orders(HttpSession session,Model model) {
		String customerName=SecurityContextHolder.getContext().getAuthentication().getName();
		Users user=userrepo.findByUsername(customerName);
		int times=user.getShoppingTimes()+1;
		user.setShoppingTimes(times);
		userrepo.save(user);
		List<Orders> orders=new ArrayList<>();
		double amount = 0;
		int sold=0;
		@SuppressWarnings("unchecked")
		List<Item> cart=(List<Item>)session.getAttribute("cart");
		for(Item order:cart) {
			int itemQuantity=order.getItemquantity();
			Orders od=new Orders();
			od.setFlowerName(order.getFlower().getName());
			od.setItemquantity(itemQuantity);
			od.setFarmersName(order.getFlower().getFarmersName());
			double total=order.getFlower().getPrice()*itemQuantity;
			od.setSubprice(total);
			amount+=total;			
			int id=order.getFlower().getFlowerId();
			Flower flower=flowerrepo.findOne(id);
			int time1=flower.getBoughtTimes()+1;
			flower.setBoughtTimes(time1);
			
			sold=flower.getSold()+itemQuantity;
			flower.setSold(sold);
			int newQuantity=(flower.getQuantity())-itemQuantity;
			flower.setQuantity(newQuantity);
			flowerrepo.save(flower);
			orders.add(od);
		}
		OrderList list=new OrderList();
		list.setOrderlist(orders);
		list.setEmail(user.getEmail());
		list.setAddress(user.getAddress());
		list.setAmount(amount);
		model.addAttribute("amount", amount);
		list.setCustomerName(customerName);
		Date d= new Date();
		@SuppressWarnings("deprecation")
		int month=d.getMonth();
		list.setMonth(month);
		list.setOrderDate(d);
		orderrepo.save(list);
		cart.clear();
		return "redirect:/";
	}
     @RequestMapping(value="/customer/yourorders")
     public String yourorders(Model model) {
    	 String customerName=SecurityContextHolder.getContext().getAuthentication().getName();
    	 List<OrderList> customerorders=orderrepo.findByCustomerName(customerName);	 	
    	 model.addAttribute("customer", customerorders);
	  return "your-orders";
    }
     @RequestMapping(value="/farmer/view/{id}")
     public String viewOrders(Model model,@PathVariable int id,OrderList orderlist) {
    	orderlist=orderrepo.findOne(id);
    	List<Orders> viewlist=orderlist.getOrderlist();
    	model.addAttribute("viewlist", viewlist);
		return "vieworders"; 
     }
     @RequestMapping(value="/customer/clear/{id}")
     public String removecart(@PathVariable int id,HttpSession session) {
    	 @SuppressWarnings("unchecked")
		List<Item> cart =(List<Item>)session.getAttribute("cart");
    	 int index=isExisting(id, cart);
    	 cart.remove(index);
    	 return "cart";
     }
     //Getting the edit form
     @RequestMapping(value="/update/{id}")    
     public String editForm(@PathVariable int id, Model model) throws Exception{    
         Flower flower=flowerrepo.findOne(id);  
         Blob image=flower.getImage();
 		int bloblength=(int) image.length();
 		

 		byte[] b=image.getBytes(1, bloblength);
 		String baseImage =Base64.getEncoder().encodeToString(b);
 		flower.setBase64image(baseImage);
        model.addAttribute("command",flower);  
        return "edit-flower";    
     } 
     
 	@RequestMapping(value = "/farmer/update/{id}", method=RequestMethod.POST)
 	public String updateFlower(@ModelAttribute  ("flower") Flower flower,@PathVariable int id ) throws Exception {
 		String username=SecurityContextHolder.getContext().getAuthentication().getName();
 		//Flower f=flowerrepo.findOne(id);
 		MultipartFile file=flower.getFile();
 	    byte[] ibyte=file.getBytes();	
 	    Blob blob=new SerialBlob(ibyte);
 	    flower.setImage(blob);
 		flower.setFarmersName(username);
 		flowerrepo.save(flower);		
 		return "redirect:/flower/farmer/products";
 	}
 	
 	  @RequestMapping(value="/customer/updatec", method=RequestMethod.POST)    
      public String update(@PathVariable int id, Model model,HttpSession session,HttpServletRequest request) throws Exception{    
 		 @SuppressWarnings("unchecked")
		List<Item> cart =(List<Item>)session.getAttribute("cart");
 		String []q=request.getParameterValues("q");
 		for (int i = 0; i < cart.size(); i++) {
 			cart.get(i).setItemquantity(Integer.parseInt(q[i]));			
		}
 		model.addAttribute("cart", cart);
         return "redirect:/flowers/customer/cart";    
      } 


}