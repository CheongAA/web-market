package com.mju.ict.model;

import java.util.Date;


public class Product {
//	   product_id INT PRIMARY KEY AUTO_INCREMENT,
//	   brand_id INT NOT NULL,
//	   FOREIGN KEY(brand_id) REFERENCES tb_brand(brand_id)  on delete cascade,
//	   category_code INT NOT NULL,
//	   FOREIGN KEY(category_code) REFERENCES tb_category(category_code)  on delete cascade,
//	   discount_id INT default null,
//	   FOREIGN KEY(discount_id) REFERENCES tb_discount(discount_id)  on delete set null,	
//	   product_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//	   product_name VARCHAR(255)NOT NULL,
//	   product_price INT NOT NULL,
//	   product_quantity INT NOT NULL,
//	   product_sales_quantity INT NOT NULL default 0,
//	   product_desc VARCHAR(300) NOT NULL,
//	   product_material VARCHAR(255)NOT NULL,
//	   product_volume INT NOT NULL,
//	   on_sale TINYINT(1) NOT NULL default 0,
//	   product_descImg varchar(200) NOT NULL,
//	   product_img varchar(200) NOT NULL
//	
	private int product_id;
	private int brand_id;
	private int category_code;
	private int discount_id;
	private Date product_created;
	private String product_name;
	private int product_price;
	private int product_quantity;
	private int product_sales_quantity;
	private String product_desc;
	private String product_material;
	private int product_volume;
	private int on_sale;
	private String product_img;
	private String product_descImg;
	
	private Brand brand;
	private Category category;
	private Discount discount;
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
	public int getDiscount_id() {
		return discount_id;
	}
	public void setDiscount_id(int discount_id) {
		this.discount_id = discount_id;
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
	public int getProduct_sales_quantity() {
		return product_sales_quantity;
	}
	public void setProduct_sales_quantity(int product_sales_quantity) {
		this.product_sales_quantity = product_sales_quantity;
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
	public int getOn_sale() {
		return on_sale;
	}
	public void setOn_sale(int on_sale) {
		this.on_sale = on_sale;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_descImg() {
		return product_descImg;
	}
	public void setProduct_descImg(String product_descImg) {
		this.product_descImg = product_descImg;
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
	public Discount getDiscount() {
		return discount;
	}
	public void setDiscount(Discount discount) {
		this.discount = discount;
	}
	

}
