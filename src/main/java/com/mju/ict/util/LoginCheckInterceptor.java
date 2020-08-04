package com.mju.ict.util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mju.ict.model.User;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		User userSession = (User) session.getAttribute("user");
		
		System.out.println("login interceptor");
		
		if(userSession == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		
		return true;
		
	}
}
