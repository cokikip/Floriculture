package com.mvc.controllers;

import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.data.Farmer;
import com.mvc.data.FarmerRepository;
import com.mvc.data.UserRepository;
import com.mvc.data.Users;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
	@Autowired
	UserRepository userrepo;
	@Autowired
	FarmerRepository farmerrepo;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerUser() {
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute Users user, Model model) {

		if (user.getRole().equals("customer")) {
			user.setRole("ROLE_CUSTOMER");

		} else {
			// user.setRole("ROLE_FARMER");
			StandardPasswordEncoder encoder = new StandardPasswordEncoder();
			String pass = encoder.encode(user.getPassword());
			user.setPassword(pass);
			userrepo.save(user);
			model.addAttribute("user", user);
			return "confirmform";
		}
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
		String pass = encoder.encode(user.getPassword());
		user.setPassword(pass);
		userrepo.save(user);
		Authentication auth = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(Users user, Model model) {
		String customerName = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userrepo.findOne(customerName);
		model.addAttribute("userdetail", user);
		return "update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatesave(Users user, HttpServletRequest req) {
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String customerName = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userrepo.findOne(customerName);
		user.setAddress(address);
		user.setEmail(email);
		user.setPhoneNo(phone);
		userrepo.save(user);
		return "redirect:/";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String confirmform(@ModelAttribute Farmer farmer, @ModelAttribute("user") Users user) throws Exception {
		farmer.setUserId(user.getUsername());
		MultipartFile file = farmer.getFile();
		byte[] ibyte = file.getBytes();
		Blob blob = new SerialBlob(ibyte);
		farmer.setImage(blob);
		farmer.setEmail(user.getEmail());
		farmer.setAddress(user.getAddress());
		user.setCompany(farmer.getCompany());
		farmer.setFarmersName(user.getFirstname() + " " + user.getLastName());
		userrepo.save(user);
		farmerrepo.save(farmer);
		return "redirect:/";
	}

	@RequestMapping(value = "/guide")
	public String help() {
		return "guide";
	}

	@RequestMapping(value = "/aboutus")
	public String about() {
		return "about";
	}

	@RequestMapping(value = "/about/register")
	public String aboutre() {
		return "aboutregister";
	}
	
	@RequestMapping(value = "/about/item")
	public String aboutitem() {
		return "aboutitem";
	}
}
