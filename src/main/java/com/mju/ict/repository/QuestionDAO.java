package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Question;

@Repository
public class QuestionDAO implements IQuestionDAO{
    @Autowired
    private SqlSession sqlSession;

    
    
	@Override
	public List<Question> selectAllQuestions(PagingCriteria cri) {
		return sqlSession.selectList("selectAllQuestions",cri);
	}
	
	
	@Override
	public List<Question> selectQuestionByUser(int user_id) {
		return sqlSession.selectList("selectQuestionByUser",user_id);
	}


	@Override
	public Question selectQuestionById(int id) {
		return sqlSession.selectOne("selectQuestionById", id);
	}


	@Override
	public List<Question> selectQuestionByProduct(Map<String, Integer> map) {
		return sqlSession.selectList("selectQuestionByProduct",map);
	}

	@Override
	public void insertQuestion(Question question) {
		sqlSession.insert("insertQuestion", question);
	}


	@Override
	public void updateQuestionAnswerId(Map<String, Integer> map) {
		sqlSession.update("updateQuestionAnswerId", map);
	}


	@Override
	public int countQuestions() {
		return sqlSession.selectOne("countQuestions");
	}


	@Override
	public int countQuestionsByProduct(int id) {
		return sqlSession.selectOne("countQuestionsByProduct",id);
	}

}
