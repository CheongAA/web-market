package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Answer;

public interface IAnswerService {

	public abstract List<Answer> getFaqAnswers();
	
	public abstract Answer getFaqAnswerById(int id);
	
	public abstract void registerAnswer(Answer answer, int question_id);

	public abstract void deleteAnswerById(int id);



}
