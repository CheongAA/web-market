package com.mju.ict.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mju.ict.model.Category;
import com.mju.ict.service.ICategoryService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ICategoryService categoryService;
	
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

	@ResponseBody
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public Map<String,String> getCategories() {
		List<Category> categories = categoryService.getLargeCategories();
		Map<String, String> result = new HashMap<>();
		for(Category c:categories) {
			result.put( Integer.toString(c.getCategory_code()), c.getCategory_name());
		}
		return result;
	}

}
