package com.mju.ict.service;

import com.mju.ict.model.User;

public interface IUserService {
	abstract public void registerUser(User user); 
	abstract public User getUserByIdentification(String user_identification);
	abstract public String getUserByIdentificationBool(String user_identification);
}
