package com.mju.ict.model;

public class OrderDetail {
//	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
//	order_id INT not null,
//    FOREIGN KEY(order_id) REFERENCES tb_order(order_id),
//    product_id int not null,
//    FOREIGN KEY(product_id) REFERENCES tb_product(product_id),
//    product_count int not null,
//    product_price int not null
	
	private int order_detail_id;
	private int order_id;
	private int product_id;
	private int product_count;
	private int product_price;
	
	private Product product;
	
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	

}
