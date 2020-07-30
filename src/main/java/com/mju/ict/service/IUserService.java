package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.User;

public interface IUserService {
	public abstract void registerUser(User user); 
	public abstract User getUserByIdentification(String user_identification);
	public abstract String getUserByIdentificationBool(String user_identification);
	public abstract List<User> getAllUsers();
	public abstract User getUserById(int id);
	public abstract int getIdByIdentification(String user_identification);
}
