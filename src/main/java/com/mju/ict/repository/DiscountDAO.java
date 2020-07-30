package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Discount;

@Repository
public class DiscountDAO implements IDiscountDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public void insertDiscount(Discount discount) {
		sqlSession.insert("insertDiscount",discount);
	}

	@Override
	public List<Discount> selectAllDiscounts() {
		return sqlSession.selectList("selectAllDiscounts");
	}

}
