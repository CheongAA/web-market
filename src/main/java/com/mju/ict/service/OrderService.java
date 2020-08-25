package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;
import com.mju.ict.repository.IOrderDAO;
import com.mju.ict.repository.IOrderDetailDAO;

@Service
public class OrderService implements IOrderService{

	@Autowired
	IOrderDAO orderDAO;
	
	@Autowired
	IOrderDetailDAO orderDetailDAO;

	@Override
	public void addOrder(Order order) {
		orderDAO.insertOrder(order);
		
	}

	@Override
	public void addOrderDetail(OrderDetail orderDetail) {
		orderDetailDAO.insertOrderDetail(orderDetail);
	}

	@Override
	public List<Order> getOrderByUser(int user_id) {
		return orderDAO.selectOrderByUser(user_id);
	}

	@Override
	public Order getOrderById(int id) {
		return orderDAO.selectOrderById(id);
	}



}
