package com.mju.ict.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Answer;
import com.mju.ict.repository.IAnswerDAO;
import com.mju.ict.repository.IQuestionDAO;

@Service
public class AnswerService implements IAnswerService{

	@Autowired
	IAnswerDAO answerDAO;
	
	@Autowired
	IQuestionDAO questionDAO;

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
	public void deleteAnswerById(int id) {
		answerDAO.deleteAnswerById(id);
	}





}
