package com.mvc.data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Table;

@Entity
@Table(name="OrderList")
public class OrderList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="orderNumber")
	private int orderNumber;
	private String customerName;
	private String address;
	private String email;
	private double amount;
	private int confirmed=0;
	private Date orderDate;
	private int month;
	
	
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}
	@ElementCollection(fetch = FetchType.EAGER)
	@JoinTable(name="orders",joinColumns = @JoinColumn(name="orderNumber"))
	private List<Orders> orderlist=new ArrayList<>();
	
	public List<Orders> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<Orders> cart) {
		this.orderlist = cart;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date date) {
		this.orderDate = date;
	}
	@Override
	public String toString() {
		return "OrderList [orderNumber=" + orderNumber + ", customerName=" + customerName + ", address=" + address
				+ ", email=" + email + ", amount=" + amount + ", orderDate=" + orderDate + ", orderlist=" + orderlist
				+ "]";
	}
}
