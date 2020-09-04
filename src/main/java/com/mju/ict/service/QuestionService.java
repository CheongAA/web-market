package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.QuestionCategory;
import com.mju.ict.repository.IQuestionCategoryDAO;

@Service
public class QuestionService implements IQuestionService{

	@Autowired
	IQuestionCategoryDAO questionCategoryDAO;

	@Override
	public List<QuestionCategory> getAllQuestionCategories() {
		return questionCategoryDAO.selectAllQuestionCategories();
	}




}
