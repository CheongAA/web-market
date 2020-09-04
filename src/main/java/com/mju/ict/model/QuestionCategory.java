package com.mju.ict.model;

public class QuestionCategory {
	
//	  question_category_id int primary key auto_increment,
//    question_category_title varchar(250) not null
	
	private int question_category_id;
	private String question_category_title;
	
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
	}
	public String getQuestion_category_title() {
		return question_category_title;
	}
	public void setQuestion_category_title(String question_category_title) {
		this.question_category_title = question_category_title;
	}
	

	
}
