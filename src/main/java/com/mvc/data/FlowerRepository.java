package com.mvc.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FlowerRepository extends JpaRepository<Flower, Integer> {
	public List<Flower> findByFarmersName(String farmersName);
	public List<Flower> findByOrderByPriceDesc();
	public List<Flower> findByOrderByPriceAsc();
	//public List<Flower> findAllContainingOrderByPriceDesc(String name);
	//public List<Flower> findAllContainingOrderByPriceAsc(String name);
	public List<Flower> findTop10ByOrderByBoughtTimesDesc();
}
