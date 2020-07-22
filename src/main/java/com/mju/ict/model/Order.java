package com.mju.ict.model;

import java.util.Date;

public class Order {
//    order_id INT PRIMARY KEY AUTO_INCREMENT,
//    user_id INT,
//    FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//    product_id INT NOT NULL,
//    FOREIGN KEY(product_id) REFERENCES tb_product(product_id),
//    order_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//    order_total_price INT NOT NULL,
//    order_state VARCHAR(255) NOT NULL
	
	private int order_id;
	private int user_id;
	private int product_id;
	private Date order_created;
	private int order_total_price;
	private String order_state;
	
	private User user;
	private Product product;
	
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
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Date getOrder_created() {
		return order_created;
	}
	public void setOrder_created(Date order_created) {
		this.order_created = order_created;
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
