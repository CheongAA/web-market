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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Category;
import com.mju.ict.model.Product;
import com.mju.ict.model.User;
import com.mju.ict.service.IBrandService;
import com.mju.ict.service.ICategoryService;
import com.mju.ict.service.IProductService;
import com.mju.ict.service.IUserService;

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
	
	@Autowired
	IUserService userService;

	
	//관리자 홈페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAdminIndex() {
		return "admin/index";
	}
	
	////상품
	//상품목록 페이지
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String getProducts(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "admin/product/list";
	}
	
	//상품 디테일 페이지
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable int id,Model model) {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "admin/product/detail";
	}
	
	//상품등록 페이지
	@RequestMapping(value = "/product/add", method = RequestMethod.GET)
	public String getProductAdd(Model model) {
		List<Category> categories = categoryService.getAllCategories();
		List<Brand> brands = brandService.getAllBrands();
		
		model.addAttribute("categories", JSONArray.fromObject(categories));
		model.addAttribute("brands", brands);
		return "admin/product/add";
	}
	
	//상품수정 페이지
	@RequestMapping(value = "/product/update/{id}", method = RequestMethod.GET)
	public String getProductUpdate(@PathVariable int id,Model model) {
		List<Category> categories = categoryService.getAllCategories();
		List<Brand> brands = brandService.getAllBrands();
		Product product = productService.getProductById(id);
		
		model.addAttribute("categories", JSONArray.fromObject(categories));
		model.addAttribute("brands", brands);
		model.addAttribute("product", product);
		
		return "admin/product/update";
	}
	
	//상품삭제
	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id,Model model) {
		productService.deleteProductById(id);
		return "redirect:/admin/product/";
	}
	
	
	//상품등록
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String postProduct(@ModelAttribute @Valid Product product, BindingResult result) {
		productService.registerProduct(product);
		return "redirect:/admin/product/";
	}
	
	//상품수정
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String updateProduct(@ModelAttribute @Valid Product product, BindingResult result,Model model) {
		Product updatedProduct = productService.updateProduct(product);
		model.addAttribute("product", updatedProduct);
		return "redirect:/admin/product/"+updatedProduct.getProduct_id();
	}

	//고객
	///고객조회 페이지
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getUsers(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "admin/user/list";
	}
	
	
	//고객 디테일 페이지
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String getUserDetail(@PathVariable int id,Model model) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user/detail";
	}
	
	//브랜드
	///브랜드조회 페이지
	@RequestMapping(value = "/brand", method = RequestMethod.GET)
	public String getBrands(Model model) {
		List<Brand> brands = brandService.getAllBrands();
		model.addAttribute("brands", brands);
		return "admin/brand/list";
	}
	
	
	//브랜드 디테일 페이지
	@RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
	public String getBrandDetail(@PathVariable int id,Model model) {
		Brand brand = brandService.getBrandById(id);
		model.addAttribute("brand", brand);
		return "admin/brand/detail";
	}
	
	//브랜드등록 페이지
	@RequestMapping(value = "/brand/add", method = RequestMethod.GET)
	public String getBrandAdd(Model model) {
		return "admin/brand/add";
	}
	
	//브랜드 등록
	@RequestMapping(value = "/brand/add", method = RequestMethod.POST)
	public String postBrand(@ModelAttribute @Valid Brand brand, BindingResult result) {
		brandService.registerBrand(brand);
		return "redirect:/admin/brand";
	}
	
	
	//브랜드 수정 페이지
	@RequestMapping(value = "/brand/update/{id}", method = RequestMethod.GET)
	public String getBrandUpdate(@PathVariable int id,Model model) {
		Brand brand = brandService.getBrandById(id);
		model.addAttribute("brand", brand);
		return "admin/brand/update";
	}
	
	//브랜드 수정
	@RequestMapping(value = "/brand/update", method = RequestMethod.POST)
	public String updateBrand(@ModelAttribute @Valid Brand brand, BindingResult result,Model model) {
		Brand updatedBrand = brandService.updateBrand(brand);
		model.addAttribute("brand", updatedBrand);
		return "redirect:/admin/brand/"+updatedBrand.getBrand_id();
	}
	
	//브랜드
	@RequestMapping(value = "/brand/delete/{id}", method = RequestMethod.GET)
	public String deleteBrand(@PathVariable int id,Model model) {
		brandService.deleteBrandById(id);
		return "redirect:/admin/brand";
	}
	
}
