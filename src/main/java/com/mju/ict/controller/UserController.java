package com.mju.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mju.ict.model.Address;
import com.mju.ict.model.Notice;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.Product;
import com.mju.ict.model.Question;
import com.mju.ict.model.QuestionCategory;
import com.mju.ict.model.Review;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
import com.mju.ict.service.ICartService;
import com.mju.ict.service.IOrderService;
import com.mju.ict.service.IProductService;
import com.mju.ict.service.IQuestionService;
import com.mju.ict.service.IReviewService;
import com.mju.ict.service.IUserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IAddressService addressService;

	@Autowired
	ICartService cartService;

	@Autowired
	IOrderService orderService;

	@Autowired
	IProductService productService;

	@Autowired
	IQuestionService questionService;

	@Autowired
	IReviewService reviewService;

	@Autowired
	IUserService userService;

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute @Valid User user, BindingResult result, @ModelAttribute Address address,
			HttpSession session, Model model) {
		if (result.hasErrors()) {
			// 입력값 유효성 검사
			model.addAttribute("msg", 1);
			return "signup";
		} else {
			// 회원가입
			userService.registerUser(user);

			// 기본배송지 등록
			address.setUser_id(user.getUser_id());
			address.setAddress_recipient(user.getUser_name());
			address.setAddress_phone(user.getUser_phone());
			address.setAddress_default(1);
			addressService.registerAddress(address);

		}

		return "redirect:/login";
	}

	// 이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public String getIdCheck(HttpServletRequest req) throws Exception {
		User user = userService.getUserByIdentification(req.getParameter("user_identification"));
		if (user != null) {
			return "1";
		}
		return "0";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("user_identification") String identification,
			@RequestParam("user_password") String password, @RequestParam("rememberId") int rememberId,
			HttpSession session, RedirectAttributes rtt, HttpServletResponse response) {
		User user = userService.loginUser(identification, password, rememberId, response);

		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/";
		} else {
			session.setAttribute("user", null);
			rtt.addFlashAttribute("msg", false);
		}

		return "redirect:/login";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login";
	}

	/////////////// 마이페이지//////////////////

	/////////////// 쇼핑//////////////////

	// 주문 조회 페이지
	@RequestMapping(value = "/user/order", method = RequestMethod.GET)
	public String getUserOrder(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.getOrderByUser(user.getUser_id());
		model.addAttribute("orders", orders);
		return "user/order-list";
	}

	// 취소 주문 조회 페이지
	@RequestMapping(value = "/user/canceledOrder", method = RequestMethod.GET)
	public String getUserCanceledOrder(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.getCanceledOrderByUser(user.getUser_id());
		model.addAttribute("orders", orders);
		return "user/order-list";
	}

	// 주문 상세 조회 페이지
	@RequestMapping(value = "/user/order/{id}", method = RequestMethod.GET)
	public String getUserOrderDetail(@PathVariable int id, Model model, HttpSession session) {
		Order order = orderService.getOrderById(id);
		model.addAttribute("order", order);
		return "user/order-detail";
	}

	// 주문 취소 신청
	@RequestMapping(value = "/user/order/cancel/{id}", method = RequestMethod.GET)
	public String updateOrderStateCancel(@PathVariable int id, Model model, HttpSession session) {
		orderService.updateOrderState(id, 4);
		return "redirect:/user/order/"+id;
	}

	// 주문 환불 신청
	@RequestMapping(value = "/user/order/return/{id}", method = RequestMethod.GET)
	public String updateOrderStateReturn(@PathVariable int id, Model model, HttpSession session) {
		orderService.updateOrderState(id, 6);
		return "redirect:/user/order/"+id;
	}
	
	// 주문 교환 신청
	@RequestMapping(value = "/user/order/change/{id}", method = RequestMethod.GET)
	public String updateOrderStateChange(@PathVariable int id, Model model, HttpSession session) {
		orderService.updateOrderState(id, 8);
		return "redirect:/user/order/"+id;
	}
	
	// 주문 배송완료 신청
	@RequestMapping(value = "/user/order/confirm/{id}", method = RequestMethod.GET)
	public String updateOrderStateConfirm(@PathVariable int id, Model model, HttpSession session) {
		orderService.updateOrderState(id, 3);
		return "redirect:/user/order/"+id;
	}
	/////////////// 정보수정//////////////////

	// 정보 수정 회원 확인 페이지
	@RequestMapping(value = "/user/check", method = RequestMethod.GET)
	public String getUserCheck(Model model, HttpSession session) {
		return "user/user-check";
	}

	// 정보 수정 메뉴 페이지 (정보수정,비밀번호수정,탈퇴)
	@RequestMapping(value = "/user/check/nav", method = RequestMethod.GET)
	public String getUserUpdateNav(Model model, HttpSession session) {
		return "user/user-update-nav";
	}

	// 정보 수정 페이지
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String getUserUpdate(Model model, HttpSession session) {
		return "user/user-update";
	}

	// 비밀번호 수정 페이지
	@RequestMapping(value = "/user/update/password", method = RequestMethod.GET)
	public String getUserUpdatePassword(Model model, HttpSession session) {
		return "user/user-update-password";
	}

	// 정보 수정 완료 페이지
	@RequestMapping(value = "/user/update/ok", method = RequestMethod.GET)
	public String getUserUpdateOK(Model model, HttpSession session) {
		return "user/user-update-ok";
	}

	// 회원 확인
	@RequestMapping(value = "/user/check", method = RequestMethod.POST)
	public String checkUser(@RequestParam("user_identification") String identification,
			@RequestParam("user_password") String password, Model model) {
		User user = userService.checkUser(identification, password);

		if (user == null) {
			model.addAttribute("msg", 1);
			return "user/user-check";
		}

		return "redirect:/user/check/nav";

	}

	// 고객 정보수정
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute @Valid User user, BindingResult result, Model model, HttpSession session) {
		User updatedUser = userService.updateUser(user);

		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		return "redirect:/user/update/ok";
	}

	// 고객 비밀번호 수정
	@RequestMapping(value = "/user/update/password", method = RequestMethod.POST)
	public String updateUserPassword(@ModelAttribute @Valid User user, BindingResult result, Model model,
			HttpSession session) {
		User updatedUser = userService.updateUserPassword(user);

		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		return "redirect:/user/update/ok";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/user/cancel/{id}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable int id, Model model, HttpSession session) {

		userService.deleteUserById(id);

		session.removeAttribute("user");

		return "redirect:/";
	}

	/////////////// 배송지//////////////////

	// 배송지 목록 페이지
	@RequestMapping(value = "/user/address", method = RequestMethod.GET)
	public String getUserAddress(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> addresses = addressService.getAddressByUser(user.getUser_id());

		model.addAttribute("addresses", addresses);
		return "user/address/list";
	}

	// 배송지 상세 페이지
	@RequestMapping(value = "/user/address/{id}", method = RequestMethod.GET)
	public String getAddressDetail(@PathVariable int id, Model model) {
		Address address = addressService.getAddressById(id);

		model.addAttribute("address", address);
		return "user/address/detail";
	}

	// 배송지 추가 페이지
	@RequestMapping(value = "/user/address/add", method = RequestMethod.GET)
	public String getUserAddresAdd(Model model, HttpSession session) {
		return "user/address/add";
	}

	// 배송지 등록
	@RequestMapping(value = "/user/address", method = RequestMethod.POST)
	public String addUserAddress(@ModelAttribute @Valid Address address, BindingResult result) {
		addressService.registerAddress(address);
		return "redirect:/user/address";
	}

	// 배송지 수정
	@RequestMapping(value = "/user/address/update", method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute @Valid Address address, BindingResult result, Model model) {
		addressService.updateAddress(address);
		return "redirect:/user/address";
	}

	// 배송지 삭제
	@RequestMapping(value = "/user/address/delete/{id}", method = RequestMethod.GET)
	public String deleteAddress(@PathVariable int id, Model model) {
		addressService.deleteAddressById(id);
		return "redirect:/user/address";
	}

	/////////////// 문의//////////////////

	// 문의 목록 페이지
	@RequestMapping(value = "/user/question", method = RequestMethod.GET)
	public String getUserQuestion(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Question> questions = questionService.getQuestionByUser(user.getUser_id());

		model.addAttribute("questions", questions);
		return "user/question-list";
	}

	// 문의 상세 페이지
	@RequestMapping(value = "/user/question/{id}", method = RequestMethod.GET)
	public String getQuestionDetail(@PathVariable int id, Model model) {
		Question question = questionService.getQuestionById(id);

		model.addAttribute("question", question);
		return "user/question-detail";
	}

	// 1:1 문의 등록 페이지
	@RequestMapping(value = "/user/question/add", method = RequestMethod.GET)
	public String getUserQuestionAdd(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		List<QuestionCategory> questionCategories = questionService.getAllQuestionCategories();
		List<Order> orders = orderService.getOrderByUser(user.getUser_id());

		model.addAttribute("questionCategories", questionCategories);
		model.addAttribute("orders", orders);
		return "user/question-add";
	}

	// 상품 문의 등록 페이지
	@RequestMapping(value = "/user/productQuestionAdd/{id}", method = RequestMethod.GET)
	public String getUserProductQuestionAdd(@PathVariable int id, Model model, HttpSession session) {
		QuestionCategory category = questionService.getProductQuestionCategory();
		Product product = productService.getProductById(id);

		model.addAttribute("category", category);
		model.addAttribute("product", product);
		return "user/product-question-add";
	}

	// 1:1 문의 등록 / 상품 문의 등록
	@RequestMapping(value = "/user/question", method = RequestMethod.POST)
	public String addUserQuestion(@ModelAttribute @Valid Question question, BindingResult result, HttpSession session) {
		questionService.registerQuestion(question, session);
		return "redirect:/user/question";
	}

	/////////////// 후기//////////////////

	// 후기 작성 가능한 주문 목록 페이지
	@RequestMapping(value = "/user/reviewable", method = RequestMethod.GET)
	public String getUserReviewable(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.getOrderByUser(user.getUser_id());

		model.addAttribute("orders", orders);
		return "user/reviewable-list";
	}

	// 후기 목록 페이지
	@RequestMapping(value = "/user/review", method = RequestMethod.GET)
	public String getUserReview(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Review> reviews = reviewService.getReviewByUser(user.getUser_id());

		model.addAttribute("reviews", reviews);
		return "user/review-list";
	}

	// 후기 등록 페이지
	@RequestMapping(value = "/user/review/add/{id}", method = RequestMethod.GET)
	public String getUserReviewAdd(@PathVariable int id, Model model) {
		OrderDetail orderDetail = orderService.getOrderDetailById(id);

		model.addAttribute("orderDetail", orderDetail);
		return "user/review-add";
	}

	// 후기 수정 페이지
	@RequestMapping(value = "/user/review/update/{id}", method = RequestMethod.GET)
	public String getReviewUpdate(@PathVariable int id, Model model) {
		Review review = reviewService.getReviewById(id);
		OrderDetail orderDetail = orderService.getOrderDetailByReview(id);

		model.addAttribute("review", review);
		model.addAttribute("orderDetail", orderDetail);
		return "user/review-update";
	}

	// 후기 등록
	@RequestMapping(value = "/user/review", method = RequestMethod.POST)
	public String addUserReview(@ModelAttribute @Valid Review review, BindingResult result,
			@RequestParam("order_detail_id") int order_detail_id,MultipartFile file , HttpSession session ) {
		reviewService.registerReview(review, order_detail_id,file);
		return "redirect:/user/review";
	}

	// 후기 수정
	@RequestMapping(value = "/user/review/update", method = RequestMethod.POST)
	public String updateUserReview(@ModelAttribute @Valid Review review,MultipartFile file , BindingResult result, Model model) {
		reviewService.updateReview(review,file);
		return "redirect:/user/review";
	}

	// 후기 삭제
	@RequestMapping(value = "/user/review/delete/{id}", method = RequestMethod.GET)
	public String deleteUserReview(@PathVariable int id, Model model) {
		reviewService.deleteReviewById(id);
		return "redirect:/user/review";
	}

}
