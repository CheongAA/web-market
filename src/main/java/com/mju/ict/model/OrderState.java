package com.mju.ict.model;

public class OrderState {
	
//	 order_state_id int primary key auto_increment,
//    order_state_title varchar(250) not null
	
	private int order_state_id;
	private String order_state_title;
	public int getOrder_state_id() {
		return order_state_id;
	}
	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
	}
	public String getOrder_state_title() {
		return order_state_title;
	}
	public void setOrder_state_title(String order_state_title) {
		this.order_state_title = order_state_title;
	}
	


	
}
