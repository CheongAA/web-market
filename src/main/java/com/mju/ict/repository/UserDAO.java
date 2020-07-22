package com.mju.ict.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.User;

@Repository
public class UserDAO implements IUserDAO{
	
    @Autowired
    private SqlSession sqlSession;

	@Override
	public void insertUser(User user) {
		sqlSession.insert("insertUser",user);
	}

	@Override
	public User selectUserByIdentification(String user_identification) {
		return sqlSession.selectOne("selectUserByIdentification",user_identification);
	}

}
