package com.mju.ict.model;

public class Address {
//    address_id INT PRIMARY KEY AUTO_INCREMENT,
//    user_id INT NOT NULL,
//    FOREIGN KEY(user_id) REFERENCES tb_user(user_id),
//    address_zip VARCHAR(255) NOT NULL,
//    address_detail VARCHAR(255) NOT NULL,
//    address_detail2 VARCHAR(255) NOT NULL,
//    address_phone VARCHAR(255) NOT NULL,
//    address_recipient VARCHAR(255) NOT NULL,
//    address_default TINYINT(1) NOT NULL default 0

	private int address_id;
	private int user_id;
	private String address_zip;
	private String address_detail;
	private String address_detail2;
	private String address_phone;
	private String address_recipient;
	private int address_default;

	private User user;
	
	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAddress_zip() {
		return address_zip;
	}

	public void setAddress_zip(String address_zip) {
		this.address_zip = address_zip;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getAddress_detail2() {
		return address_detail2;
	}

	public void setAddress_detail2(String address_detail2) {
		this.address_detail2 = address_detail2;
	}

	public String getAddress_phone() {
		return address_phone;
	}

	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}

	public String getAddress_recipient() {
		return address_recipient;
	}

	public void setAddress_recipient(String address_recipient) {
		this.address_recipient = address_recipient;
	}

	public int getAddress_default() {
		return address_default;
	}

	public void setAddress_default(int address_default) {
		this.address_default = address_default;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
