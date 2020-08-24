package com.mju.ict.model;

import java.util.Date;

public class Order {
//	   order_id INT PRIMARY KEY AUTO_INCREMENT,
//	   user_id INT,
//	   FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//	   buyer_name varchar(255) NOT NULL,
//	   buyer_email varchar(255) NOT NULL,
//	   buyer_phone varchar(255) NOT NULL,
//	   recipient_name varchar(255) NOT NULL,
//	   recipient_zip VARCHAR(255) NOT NULL,
//	   recipient_address VARCHAR(255) NOT NULL,
//	   recipient_phone VARCHAR(255) NOT NULL,
//	   order_request VARCHAR(255),
//	   order_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//	   payment_method varchar(255) NOT NULL,
//	   order_total_price INT NOT NULL,
//	   order_state VARCHAR(255) NOT NULL
	
	private int order_id;
	private int user_id;
	private String buyer_name;
	private String buyer_email;
	private String buyer_phone;
	private String recipient_name;
	private String recipient_zip;
	private String recipient_address;
	private String recipient_phone;
	private String order_request;
	
	private Date order_created;
	private String payment_method;
	private int order_total_price;
	private String order_state;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_phone() {
		return buyer_phone;
	}
	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getRecipient_zip() {
		return recipient_zip;
	}
	public void setRecipient_zip(String recipient_zip) {
		this.recipient_zip = recipient_zip;
	}
	public String getRecipient_address() {
		return recipient_address;
	}
	public void setRecipient_address(String recipient_address) {
		this.recipient_address = recipient_address;
	}
	public String getRecipient_phone() {
		return recipient_phone;
	}
	public void setRecipient_phone(String recipient_phone) {
		this.recipient_phone = recipient_phone;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	public Date getOrder_created() {
		return order_created;
	}
	public void setOrder_created(Date order_created) {
		this.order_created = order_created;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	
	

}
