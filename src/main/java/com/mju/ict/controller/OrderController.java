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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mju.ict.model.Address;
import com.mju.ict.model.Cart;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
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

	
	// 주문 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getOrderPage(@RequestParam("cart[]") int[] cartArr,Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "order_nonUser";
		} else {
			List<Cart> carts = cartService.getCartsById(cartArr);
			List<Address> addresses = addressService.getAddressByUser(user.getUser_id());
			
			model.addAttribute("carts", carts);
			model.addAttribute("addresses", addresses);
		}

		return "order/direct";
	}
	

	// 주문
	@ResponseBody
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public void addOrder(@RequestBody Map<String, Object> param, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Gson gson = new Gson();
		JsonParser jparser = new JsonParser();
		
		Order order = gson.fromJson(new Gson().toJson(param.get("order")).toString(), Order.class);
		
		JsonElement orderDetail = jparser.parse(param.get("orderDetail").toString());
		List <OrderDetail> orderDetailList = gson.fromJson(orderDetail, (new TypeToken<List<OrderDetail>>() {  }).getType());
		
		if (user != null) {
			order.setUser_id(user.getUser_id());
		}		
		orderService.addOrder(order);
		
		for(OrderDetail od:orderDetailList) {
			od.setOrder_id(order.getOrder_id());
			orderService.addOrderDetail(od);
		}
	}

	// 주문완료 페이지
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String getComplete() {
		return "order/complete";
	}
}
