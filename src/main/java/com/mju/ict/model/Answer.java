package com.mju.ict.model;

import java.util.Date;

public class Answer {
//	answer_id int primary key auto_increment,
//	question_id INT,
//	FOREIGN KEY(question_id) REFERENCES tb_question(question_id),
//	question_category_id INT not null,
//	FOREIGN KEY(question_category_id) REFERENCES tb_question_category(question_category_id),
//    answer_created datetime default current_timestamp,
//    answer_title varchar(250) not null,
//    answer_content varchar(255) not null
	
	private int answer_id;
	private int question_id;
	private int question_category_id;
	private String answer_title;
	private Date answer_created;
	private String answer_content;
	
	private QuestionCategory questionCategory;
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
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
	public QuestionCategory getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(QuestionCategory questionCategory) {
		this.questionCategory = questionCategory;
	}

	
}
