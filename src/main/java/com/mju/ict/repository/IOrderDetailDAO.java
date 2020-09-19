package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.OrderDetail;

public interface IOrderDetailDAO {
	
	public abstract List<OrderDetail> selectOrderDetailByOrderId(int order_id);
	
	public abstract void insertOrderDetail(OrderDetail orderDetail);

	public abstract void updateReview(Map<String, Integer> map);


}
