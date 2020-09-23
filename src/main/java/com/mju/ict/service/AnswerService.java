package com.mju.ict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Answer;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.repository.IAnswerDAO;
import com.mju.ict.repository.IQuestionDAO;

@Service
public class AnswerService implements IAnswerService{

	@Autowired
	IAnswerDAO answerDAO;
	
	@Autowired
	IQuestionDAO questionDAO;

	@Override
	public List<Answer> getFaqAnswers(PagingCriteria cri) {
		return answerDAO.selectFaqAnswers(cri);
	}
	
	@Override
	public Answer getAnswerById(int id) {
		return answerDAO.selectAnswerById(id);
	}

	
	@Override
	public void registerAnswer(Answer answer, int question_id) {
		answerDAO.insertAnswer(answer);
		
		if(question_id != 0) {
			Map<String,Integer> map = new HashMap<String,Integer>();				   
			map.put("question_id", question_id);
			map.put("answer_id", answer.getAnswer_id());
			
			questionDAO.updateQuestionAnswerId(map);
		}
		
	}
	
	@Override
	public void updateAnswer(Answer answer) {
		answerDAO.updateAnswer(answer);
	}

	@Override
	public void deleteAnswerById(int id) {
		answerDAO.deleteAnswerById(id);
	}

	@Override
	public int countFaqAnswers() {
		return answerDAO.countFaqAnswers();
	}



}
