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

import com.mju.ict.model.Answer;
import com.mju.ict.model.Discount;
import com.mju.ict.model.Notice;
import com.mju.ict.model.Product;
import com.mju.ict.service.IAnswerService;
import com.mju.ict.service.IDiscountService;
import com.mju.ict.service.INoticeService;
import com.mju.ict.service.IProductService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	IAnswerService answerService;

	@Autowired
	IDiscountService discountService;
	
	@Autowired
	INoticeService noticeService;
	
	@Autowired
	IProductService productService;
	
//	@Autowired
//	IQuestionService questionService;

	
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
}
