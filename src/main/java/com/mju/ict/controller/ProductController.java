package com.mju.ict.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mju.ict.model.Cart;
import com.mju.ict.model.Category;
import com.mju.ict.model.Paging;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;
import com.mju.ict.model.Question;
import com.mju.ict.model.Review;
import com.mju.ict.model.User;
import com.mju.ict.service.ICartService;
import com.mju.ict.service.ICategoryService;
import com.mju.ict.service.IProductService;
import com.mju.ict.service.IQuestionService;
import com.mju.ict.service.IReviewService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	ICartService cartService;
	
	@Autowired
	ICategoryService categoryService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IQuestionService questionService;	
	
	@Autowired
	IReviewService reviewService;	

	
	
	//카테고리 조회
	@ResponseBody
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public Map<String,String> getCategories() {
		Map<String, String> result = categoryService.getLargeCategories();
		return result;
	}
	
	//상품 검색 결과 페이지
	@RequestMapping(value = "/product/search", method = RequestMethod.GET)
	public String getSearchProducts(@RequestParam String term,Model model) {
		List<Product> products = productService.searchProductByTerm(term);
		
		model.addAttribute("products", products);
		model.addAttribute("term", term);
		return "/products";
	}
	
	
	//카테고리별 상품 페이지
	@RequestMapping(value = "/products/{category}", method = RequestMethod.GET)
	public String getProducts(@PathVariable int category,PagingCriteria cri,Model model) {
	    
		List<Product> products = productService.getProductsByCategory(category,cri);
		List<Category> categories = categoryService.getCurrentCategories(category);
		
	    Paging pageMaker = new Paging();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(productService.countProductByCategory(category));
		
		model.addAttribute("products", products);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("categories", categories);
		model.addAttribute("currentCategory", category);
		return "/products";
	}
	
	//신상품  페이지
	@RequestMapping(value = "/products/new", method = RequestMethod.GET)
	public String getProductsNew(Model model) {

		List<Product> products = productService.getNewProducts();
		
		model.addAttribute("products", products);
		model.addAttribute("activeNew", "h2");
		return "/products";
	}
	
	//베스트 상품 페이지
	@RequestMapping(value = "/products/best", method = RequestMethod.GET)
	public String getProductsBest(Model model) {
		List<Product> products = productService.getBestProducts();
		
		model.addAttribute("products", products);
		model.addAttribute("activeBest", "h2");
		return "/products";
	}
	
	//알뜰상품 페이지
	@RequestMapping(value = "/products/discount", method = RequestMethod.GET)
	public String getProductsDiscount(PagingCriteria cri, Model model) {
		
		
	    Paging pageMaker = new Paging();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(productService.countProductByDiscount());
	    
	    List<Product> products = productService.getDiscountProducts(cri);
		
	    System.out.println(productService.countProductByDiscount());
		model.addAttribute("products", products);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("activeDiscount", "h2");
		return "/products";
	}
	
	//상품 디테일 페이지
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String getProductDetail(@PathVariable int id,PagingCriteria cri,Model model) {
		Product product = productService.getProductById(id);
		
	    Paging QuestionPageMaker = new Paging();
	    QuestionPageMaker.setCri(cri);
	    QuestionPageMaker.setTotalCount(questionService.countQuestionsByProduct(id));
	    
	    Paging ReviewPageMaker = new Paging();
	    ReviewPageMaker.setCri(cri);
	    ReviewPageMaker.setTotalCount(reviewService.countReviewsByProduct(id));
		
		model.addAttribute("product", product);
		model.addAttribute("QuestionPageMaker", QuestionPageMaker);
		model.addAttribute("ReviewPageMaker", ReviewPageMaker);
		return "/product-detail";
	}
	
	// 상품 리뷰 목록
	@ResponseBody
	@RequestMapping(value = "/product/review", method = RequestMethod.GET)
	public List<Review> getReviewByProduct(HttpServletRequest req,PagingCriteria cri) throws Exception {
		List<Review> reviews= reviewService.getReviewByProduct(Integer.parseInt((req.getParameter("product_id"))),cri);
		return reviews;
	}
	
	// 상품 문의 목록
	@ResponseBody
	@RequestMapping(value = "/product/question", method = RequestMethod.GET)
	public List<Question> getQuestionByProduct(HttpServletRequest req,PagingCriteria cri) throws Exception {
		List<Question> questions= questionService.getQuestionByProduct(Integer.parseInt((req.getParameter("product_id"))),cri);
		return questions;
	}
	
	
	/////////////// 장바구니//////////////////
	
	//장바구니 목록 페이지
	@RequestMapping(value = "/carts", method = RequestMethod.GET)
	public String getCarts(HttpSession session,Model model) {
		User user = (User) session.getAttribute("user");
		List<Cart> carts = null;
		if(user !=null) {
			carts = cartService.getCartsByUser(user.getUser_id());
		}else {
			//비회원
			return "login";
		}
		model.addAttribute("carts", carts);
		return "carts";
	}

	//회원 장바구니 등록
	@ResponseBody
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public void addCart(Cart cart,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user !=null) {
			cart.setUser_id(user.getUser_id());
			cartService.registerCart(cart);
		}else {
			//cartService.registerCart(cart);
		}
	}
	
	//회원 장바구니 상품 수량 변경
	@ResponseBody
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	public void updateCart(@RequestBody Cart cart,HttpSession session) {
		cartService.updateCart(cart);
	}
	
	//회원 장바구니 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	public void deleteCart(@RequestBody int[] cartArr,HttpSession session) {
		cartService.deleteCart(cartArr);
	}

	
}
