package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Question;

public interface IQuestionDAO {
	
	public abstract List<Question> selectQuestionByUser(int user_id);

	public abstract void insertQuestion(Question question);

}
