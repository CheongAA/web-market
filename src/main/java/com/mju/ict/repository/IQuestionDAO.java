package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Question;

public interface IQuestionDAO {
	
	public abstract List<Question> selectAllQuestions(PagingCriteria cri);
	
	public abstract List<Question> selectQuestionByUser(int user_id);
	
	public abstract Question selectQuestionById(int id);
	
	public abstract List<Question> selectQuestionByProduct(Map<String, Integer> map);

	public abstract void insertQuestion(Question question);

	public abstract void updateQuestionAnswerId(Map<String, Integer> map);

	public abstract int countQuestions();

	public abstract int countQuestionsByProduct(int id);

}
