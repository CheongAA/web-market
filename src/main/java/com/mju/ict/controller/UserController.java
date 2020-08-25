package com.mju.ict.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mju.ict.model.Address;
import com.mju.ict.model.Order;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
import com.mju.ict.service.ICartService;
import com.mju.ict.service.IOrderService;
import com.mju.ict.service.IUserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IUserService userService;
	
	@Autowired
	IAddressService addressService;
	
	@Autowired
	ICartService cartService;
	
	@Autowired
	IOrderService orderService;

	@Autowired
	PasswordEncoder passwordEncoder;

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute @Valid User user,BindingResult result,
			@ModelAttribute Address address, HttpSession session, Model model) {
		if (result.hasErrors()) {
			// 입력값 유효성 검사
			model.addAttribute("msg", 1);
			return "signup";
		}else {
			// 회원가입
			String encPassword = passwordEncoder.encode(user.getUser_password());
			user.setUser_password(encPassword);
			userService.registerUser(user);
			
			//기본배송지 등록
			int user_id = userService.getIdByIdentification(user.getUser_identification());		
			address.setUser_id(user_id);
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
		String user_identification = req.getParameter("user_identification");

		return userService.getUserByIdentificationBool(user_identification);
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("user_identification") String identification,
			@RequestParam("user_password") String password,@RequestParam("rememberId") int rememberId,HttpSession session, RedirectAttributes rtt,HttpServletResponse response) {
		User user = userService.getUserByIdentification(identification);

		if (user != null) {
			if (passwordEncoder.matches(password, user.getUser_password())) {
				session.setAttribute("user", user);
				if(rememberId == 1) {
					Cookie cookie = new Cookie("id", user.getUser_identification());
					cookie.setMaxAge(60*60*24); 
					response.addCookie(cookie);
				}else {
					Cookie cookie = new Cookie("id", null);
					cookie.setMaxAge(0); 
					response.addCookie(cookie);
				}

				return "redirect:/";
			}
		}
		session.setAttribute("user", null);
		rtt.addFlashAttribute("msg", false);
		return "redirect:/login";

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// 고객 마이페이지 
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getMypage() {
		return "user/index";
	}
	
	// 고객 주문조회 페이지
	@RequestMapping(value = "/user/order", method = RequestMethod.GET)
	public String getUserOrder(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.getOrderByUser(user.getUser_id());
		model.addAttribute("orders", orders);
		return "user/order-list";
	}

	
	// 고객 주문 상세조회 페이지
	@RequestMapping(value = "/user/order/{id}", method = RequestMethod.GET)
	public String getUserOrderDetail(@PathVariable int id,Model model, HttpSession session) {
		Order order = orderService.getOrderById(id);
		model.addAttribute("order", order);
		return "user/order-detail";
	}

	
	// 고객 정보수정 페이지
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String getUserUpdate(Model model, HttpSession session) {
		return "user/user-update";
	}
	
	// 고객 정보수정
	@RequestMapping(value = "/user/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute @Valid User user, BindingResult result, Model model, HttpSession session) {
		String encPassword = passwordEncoder.encode(user.getUser_password());
		user.setUser_password(encPassword);
		userService.updateUser(user);
		User updatedUser = userService.getUserById(user.getUser_id());
		session.removeAttribute("user");
		session.setAttribute("user", updatedUser);
		return "redirect:/user/update";
	}
	
	// 고객 배송지 페이지
	@RequestMapping(value = "/user/address", method = RequestMethod.GET)
	public String getUserAddress(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> addresses = addressService.getAddressByUser(user.getUser_id());
		model.addAttribute("addresses", addresses);
		return "user/address/list";
	}
	
	// 고객 배송지 추가페이지
	@RequestMapping(value = "/user/address/add", method = RequestMethod.GET)
	public String getUserAddresAdd(Model model, HttpSession session) {
		return "user/address/add";
	}
	
	// 고객 배송지 추가
	@RequestMapping(value = "/user/address", method = RequestMethod.POST)
	public String postUserAddress(@ModelAttribute @Valid Address address, BindingResult result) {
		addressService.registerAddress(address);
		return "redirect:/user/address";
	}
	
	//배송지 디테일 페이지
	@RequestMapping(value = "/user/address/{id}", method = RequestMethod.GET)
	public String getAddressDetail(@PathVariable int id,Model model) {
		Address address = addressService.getAddressById(id);

		model.addAttribute("address", address);
		return "user/address/detail";
	}
	
	//배송지 수정
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

}
