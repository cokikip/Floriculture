package com.mvc.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlowerService {
	@Autowired
	private FlowerRepository repo;
	
	public void save(Flower flower) {
		this.repo.save(flower);
	}
}
