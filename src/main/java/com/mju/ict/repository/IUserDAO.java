package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.User;

public interface IUserDAO {
	public abstract void insertUser(User user); 
	public abstract User selectUserByIdentification(String user_identification);
	public abstract List<User> selectAllUsers();
	public abstract User selectUserById(int id);
	public abstract int selectIdByIdentification(String user_identification);

}
