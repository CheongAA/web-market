package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Answer;

public interface IAnswerDAO {

	public abstract List<Answer> selectFaqAnswers();

	public abstract void deleteAnswerById(int id);
}
