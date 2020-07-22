package com.mvc.data;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderListRepository extends JpaRepository<OrderList, Integer> {
	public List<OrderList> findByCustomerName(String customerName);
	public List<OrderList> findByMonth(int month);
}
