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

import com.mju.ict.model.Category;
import com.mju.ict.model.Product;
import com.mju.ict.service.ICategoryService;
import com.mju.ict.service.IProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IProductService productService;
	
	@Autowired
	ICategoryService categoryService;
	
	//카테고리별 상품 페이지
	@RequestMapping(value = "/products/{category}", method = RequestMethod.GET)
	public String getProducts(@PathVariable int category,Model model) {
		List<Product> products = productService.getProductsByCategory(category);
		List<Category> categories = categoryService.getCurrentCategories(category);
		
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return "/products";
	}
	
	//신상품 페이지
	@RequestMapping(value = "/products/new", method = RequestMethod.GET)
	public String getProductsNew(Model model) {
		List<Product> products = productService.getNewProducts();
		model.addAttribute("products", products);
		model.addAttribute("activeNew", "h2");
		return "/products";
	}
	
	//베스트 상품 페이지
	@RequestMapping(value = "/products/best", method = RequestMethod.GET)
	public String getProductsBest(@PathVariable int category,Model model) {
		List<Product> products = productService.getProductsByCategory(category);
		model.addAttribute("products", products);
		model.addAttribute("activeBest", "h2");
		return "/products";
	}
	
	//할인상품 페이지
	@RequestMapping(value = "/products/discount", method = RequestMethod.GET)
	public String getProductsDiscount(Model model) {
		List<Product> products = productService.getDiscountProducts();
		model.addAttribute("products", products);
		model.addAttribute("activeDiscount", "h2");
		return "/products";
	}
	
	//상품 디테일 페이지
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable int id,Model model) {
		Product product = productService.getProductById(id);
		if(product == null) {
			return "redirect:/";
		}
		model.addAttribute("product", product);
		return "/product-detail";
	}
	
	////미완성
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
