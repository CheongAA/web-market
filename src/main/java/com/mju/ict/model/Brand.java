package com.mju.ict.model;

import java.util.Date;

public class Brand {
//	  brand_id INT PRIMARY KEY AUTO_INCREMENT,
//	  brand_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//	  brand_img varchar(200) NOT NULL,
//	  brand_name VARCHAR(255)NOT NULL,
//	  brand_desc VARCHAR(300) NOT NULL
	
	private int brand_id;
	private Date brand_created;
	private String brand_img;
	private String brand_name;
	private String brand_desc;
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public Date getBrand_created() {
		return brand_created;
	}
	public void setBrand_created(Date brand_created) {
		this.brand_created = brand_created;
	}
	public String getBrand_img() {
		return brand_img;
	}
	public void setBrand_img(String brand_img) {
		this.brand_img = brand_img;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_desc() {
		return brand_desc;
	}
	public void setBrand_desc(String brand_desc) {
		this.brand_desc = brand_desc;
	}
	

	
}
