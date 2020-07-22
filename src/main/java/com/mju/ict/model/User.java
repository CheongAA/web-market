package com.mju.ict.model;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
//    user_id INT PRIMARY KEY AUTO_INCREMENT,
//	  user_identification VARCHAR(255) NOT NULL unique key,
//    user_email VARCHAR(255)NOT NULL,
//    user_name VARCHAR(255) NOT NULL,
//    user_created DATETIME DEFAULT CURRENT_TIMESTAMP,
//    user_birth VARCHAR(255) ,
//    user_password VARCHAR(255)NOT NULL,
//    user_gender VARCHAR(255)NOT NULL,
//    user_phone VARCHAR(255)NOT NULL,
//    user_zip VARCHAR(255) NOT NULL,
//    user_address VARCHAR(255) NOT NULL,
//    user_address2 VARCHAR(255) NOT NULL,
//    user_level TINYINT(1) NOT NULL default 0

	private int user_id;
	private Date user_created;
	private int user_level;
	private String user_birth;
	
	
	@NotEmpty 
	@Pattern(regexp = "^[a-zA-Z0-9]{4,12}$",message = "아이디")
	private String user_identification;
	
	@NotEmpty
	@Email
	private String user_email;
	
	@NotEmpty
	@Pattern(regexp = "^[가-힣a-zA-Z]{2,10}$",message = "이름")
	private String user_name;


	@NotEmpty
	@Pattern(regexp = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$",message = "비밀번호")
	private String user_password;

	@NotEmpty
	private String user_gender;
	
	@NotEmpty
	@Pattern(regexp = "^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$",message = "번호")
	private String user_phone;

	@NotEmpty
	private String user_zip;

	@NotEmpty
	private String user_address;

	@NotEmpty
	@Size(min = 1,max = 50, message="상세주소")
	private String user_address2;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Date getUser_created() {
		return user_created;
	}

	public void setUser_created(Date user_created) {
		this.user_created = user_created;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_zip() {
		return user_zip;
	}

	public void setUser_zip(String user_zip) {
		this.user_zip = user_zip;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_address2() {
		return user_address2;
	}

	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}

	public String getUser_identification() {
		return user_identification;
	}

	public void setUser_identification(String user_identification) {
		this.user_identification = user_identification;
	}


}
