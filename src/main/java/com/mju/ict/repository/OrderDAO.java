package com.mju.ict.repository;

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


}
