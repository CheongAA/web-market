package com.mju.ict.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.OrderDetail;

@Repository
public class OrderDetailDAO implements IOrderDetailDAO{
    @Autowired
    private SqlSession sqlSession;


	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		sqlSession.insert("insertOrderDetail", orderDetail);
	}


}
