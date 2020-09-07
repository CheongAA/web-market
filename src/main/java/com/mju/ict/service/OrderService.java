package com.mju.ict.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.User;
import com.mju.ict.repository.IOrderDAO;
import com.mju.ict.repository.IOrderDetailDAO;

@Service
public class OrderService implements IOrderService{

	@Autowired
	IOrderDAO orderDAO;
	
	@Autowired
	IOrderDetailDAO orderDetailDAO;
	
	
	//주문 전체 조회
	@Override
	public List<Order> getAllOrders() {
		return orderDAO.selectAllOrders();
	}
	
	//user_id로 주문 조회
	@Override
	public List<Order> getOrderByUser(int user_id) {
		return orderDAO.selectOrderByUser(user_id);
	}

	//order_id로 주문 조회
	@Override
	public Order getOrderById(int id) {
		return orderDAO.selectOrderById(id);
	}

	//user_id로 취소 주문 조회
	@Override
	public List<Order> getCanceledOrderByUser(int user_id) {
		List<Order> orders = orderDAO.selectOrderByUser(user_id);
		List<Order> canceledOrders = new ArrayList<Order>();
		for(Order order:orders) {
			if(order.getOrder_state_id()>3) {
				canceledOrders.add(order);
			}
		}
		return canceledOrders;
	}

	//주문 등록 
	@Override
	public void addOrder(Map<String, Object> param, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		Gson gson = new Gson();
		JsonParser jparser = new JsonParser();
		
		Order order = gson.fromJson(new Gson().toJson(param.get("order")).toString(), Order.class);
		
		JsonElement orderDetail = jparser.parse(param.get("orderDetail").toString());
		List <OrderDetail> orderDetailList = gson.fromJson(orderDetail, (new TypeToken<List<OrderDetail>>() {  }).getType());
		
		if (user != null) {
			order.setUser_id(user.getUser_id());
		}else {
			//비회원 
		}
		
		orderDAO.insertOrder(order);
		
		for(OrderDetail od:orderDetailList) {
			od.setOrder_id(order.getOrder_id());
			orderDetailDAO.insertOrderDetail(od);
		}
		
	}





}
