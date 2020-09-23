package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Answer;
import com.mju.ict.model.PagingCriteria;

public interface IAnswerDAO {

	public abstract List<Answer> selectAllAnswers();
	
	public abstract Answer selectAnswerById(int id);
	
	public abstract void insertAnswer(Answer answer);

	public abstract void updateAnswer(Answer answer);
	
	public abstract void deleteAnswerById(int id);

	public abstract int countFaqAnswers();

	public abstract List<Answer> selectFaqAnswers(PagingCriteria cri);


}
