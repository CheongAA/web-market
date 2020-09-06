package com.mju.ict.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mju.ict.model.Question;
import com.mju.ict.model.QuestionCategory;

public interface IQuestionService {
	
	public abstract List<QuestionCategory> getAllQuestionCategories();
	
	public abstract QuestionCategory getProductQuestionCategory();

	public abstract List<Question> getQuestionByUser(int user_id);
	
	public abstract List<Question> getQuestionByProduct(int id);
	
	public abstract Question getQuestionById(int id);

	public abstract void registerQuestion(Question question, HttpSession session);

}
