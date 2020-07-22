package com.mju.ict.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mju.ict.model.User;

@Component
public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		User userSession = (User) session.getAttribute("user");
		
		System.out.println("Admin interceptor");
		
		if(userSession == null || userSession.getUser_level() != 1) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}

		return true;
		
	}
}
