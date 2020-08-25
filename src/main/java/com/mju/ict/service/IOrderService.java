package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;

public interface IOrderService {

	public abstract void addOrder(Order order);

	public abstract void addOrderDetail(OrderDetail orderDetail);

	public abstract List<Order> getOrderByUser(int user_id);
	
	

}
