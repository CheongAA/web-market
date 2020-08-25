package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Order;

@Repository
public class OrderDAO implements IOrderDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public void insertOrder(Order order) {
		sqlSession.insert("insertOrder", order);
	}

	@Override
	public List<Order> selectOrderByUser(int user_id) {
		return sqlSession.selectList("selectOrderByUser", user_id);
	}


}
