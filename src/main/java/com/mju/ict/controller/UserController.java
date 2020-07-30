package com.mju.ict.controller;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mju.ict.model.Address;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
import com.mju.ict.service.IUserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	IUserService userService;
	
	@Autowired
	IAddressService addressService;

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
			@RequestParam("user_password") String password, HttpSession session, RedirectAttributes rtt) {
		User user = userService.getUserByIdentification(identification);

		if (user != null) {
			if (passwordEncoder.matches(password, user.getUser_password())) {
				session.setAttribute("user", user);
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
		session.removeAttribute("user");
		return "redirect:/";
	}

	// 유저 마이페이지 
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String getMypage() {
		return "user/index";
	}

}
