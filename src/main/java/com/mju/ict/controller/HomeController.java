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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mju.ict.model.Answer;
import com.mju.ict.model.Brand;
import com.mju.ict.model.Discount;
import com.mju.ict.model.Notice;
import com.mju.ict.model.Product;
import com.mju.ict.service.IAnswerService;
import com.mju.ict.service.IBrandService;
import com.mju.ict.service.IDiscountService;
import com.mju.ict.service.INoticeService;
import com.mju.ict.service.IProductService;
import com.mju.ict.service.IReviewService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@Autowired
	IAnswerService answerService;
	
	@Autowired
	IBrandService brandService;

	@Autowired
	IDiscountService discountService;
	
	@Autowired
	INoticeService noticeService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IReviewService reviewService;
	
	//메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<Discount> discounts = discountService.getRecentDiscounts();
		List<Product> products = productService.getNewProducts();
		
		model.addAttribute("discounts", discounts);
		model.addAttribute("products", products);
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
	
	///////////////////////////////브랜드//////////////////////////
	
	//브랜드 목록 페이지
	@RequestMapping(value = "/brand", method = RequestMethod.GET)
	public String getBrand(Model model) {
		List<Brand> brands = brandService.getAllBrands();
		
		model.addAttribute("brands", brands);
		return "brand";
	}
	
	//브랜드 상세 페이지
	@RequestMapping(value = "/brand/{id}", method = RequestMethod.GET)
	public String getBrandDetail(@PathVariable int id,Model model) {
		Brand brand = brandService.getBrandById(id);
		List<Product> products = productService.getProductsByBrand(id);

		model.addAttribute("brand", brand);
		model.addAttribute("products", products);
		return "brand-detail";
	}
	
	//브랜드 검색 결과 페이지
	@RequestMapping(value = "/brand/search", method = RequestMethod.GET)
	public String getSearchBrand(@RequestParam String term,Model model) {
		List<Brand> brands = brandService.searchBrandByTerm(term);
		
		model.addAttribute("brands", brands);
		model.addAttribute("term", term);
		return "/brand";
	}

	
	///////////////////////////////공지사항//////////////////////////
	//공지사항 목록 페이지
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String getNotices(Model model) {
		List<Notice> notices = noticeService.getAllNotices();
		
		model.addAttribute("notices", notices);
		return "notice/list";
	}
	
	//공지사항 상세 페이지
	@RequestMapping(value = "/notice/{id}", method = RequestMethod.GET)
	public String getNoticeDetail(@PathVariable int id,Model model) {
		noticeService.addNoticeView(id);
		Notice notice = noticeService.getNoticeById(id);

		model.addAttribute("notice", notice);
		return "notice/detail";
	}
	
	///////////////////////////////자주하는 질문//////////////////////////
	
	//자주하는질문 목록 페이지
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String getFAQs(Model model) {
		List<Answer> answers = answerService.getFaqAnswers();
		
		model.addAttribute("answers", answers);
		return "notice/faq/list";
	}
	
	///////////////////////////////  리뷰  //////////////////////////
	
	//자주하는질문 목록 페이지
	@ResponseBody
	@RequestMapping(value = "/review/addView/{review_id}", method = RequestMethod.GET)
	public void addReviewView(@PathVariable int review_id) {
		reviewService.addReviewView(review_id);
	}
	
	
	
}
