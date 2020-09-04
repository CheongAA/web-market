package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Answer;

public interface IAnswerService {

	public abstract List<Answer> getFaqAnswers();

	public abstract void deleteAnswerById(int id);
	
}
