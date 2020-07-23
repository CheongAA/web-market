package com.mju.ict.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Product;
import com.mju.ict.service.IProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IProductService productService;
	
	@RequestMapping(value = "/products/{category}", method = RequestMethod.GET)
	public String getProducts(@PathVariable int category,Model model) {
		List<Product> products = productService.getProductsByCategory(category);
		model.addAttribute("products", products);
		return "/products";
	}
	
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable int id,Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "/product-detail";
	}
	
	@RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
	public String getOrder(@PathVariable int id,Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "order";
	}
	
	@RequestMapping(value = "/order/{id}", method = RequestMethod.POST)
	public String postOrder(@PathVariable int id,Model model) {
		return "order_ok";
	}
}
