package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Answer;

public interface IAnswerDAO {

	public abstract List<Answer> selectAllAnswers();
	
	public abstract void insertAnswer(Answer answer);

	public abstract void deleteAnswerById(int id);


}
