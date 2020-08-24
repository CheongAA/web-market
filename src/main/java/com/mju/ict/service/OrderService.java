package com.mju.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Order;
import com.mju.ict.repository.IOrderDAO;

@Service
public class OrderService implements IOrderService{

	@Autowired
	IOrderDAO orderDAO;

	@Override
	public void addOrder(Order order) {
		orderDAO.insertOrder(order);
		
	}



}
