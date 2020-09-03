package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Answer;
import com.mju.ict.repository.IAnswerDAO;

@Service
public class AnswerService implements IAnswerService{

	@Autowired
	IAnswerDAO answerDAO;

	@Override
	public List<Answer> getFaqAnswers() {
		return answerDAO.selectFaqAnswers();
	}



}
