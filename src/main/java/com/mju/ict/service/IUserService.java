package com.mju.ict.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mju.ict.model.User;

public interface IUserService {
	
	public abstract List<User> getAllUsers();
	
	public abstract User getUserByIdentification(String user_identification);
	
	public abstract User getUserById(int id);
	
	public abstract int getIdByIdentification(String user_identification);
	
	public abstract void registerUser(User user); 
	
	public abstract User updateUser(User user);
	
	public abstract User updateUserPassword(User user);
	
	public abstract User loginUser(String identification, String password, int rememberId, HttpServletResponse response);

	public abstract User checkUser(String identification, String password);

	public abstract void deleteUserById(int id);


}
