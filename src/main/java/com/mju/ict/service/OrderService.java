package com.mju.ict.service;

import java.util.ArrayList;
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

	@Override
	public List<Order> getAllOrders() {
		return orderDAO.selectAllOrders();
	}

	@Override
	public List<Order> getCanceledOrderByUser(int user_id) {
		List<Order> orders = orderDAO.selectOrderByUser(user_id);
		List<Order> canceledOrders = new ArrayList<Order>();
		for(Order order:orders) {
			if(order.getOrder_state().equals("취소신청") || order.getOrder_state().equals("취소완료")
					|| order.getOrder_state().equals("반품신청")|| order.getOrder_state().equals("반품완료")
					|| order.getOrder_state().equals("교환신청")|| order.getOrder_state().equals("교환완료")) {
				canceledOrders.add(order);
			}
		}
		return canceledOrders;
	}



}
