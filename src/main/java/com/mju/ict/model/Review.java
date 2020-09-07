package com.mju.ict.model;

import java.util.Date;

public class Review {
//	review_id int primary key auto_increment,
//	user_id INT not null,
//	FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//    product_id int not null,
//    FOREIGN KEY(product_id) REFERENCES tb_product(product_id),
//	review_title varchar(250) not null,
//    review_created datetime default current_timestamp,
//	review_star int not null,
//    review_content varchar(255) not null,
//    review_view INT default 0 NOT NULL,
//    review_img varchar(200)
	
	private int review_id;
	private int user_id;
	private int product_id;
	private String review_title;
	private Date review_created;
	private int review_star;
	private String review_content;
	private int review_view;
	private String review_img;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public Date getReview_created() {
		return review_created;
	}
	public void setReview_created(Date review_created) {
		this.review_created = review_created;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_view() {
		return review_view;
	}
	public void setReview_view(int review_view) {
		this.review_view = review_view;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	
	
}
