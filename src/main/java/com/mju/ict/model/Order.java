package com.mju.ict.model;

import java.util.Date;

public class Order {
//    order_id INT PRIMARY KEY AUTO_INCREMENT,
//    user_id INT,
//    FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//    address_id INT NOT NULL,
//    FOREIGN KEY(address_id) REFERENCES tb_address(address_id),
//    order_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//    buyer_name varchar(255) NOT NULL,
//    buyer_email varchar(255) NOT NULL,
//    buyer_phone varchar(255) NOT NULL,
//    payment_method varchar(255) NOT NULL,
//    order_total_price INT NOT NULL,
//    order_state VARCHAR(255) NOT NULL
	
	private int order_id;
	private int user_id;
	private int address_id;
	private Date order_created;
	private String buyer_name;
	private String buyer_email;
	private String buyer_phone;
	private String payment_method;
	private int order_total_price;
	private String order_state;
	
	private User user;
	private Product product;
	private Address address;
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
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public Date getOrder_created() {
		return order_created;
	}
	public void setOrder_created(Date order_created) {
		this.order_created = order_created;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	

}
