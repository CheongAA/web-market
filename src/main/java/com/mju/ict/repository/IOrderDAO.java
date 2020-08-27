package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Order;

public interface IOrderDAO {

	public abstract void insertOrder(Order order);

	public abstract List<Order> selectOrderByUser(int user_id);

	public abstract Order selectOrderById(int id);

	public abstract List<Order> selectAllOrders();
}
