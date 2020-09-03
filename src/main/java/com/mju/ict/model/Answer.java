package com.mju.ict.model;

import java.util.Date;

public class Answer {
//	answer_id int primary key auto_increment,
//    answer_created datetime default current_timestamp,
//    answer_category varchar(250) not null,
//    answer_title varchar(250) not null,
//    answer_content varchar(255) not null
//    is_faq tinyint(1) not null default 0
	
	private int answer_id;
	private String answer_category;
	private String answer_title;
	private Date answer_created;
	private String answer_content;
	private int is_faq;
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public String getAnswer_category() {
		return answer_category;
	}
	public void setAnswer_category(String answer_category) {
		this.answer_category = answer_category;
	}
	public String getAnswer_title() {
		return answer_title;
	}
	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}
	public Date getAnswer_created() {
		return answer_created;
	}
	public void setAnswer_created(Date answer_created) {
		this.answer_created = answer_created;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public int getIs_faq() {
		return is_faq;
	}
	public void setIs_faq(int is_faq) {
		this.is_faq = is_faq;
	}
	
	

	
}
