package com.mju.ict.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Question;
import com.mju.ict.model.QuestionCategory;
import com.mju.ict.model.User;
import com.mju.ict.repository.IQuestionCategoryDAO;
import com.mju.ict.repository.IQuestionDAO;

@Service
public class QuestionService implements IQuestionService{

	@Autowired
	IQuestionCategoryDAO questionCategoryDAO;
	
	@Autowired
	IQuestionDAO questionDAO;

	@Override
	public List<QuestionCategory> getAllQuestionCategories() {
		return questionCategoryDAO.selectAllQuestionCategories();
	}
	
	@Override
	public List<Question> getQuestionByUser(int user_id) {
		return questionDAO.selectQuestionByUser(user_id);
	}

	@Override
	public void registerQuestion(Question question, HttpSession session) {
		User user = (User) session.getAttribute("user");
		question.setUser_id(user.getUser_id());
		
		questionDAO.insertQuestion(question);
	}

	@Override
	public Question getQuestionById(int id) {
		return questionDAO.selectQuestionById(id);
	}






}
