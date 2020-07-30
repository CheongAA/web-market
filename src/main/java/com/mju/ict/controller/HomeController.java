package com.mju.ict.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	

	@RequestMapping(value = "/brand", method = RequestMethod.GET)
	public String getBrandAll() {
		return "category/brand";
	}

	

}
