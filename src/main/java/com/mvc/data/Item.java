package com.mvc.data;

public class Item {
	private Flower flower=new Flower();
	private int itemquantity;
	
	public Item(Flower flower, int itemquantity) {
		super();
		this.flower = flower;
		this.itemquantity = itemquantity;
	}
	
	public Item() {
		super();
	}

	public Flower getFlower() {
		return flower;
	}
	public void setFlower(Flower flower) {
		this.flower = flower;
	}
	public int getItemquantity() {
		return itemquantity;
	}
	public void setItemquantity(int itemquantity) {
		this.itemquantity = itemquantity;
	}

	@Override
	public String toString() {
		return "Item [flower=" + flower + ", itemquantity=" + itemquantity + "]";
	}
}
