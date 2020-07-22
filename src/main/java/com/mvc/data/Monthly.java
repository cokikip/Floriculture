package com.mvc.data;

public class Monthly {
	private int month;
	private double sales=0;
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public double getSales() {
		return sales;
	}
	public void setSales(double sales) {
		this.sales = sales;
	}
	@Override
	public String toString() {
		return "Monthly [month=" + month + ", sales=" + sales + "]";
	}
}
