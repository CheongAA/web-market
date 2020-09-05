package com.mju.ict.service;

import java.util.ArrayList;
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
		List<Answer> answers = answerDAO.selectAllAnswers();
		List<Answer> result = new ArrayList<Answer>();
		
		for(Answer a:answers) {
			if((Integer)a.getQuestion_id() == 0) {
				result.add(a);
			}
		}
		return result;
	}

	@Override
	public void deleteAnswerById(int id) {
		answerDAO.deleteAnswerById(id);
	}



}
