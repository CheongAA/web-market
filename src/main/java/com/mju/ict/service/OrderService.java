package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Order;
import com.mju.ict.model.Product;
import com.mju.ict.repository.IBrandDAO;
import com.mju.ict.repository.IOrderDAO;
import com.mju.ict.repository.IProductDAO;

@Service
public class OrderService implements IOrderService{

	@Autowired
	IOrderDAO orderDAO;

	@Override
	public void addOrder(Order order) {
		orderDAO.insertOrder(order);
		
	}



}
