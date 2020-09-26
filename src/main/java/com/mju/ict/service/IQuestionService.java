package com.mju.ict.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Question;
import com.mju.ict.model.QuestionCategory;

public interface IQuestionService {
	
	public abstract List<QuestionCategory> getAllQuestionCategories();
	
	public abstract QuestionCategory getProductQuestionCategory();
	
	public abstract List<Question> getAllQuestion(PagingCriteria cri);

	public abstract List<Question> getQuestionByUser(int user_id);
	
	public abstract List<Question> getQuestionByProduct(int product_id, PagingCriteria cri);
	
	public abstract Question getQuestionById(int id);

	public abstract void registerQuestion(Question question, HttpSession session);

	public abstract int countQuestions();

	public abstract int countQuestionsByProduct(int id);



}
