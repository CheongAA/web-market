package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.QuestionCategory;

@Repository
public class QuestionCategoryDAO implements IQuestionCategoryDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<QuestionCategory> selectAllQuestionCategories() {
		return sqlSession.selectList("selectAllQuestionCategories");
	}

	@Override
	public QuestionCategory selectProductQuestionCategory() {
		return sqlSession.selectOne("selectProductQuestionCategory");
	
	}
}
