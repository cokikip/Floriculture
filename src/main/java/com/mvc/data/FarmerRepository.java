package com.mvc.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FarmerRepository extends JpaRepository<Farmer, Integer> {
	public List<Farmer> findByConfirmed(int confirmed);
	public Farmer findByUserId(String id);
}
