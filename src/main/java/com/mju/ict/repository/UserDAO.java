package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.User;

@Repository
public class UserDAO implements IUserDAO{
	
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<User> selectAllUsers() {
		return sqlSession.selectList("selectAllUsers");
	}

	@Override
	public User selectUserByIdentification(String user_identification) {
		return sqlSession.selectOne("selectUserByIdentification",user_identification);
	}

	@Override
	public User selectUserById(int id) {
		return sqlSession.selectOne("selectUserById",id);
	}

	@Override
	public int selectIdByIdentification(String user_identification) {
		return sqlSession.selectOne("selectIdByIdentification",user_identification);
	}
	
	@Override
	public void insertUser(User user) {
		sqlSession.insert("insertUser",user);
	}

	@Override
	public void updateUser(User user) {
		sqlSession.update("updateUser", user);
	}
	
	@Override
	public void updateUserPassword(User user) {
		sqlSession.update("updateUserPassword", user);
	}


	@Override
	public void deleteUserById(int id) {
		sqlSession.delete("deleteUserById", id);
	}


}
