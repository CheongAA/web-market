package com.mju.ict.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.mju.ict.model.Order;

public interface IOrderService {

	public abstract List<Order> getAllOrders();
	
	public abstract List<Order> getOrderByUser(int user_id);

	public abstract Order getOrderById(int id);

	public abstract List<Order> getCanceledOrderByUser(int user_id);
	
	public abstract void addOrder(Map<String, Object> param, HttpSession session);

}
