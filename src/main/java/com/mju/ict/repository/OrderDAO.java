package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Order;
import com.mju.ict.model.OrderDetail;

@Repository
public class OrderDAO implements IOrderDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public OrderDetail selectOrderDetailById(int id) {
		return sqlSession.selectOne("selectOrderDetailById", id);
	}
	
	
	@Override
	public List<Order> selectAllOrders() {
		return sqlSession.selectList("selectAllOrders");
	}

	@Override
	public List<Order> selectOrderByUser(int user_id) {
		return sqlSession.selectList("selectOrderByUser", user_id);
	}

	@Override
	public Order selectOrderById(int id) {
		return sqlSession.selectOne("selectOrderById",id);
	}

	@Override
	public void insertOrder(Order order) {
		sqlSession.insert("insertOrder", order);
	}

	@Override
	public void updateOrderTracking(Map<String, String> map) {
		sqlSession.update("updateOrderTracking", map);
	}

	@Override
	public void updateOrderState(Map<String, String> map) {
		sqlSession.update("updateOrderState", map);
	}




}
