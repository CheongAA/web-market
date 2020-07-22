package com.mju.ict.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Category;
import com.mju.ict.model.Product;
import com.mju.ict.service.IBrandService;
import com.mju.ict.service.ICategoryService;
import com.mju.ict.service.IProductService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IBrandService brandService;
	
	@Autowired
	ICategoryService categoryService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAdminIndex() {
		return "admin/index";
	}
	//관리자 상품목록 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getAdminProductList(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "admin/product/list";
	}
	
	//관리자 상품등록 페이지
	@RequestMapping(value = "/product/add", method = RequestMethod.GET)
	public String getAdminProductAdd(Model model) {
		List<Category> categories = categoryService.getAllCategories();
		List<Brand> brands = brandService.getAllBrands();
		
		model.addAttribute("categories", JSONArray.fromObject(categories));
		model.addAttribute("brands", brands);
		return "admin/product/add";
	}
	
	//관리자 상품등록
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String postAdminProductAdd(@ModelAttribute @Valid Product product, BindingResult result) {
		System.out.println(product.getProduct_name());
		productService.registerProduct(product);
		return "redirect:/admin/product/";
	}
}
