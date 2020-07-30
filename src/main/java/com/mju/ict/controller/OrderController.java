package com.mju.ict.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Address;
import com.mju.ict.model.Product;
import com.mju.ict.model.User;
import com.mju.ict.service.IAddressService;
import com.mju.ict.service.IProductService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	IProductService productService;
	
	@Autowired
	IAddressService addressService;
	
	//주문 페이지
	@RequestMapping(value = "/{id}/{count}", method = RequestMethod.GET)
	public String getOrder(@PathVariable int id,@PathVariable int count,Model model, HttpSession session) {
		Product product = productService.getProductById(id);

		model.addAttribute("product", product);
		model.addAttribute("count", count);
		
		if(session.getAttribute("user")==null) {
			return "order_nonUser";
		}else {
			
			User user = (User) session.getAttribute("user");
			List<Address> addresses = addressService.getAddressByUser(user.getUser_id());
			model.addAttribute("addresses", addresses);
		}
		
		return "order/direct";
	}
}
