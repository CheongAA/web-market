package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.OrderDetail;
import com.mju.ict.model.OrderState;

@Repository
public class OrderStateDAO implements IOrderStateDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<OrderState> selectAllOrderStates() {
		return sqlSession.selectList("selectAllOrderStates");
	}

}
