package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Question;

@Repository
public class QuestionDAO implements IQuestionDAO{
    @Autowired
    private SqlSession sqlSession;

    
	@Override
	public List<Question> selectQuestionByUser(int user_id) {
		return sqlSession.selectList("selectQuestionByUser",user_id);
	}

	
	@Override
	public void insertQuestion(Question question) {
		sqlSession.insert("insertQuestion", question);
	}


	@Override
	public Question selectQuestionById(int id) {
		return sqlSession.selectOne("selectQuestionById", id);
	}



}
