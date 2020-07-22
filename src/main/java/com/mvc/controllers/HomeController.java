package com.mvc.controllers;

import java.sql.Blob;
import java.util.Base64;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mvc.data.Flower;
import com.mvc.data.FlowerRepository;
import com.mvc.data.UserRepository;
import com.mvc.data.Users;

@Controller
@SessionAttributes("user")
public class HomeController {

	@Autowired
	FlowerRepository flowerrepo;
	@Autowired
	UserRepository userrepo;

	@RequestMapping(value = "/")
	public String goHome(Model model, Pageable pageable, Users user) throws Exception {
		String customerName = SecurityContextHolder.getContext().getAuthentication().getName();
		user = userrepo.findOne(customerName);
		Collection<? extends GrantedAuthority> role = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();
		List<Flower> flowers = flowerrepo.findAll();
		for (Flower flower : flowers) {
			Blob image = flower.getImage();
			int bloblength = (int) image.length();
			byte[] b = image.getBytes(1, bloblength);
			String baseImage = Base64.getEncoder().encodeToString(b);
			flower.setBase64image(baseImage);
		}
		model.addAttribute("page", flowers);
		if (SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken) {
			return "home";
		} else {
			for (GrantedAuthority r : role) {
				if (r.getAuthority().equalsIgnoreCase("ROLE_ADMIN")) {
					return "redirect:/admin/confirm";
				} else {
					return "home";
				}
			}
		}
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/confirm")
	public String confirm() {
		return "confirm";
	}

}
