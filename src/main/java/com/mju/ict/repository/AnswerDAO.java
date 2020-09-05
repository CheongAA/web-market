package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Answer;

@Repository
public class AnswerDAO implements IAnswerDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Answer> selectAllAnswers() {
		return sqlSession.selectList("selectAllAnswers");
	}

	@Override
	public void deleteAnswerById(int id) {
		sqlSession.delete("deleteAnswerById",id);
	}




}