package com.mju.ict.model;

import java.util.ArrayList;
import java.util.Date;

public class Order {
//	  order_id INT PRIMARY KEY AUTO_INCREMENT,
//	  user_id INT,
//	  FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//	  order_state_id int NOT NULL,
//	  FOREIGN KEY(order_state_id) REFERENCES tb_order_state(order_state_id),
//	  buyer_name varchar(255) NOT NULL,
//	  buyer_email varchar(255) NOT NULL,
//	  buyer_phone varchar(255) NOT NULL,
//	  recipient_name varchar(255) NOT NULL,
//	  recipient_zip VARCHAR(255) NOT NULL,
//	  recipient_address VARCHAR(255) NOT NULL,
//	  recipient_phone VARCHAR(255) NOT NULL,
//	  order_request VARCHAR(255),
//	  order_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//	  order_payment_method varchar(255) NOT NULL,
//	  order_products_price INT NOT NULL,
//	  order_discount_price INT NOT NULL,
//	  order_delivery_price INT NOT NULL,
//	  order_total_price INT NOT NULL,
//	  order_tracking_number varchar(255)
	
	private int order_id;
	private int user_id;
	private int order_state_id;
	private String buyer_name;
	private String buyer_email;
	private String buyer_phone;
	private String recipient_name;
	private String recipient_zip;
	private String recipient_address;
	private String recipient_phone;
	private String order_request;
	
	private Date order_created;
	private String order_payment_method;
	private int order_products_price;
	private int order_discount_price;
	private int order_delivery_price;
	private int order_total_price;
	private String order_tracking_number;
	
	private ArrayList<OrderDetail> orderDetail;
	private OrderState orderState;

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

	public String getOrder_payment_method() {
		return order_payment_method;
	}

	public void setOrder_payment_method(String order_payment_method) {
		this.order_payment_method = order_payment_method;
	}

	public int getOrder_products_price() {
		return order_products_price;
	}

	public void setOrder_products_price(int order_products_price) {
		this.order_products_price = order_products_price;
	}

	public int getOrder_discount_price() {
		return order_discount_price;
	}

	public void setOrder_discount_price(int order_discount_price) {
		this.order_discount_price = order_discount_price;
	}

	public int getOrder_delivery_price() {
		return order_delivery_price;
	}

	public void setOrder_delivery_price(int order_delivery_price) {
		this.order_delivery_price = order_delivery_price;
	}

	public int getOrder_total_price() {
		return order_total_price;
	}

	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}

	public ArrayList<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(ArrayList<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public int getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
	}

	public String getOrder_tracking_number() {
		return order_tracking_number;
	}

	public void setOrder_tracking_number(String order_tracking_number) {
		this.order_tracking_number = order_tracking_number;
	}

	public OrderState getOrderState() {
		return orderState;
	}

	public void setOrderState(OrderState orderState) {
		this.orderState = orderState;
	}

	
	

}
