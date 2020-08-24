package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.User;
import com.mju.ict.repository.IUserDAO;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserDAO userDAO;

	@Override
	public void registerUser(User user) {
		userDAO.insertUser(user);
		
	}

	@Override
	public User getUserByIdentification(String user_identification) {
		return userDAO.selectUserByIdentification(user_identification);
	}

	@Override
	public String getUserByIdentificationBool(String user_identification) {
		User user = userDAO.selectUserByIdentification(user_identification);
		String isUser = "0";
		
		if (user !=null) {
			isUser =  "1";
		}
		return isUser;
	}

	@Override
	public List<User> getAllUsers() {
		return userDAO.selectAllUsers();
	}

	@Override
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}

	@Override
	public int getIdByIdentification(String user_identification) {
		return userDAO.selectIdByIdentification(user_identification);
	}

	@Override
	public void updateUser(User user) {
		userDAO.updateUser(user);
		
	}

}
