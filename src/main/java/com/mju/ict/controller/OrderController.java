package com.mju.ict.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mju.ict.model.Address;
import com.mju.ict.model.Cart;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
import com.mju.ict.service.ICartService;
import com.mju.ict.service.IOrderService;
import com.mju.ict.service.IProductService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	IProductService productService;

	@Autowired
	IAddressService addressService;

	@Autowired
	IOrderService orderService;
	
	@Autowired
	ICartService cartService;

	
	// 주문 등록 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getOrder(@RequestParam("cart[]") int[] cartArr,Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "login";
		} else {
			List<Cart> carts = cartService.getCartsById(cartArr);
			Address address = addressService.getDefaultAddressByUser(user.getUser_id());
			
			model.addAttribute("carts", carts);
			model.addAttribute("address", address);
		}

		return "order/direct";
	}
	
	// 주문완료 페이지
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String getOrderComplete() {
		return "order/complete";
	}
	

	// 주문 등록
	@ResponseBody
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public void addOrder(@RequestBody Map<String, Object> param, HttpSession session) {
		orderService.addOrder(param,session);
	}


}
