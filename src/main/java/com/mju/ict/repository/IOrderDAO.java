package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;

public interface IOrderDAO {
	
	public abstract List<Order> selectAllOrders();

	public abstract List<Order> selectOrderByUser(int user_id);

	public abstract Order selectOrderById(int id);
	
	public abstract OrderDetail selectOrderDetailById(int id);

	public abstract OrderDetail selectOrderDetailByReview(int id);

	public abstract void insertOrder(Order order);

	public abstract void updateOrderTracking(Map<String, Integer> map);

	public abstract void updateOrderState(Map<String, Integer> map);


}
