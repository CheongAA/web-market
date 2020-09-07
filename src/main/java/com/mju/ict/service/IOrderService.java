package com.mju.ict.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.OrderState;

public interface IOrderService {
	
	public abstract List<OrderState> getAllOrderStates();
	
	public abstract OrderDetail getOrderDetailById(int id);

	public abstract List<Order> getAllOrders();
	
	public abstract List<Order> getOrderByUser(int user_id);

	public abstract Order getOrderById(int id);

	public abstract List<Order> getCanceledOrderByUser(int user_id);
	
	public abstract void addOrder(Map<String, Object> param, HttpSession session);

	public abstract void updateOrderTracking(String order_id, String order_tracking_number);

	public abstract void updateOrderState(String order_id, String order_state_id);





}
