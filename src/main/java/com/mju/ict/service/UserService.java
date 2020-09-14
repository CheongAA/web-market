package com.mju.ict.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mju.ict.model.User;
import com.mju.ict.repository.IUserDAO;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserDAO userDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	//고객 전체 조회
	@Override
	public List<User> getAllUsers() {
		return userDAO.selectAllUsers();
	}

	//user_id로 고객 조회
	@Override
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}

	//user_identification로 고객 조회
	@Override
	public int getIdByIdentification(String user_identification) {
		return userDAO.selectIdByIdentification(user_identification);
	}
	
	//user_identification로 고객 조회
	@Override
	public User getUserByIdentification(String user_identification) {
		return userDAO.selectUserByIdentification(user_identification);
	}

	//고객 등록
	@Override
	public void registerUser(User user) {
		String encPassword = passwordEncoder.encode(user.getUser_password());
		user.setUser_password(encPassword);
		userDAO.insertUser(user);
		
	}

	//고객 수정
	@Override
	public User updateUser(User user) {
		String encPassword = passwordEncoder.encode(user.getUser_password());
		user.setUser_password(encPassword);
		userDAO.updateUser(user);
		User updatedUser = userDAO.selectUserById(user.getUser_id());
		return updatedUser;
		
	}

	//고객 로그인
	@Override
	public User loginUser(String identification, String password, int rememberId,HttpServletResponse response) {
		User user = userDAO.selectUserByIdentification(identification);

		if (user != null) {			
			if (passwordEncoder.matches(password, user.getUser_password())) {				
				if(rememberId == 1) {
					Cookie cookie = new Cookie("id", user.getUser_identification());
					cookie.setMaxAge(60*60*24); 
					response.addCookie(cookie);
				}else {
					Cookie cookie = new Cookie("id", null);
					cookie.setMaxAge(0); 
					response.addCookie(cookie);
				}
				return user;
			}
		}
		return null;
	}

	@Override
	public User checkUser(String identification, String password) {
		User user = userDAO.selectUserByIdentification(identification);
		
		if (user != null) {			
			if (passwordEncoder.matches(password, user.getUser_password())) {	
				return user;
			}
		}
		return null;
	}

	@Override
	public void deleteUserById(int id) {
		userDAO.deleteUserById(id);
	}

}
