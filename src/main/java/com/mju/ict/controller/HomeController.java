package com.mju.ict.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Discount;
import com.mju.ict.model.Product;
import com.mju.ict.service.IDiscountService;
import com.mju.ict.service.IProductService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IDiscountService discountService;
	
	@Autowired
	IProductService productService;
	
	//메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<Discount> discounts = discountService.getRecentDiscounts();
		
		model.addAttribute("discounts", discounts);
		return "home";
	}

	//로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	//회원가입 페이지
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

}
