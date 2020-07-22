package com.mvc.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;
	
	public void save(Users user) {
		this.repo.save(user);
		}
}
