package com.mju.ict.model;

import java.util.Date;

public class Discount {
//    discount_id INT PRIMARY KEY AUTO_INCREMENT,
//	  discount_name varchar(255),
//    discount_rate INT NOT NULL,
//    discount_start datetime NOT NULL,
//    discount_end datetime NOT NULL
	
	
//	  discount_id INT PRIMARY KEY AUTO_INCREMENT,
//	  discount_name varchar(255) NOT NULL,
//	  discount_desc VARCHAR(255) NOT NULL,
//	  discount_explanation VARCHAR(255) NOT NULL,
//	  discount_thumbnailImg varchar(200) NOT NULL,
//	  discount_mainImg varchar(200) NOT NULL,
//	  discount_rate INT NOT NULL,
//	  discount_start datetime NOT NULL,
//	  discount_end datetime NOT NULL
	
	private int discount_id;
	private String discount_name;
	private String discount_desc;
	private String discount_explanation;
	private String discount_thumbnailImg;
	private String discount_mainImg;
	private int discount_rate;
	private Date discount_start;
	private Date discount_end;
	
	public int getDiscount_id() {
		return discount_id;
	}
	public void setDiscount_id(int discount_id) {
		this.discount_id = discount_id;
	}
	public String getDiscount_name() {
		return discount_name;
	}
	public void setDiscount_name(String discount_name) {
		this.discount_name = discount_name;
	}
	public String getDiscount_desc() {
		return discount_desc;
	}
	public void setDiscount_desc(String discount_desc) {
		this.discount_desc = discount_desc;
	}
	public String getDiscount_explanation() {
		return discount_explanation;
	}
	public void setDiscount_explanation(String discount_explanation) {
		this.discount_explanation = discount_explanation;
	}
	public String getDiscount_thumbnailImg() {
		return discount_thumbnailImg;
	}
	public void setDiscount_thumbnailImg(String discount_thumbnailImg) {
		this.discount_thumbnailImg = discount_thumbnailImg;
	}
	public String getDiscount_mainImg() {
		return discount_mainImg;
	}
	public void setDiscount_mainImg(String discount_mainImg) {
		this.discount_mainImg = discount_mainImg;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public Date getDiscount_start() {
		return discount_start;
	}
	public void setDiscount_start(Date discount_start) {
		this.discount_start = discount_start;
	}
	public Date getDiscount_end() {
		return discount_end;
	}
	public void setDiscount_end(Date discount_end) {
		this.discount_end = discount_end;
	}
	

	
}
