package com.mju.ict.model;

import java.util.Date;

public class Discount {
//    discount_id INT PRIMARY KEY AUTO_INCREMENT,
//	  discount_name varchar(255),
//    discount_rate INT NOT NULL,
//    discount_start datetime NOT NULL,
//    discount_end datetime NOT NULL
	
	private int discount_id;
	private String discount_name;
	private int discount_rate;
	private Date discount_start;
	private Date discount_end;
	
	public int getDiscount_id() {
		return discount_id;
	}

	public void setDiscount_id(int discount_id) {
		this.discount_id = discount_id;
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

	public String getDiscount_name() {
		return discount_name;
	}

	public void setDiscount_name(String discount_name) {
		this.discount_name = discount_name;
	}

	public Date getDiscount_end() {
		return discount_end;
	}

	public void setDiscount_end(Date discount_end) {
		this.discount_end = discount_end;
	}
	
	
}
