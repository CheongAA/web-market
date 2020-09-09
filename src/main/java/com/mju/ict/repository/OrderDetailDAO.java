package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

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


	@Override
	public void updateReview(Map<String, Integer> map) {
		sqlSession.update("updateReview", map);
	}


}
