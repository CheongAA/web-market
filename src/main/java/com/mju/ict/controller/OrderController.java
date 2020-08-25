package com.mju.ict.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.mju.ict.model.Address;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.Product;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
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

	// 주문 페이지
	@RequestMapping(value = "/{id}/{count}", method = RequestMethod.GET)
	public String getOrder(@PathVariable int id, @PathVariable int count, Model model, HttpSession session) {
		Product product = productService.getProductById(id);

		model.addAttribute("product", product);
		model.addAttribute("count", count);

		if (session.getAttribute("user") == null) {
			return "order_nonUser";
		} else {

			User user = (User) session.getAttribute("user");
			List<Address> addresses = addressService.getAddressByUser(user.getUser_id());
			model.addAttribute("addresses", addresses);
		}

		return "order/direct";
	}

	// 주문
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public void addOrder(@RequestBody Map<String, Object> param, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Gson gson = new Gson();
		Order order = gson.fromJson(new Gson().toJson(param.get("order")).toString(), Order.class);
		OrderDetail orderDetail = gson.fromJson(param.get("orderDetail").toString(), OrderDetail.class);
		
		if (user != null) {
			order.setUser_id(user.getUser_id());
		}		
		orderService.addOrder(order);
		
		orderDetail.setOrder_id(order.getOrder_id());
		orderService.addOrderDetail(orderDetail);
	}

	// 주문완료 페이지
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String getComplete() {
		return "order/complete";
	}
}
