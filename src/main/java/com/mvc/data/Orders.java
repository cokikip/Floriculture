package com.mvc.data;

import javax.persistence.Embeddable;

@Embeddable
public class Orders {
	private String flowerName;
	private int itemquantity;
	private double subprice;
	private String farmersName;
	
	public String getFarmersName() {
		return farmersName;
	}
	public void setFarmersName(String farmersName) {
		this.farmersName = farmersName;
	}
	
	public double getSubprice() {
		return subprice;
	}
	public void setSubprice(double subprice) {
		this.subprice = subprice;
	}
	public String getFlowerName() {
		return flowerName;
	}
	public void setFlowerName(String flowerName) {
		this.flowerName = flowerName;
	}
	
	public int getItemquantity() {
		return itemquantity;
	}
	public void setItemquantity(int itemquantity) {
		this.itemquantity = itemquantity;
	}

	@Override
	public String toString() {
		return "Orders [flowerName=" + flowerName + ", itemquantity=" + itemquantity + ", subprice=" + subprice + "]";
	}

}
