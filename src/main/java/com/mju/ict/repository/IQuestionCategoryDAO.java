package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.QuestionCategory;

public interface IQuestionCategoryDAO {

	public abstract List<QuestionCategory> selectAllQuestionCategories();

	public abstract QuestionCategory selectProductQuestionCategory();
}
