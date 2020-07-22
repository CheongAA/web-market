package com.mju.ict.model;

public class Category {
//    category_code INT PRIMARY KEY NOT NULL,
//    category_code2 int,
//    FOREIGN KEY(category_code2) REFERENCES tb_category(category_code),
//    category_name VARCHAR(255)NOT NULL
//    category_depth int(2) not null
	
	private int category_code;
	private int category_code2;
	private String category_name;
	private int category_depth;
	
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public int getCategory_code2() {
		return category_code2;
	}
	public void setCategory_code2(int category_code2) {
		this.category_code2 = category_code2;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getCategory_depth() {
		return category_depth;
	}
	public void setCategory_depth(int category_depth) {
		this.category_depth = category_depth;
	}
	
	
}
