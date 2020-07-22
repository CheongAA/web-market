package com.mju.ict.repository;

import com.mju.ict.model.User;

public interface IUserDAO {
	abstract public void insertUser(User user); 
	abstract public User selectUserByIdentification(String user_identification);

}
