package com.mvc.data;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="flowers")
public class Flower {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="flowerId")
	private int flowerId;
	@Column(name="name")
	private String name;
	@Column(name="quantity")
	private int quantity;
	@Column(name="price")
	private double price;
	@Column(name="description")
	private String description;
	@Column(name="image")
	private Blob image;
	@Transient
	private MultipartFile file;
	@Column(name="farmersName")
	private String farmersName;
	@Transient
	private String base64image;
	private int sold;
	private int deleted;
	@Column(name="type")
	private String type;
	private int boughtTimes;
	private String company;	
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	//Getters and setters
	public int getFlowerId() {
		return flowerId;
	}
	public void setFlowerId(int flowerId) {
		this.flowerId = flowerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getFarmersName() {
		return farmersName;
	}
	public void setFarmersName(String farmersName) {
		this.farmersName = farmersName;
	}
	
	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public int getBoughtTimes() {
		return boughtTimes;
	}
	public void setBoughtTimes(int boughtTimes) {
		this.boughtTimes = boughtTimes;
	}
	@Override
	public String toString() {
		return "Flower [flowerId=" + flowerId + ", name=" + name + ", quantity=" + quantity + ", price=" + price
				+ ", description=" + description + ", image=" + image + ", file=" + file + ", farmersName="
				+ farmersName + ", base64image=" + base64image + ", sold=" + sold + ", deleted=" + deleted + ", type="
				+ type + "]";
	}
}
