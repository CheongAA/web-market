package com.mju.ict.model;

public class Cart {
//    cart_id INT PRIMARY KEY AUTO_INCREMENT,
//    user_id INT,
//    FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//    product_id INT NOT NULL,
//    FOREIGN KEY(product_id) REFERENCES tb_product(product_id),
//    product_count INT NOT NULL

	private int cart_id;
	private int user_id;
	private int product_id;
	private int product_count;

	private User user;
	private Product product;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
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


}
