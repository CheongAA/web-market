package com.mju.ict.model;

import java.util.Date;


public class Product {
//    product_id INT PRIMARY KEY AUTO_INCREMENT,
//    brand_id INT NOT NULL,
//    FOREIGN KEY(brand_id) REFERENCES tb_brand(brand_id),
//    category_code INT NOT NULL,
//    FOREIGN KEY(category_code) REFERENCES tb_category(category_code),
//    product_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//    product_name VARCHAR(255)NOT NULL,
//    product_price INT NOT NULL,
//    product_quantity INT NOT NULL,
//    product_desc VARCHAR(300) NOT NULL,
//    product_material VARCHAR(255)NOT NULL,
//    product_volume INT NOT NULL,
//    on_discount TINYINT(1) NOT NULL,
//    on_sale TINYINT(1) NOT NULL
	
	private int product_id;
	private int brand_id;
	private int category_code;
	private Date product_created;
	private String product_name;
	private int product_price;
	private int product_quantity;
	private String product_desc;
	private String product_material;
	private int product_volume;
	private int on_discount;
	private int on_sale;
	
	private Brand brand;
	private Category category;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public Date getProduct_created() {
		return product_created;
	}
	public void setProduct_created(Date product_created) {
		this.product_created = product_created;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getProduct_desc() {
		return product_desc;
	}
	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}
	public String getProduct_material() {
		return product_material;
	}
	public void setProduct_material(String product_material) {
		this.product_material = product_material;
	}
	public int getProduct_volume() {
		return product_volume;
	}
	public void setProduct_volume(int product_volume) {
		this.product_volume = product_volume;
	}
	public int getOn_discount() {
		return on_discount;
	}
	public void setOn_discount(int on_discount) {
		this.on_discount = on_discount;
	}
	public int getOn_sale() {
		return on_sale;
	}
	public void setOn_sale(int on_sale) {
		this.on_sale = on_sale;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
}
