package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.User;

public interface IUserDAO {

	public abstract List<User> selectAllUsers(PagingCriteria cri);
		
	public abstract User selectUserByIdentification(String user_identification);
	
	public abstract User selectUserById(int id);
	
	public abstract int selectIdByIdentification(String user_identification);
	
	public abstract void insertUser(User user); 
	
	public abstract void updateUser(User user);
	
	public abstract void updateUserPassword(User user);

	public abstract void deleteUserById(int id);

	public abstract int countUsers();



}
