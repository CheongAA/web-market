package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Answer;
import com.mju.ict.model.PagingCriteria;

public interface IAnswerService {

	public abstract List<Answer> getFaqAnswers(PagingCriteria cri);
	
	public abstract Answer getAnswerById(int id);
	
	public abstract void registerAnswer(Answer answer, int question_id);
	
	public abstract void updateAnswer(Answer answer);

	public abstract void deleteAnswerById(int id);

	public abstract int countFaqAnswers();







}
