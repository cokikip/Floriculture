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
@Table(name="farmer")
public class Farmer {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="image")
	private Blob image;
	private String email;
	private String address;
	@Transient
	private MultipartFile file;
	@Transient
	private String base64image;
	private int confirmed=0;
	private String userId;
	private String farmersName;
	@Transient
	private String company;
	
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFarmersName() {
		return farmersName;
	}
	public void setFarmersName(String farmersName) {
		this.farmersName = farmersName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}
	@Override
	public String toString() {
		return "Farmer [id=" + id + ", image=" + image + ", email=" + email + ", address=" + address + ", file=" + file
				+ ", base64image=" + base64image + ", confirmed=" + confirmed + ", userId=" + userId + ", farmersName="
				+ farmersName + "]";
	}	
}
