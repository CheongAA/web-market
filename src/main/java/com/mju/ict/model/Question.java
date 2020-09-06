package com.mju.ict.model;

import java.util.Date;

public class Question {
//	question_id int primary key auto_increment,
//	user_id INT not null,
//	FOREIGN KEY(user_id) REFERENCES tb_user(user_id) on delete cascade,
//	question_category_id INT not null,
//	FOREIGN KEY(question_category_id) REFERENCES tb_question_category(question_category_id) on delete cascade,
//    order_id int default null,
//    FOREIGN KEY(order_id) REFERENCES tb_order(order_id) on delete cascade,
//	product_id int default null,
//    FOREIGN KEY(product_id) REFERENCES tb_product(product_id) on delete cascade,
//	answer_id int default null,
//    FOREIGN KEY(answer_id) REFERENCES tb_answer(answer_id) on delete set null,
//    question_created datetime default current_timestamp,
//    question_title varchar(250) not null,
//    question_content varchar(255) not null,
//    question_phone varchar(250) default null
	
	private int question_id;
	private int user_id;
	private int question_category_id;
	private int order_id;
	private int product_id;
	private int answer_id;
	
	private Date question_created;
	private String question_title;
	private String question_content;
	private String question_phone;
	
	private QuestionCategory questionCategory;
	private Order order;
	private Product product;
	private Answer answer;
	private User user;
	
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public Date getQuestion_created() {
		return question_created;
	}
	public void setQuestion_created(Date question_created) {
		this.question_created = question_created;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getQuestion_phone() {
		return question_phone;
	}
	public void setQuestion_phone(String question_phone) {
		this.question_phone = question_phone;
	}
	public QuestionCategory getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(QuestionCategory questionCategory) {
		this.questionCategory = questionCategory;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Answer getAnswer() {
		return answer;
	}
	public void setAnswer(Answer answer) {
		this.answer = answer;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	

	
}
