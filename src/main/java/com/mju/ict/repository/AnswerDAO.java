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
	public Answer selectAnswerById(int id) {
		return sqlSession.selectOne("selectAnswerById",id);
	}

	
	@Override
	public void insertAnswer(Answer answer) {
		sqlSession.insert("insertAnswer",answer);
	}
	
	@Override
	public void updateAnswer(Answer answer) {
		sqlSession.update("updateAnswer", answer);
	}

	@Override
	public void deleteAnswerById(int id) {
		sqlSession.delete("deleteAnswerById",id);
	}











}
