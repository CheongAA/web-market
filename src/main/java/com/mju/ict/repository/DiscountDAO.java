package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Discount;
import com.mju.ict.model.PagingCriteria;

@Repository
public class DiscountDAO implements IDiscountDAO{
    @Autowired
    private SqlSession sqlSession;
    

	@Override
	public List<Discount> selectAllDiscounts() {
		return sqlSession.selectList("selectAllDiscounts");
	}
    
	@Override
	public List<Discount> selectAllDiscounts(PagingCriteria cri) {
		return sqlSession.selectList("selectAllDiscountsByCri",cri);
	}
	
	@Override
	public List<Discount> selectRecentDiscounts() {
		return sqlSession.selectList("selectRecentDiscounts");
	}

	@Override
	public Discount selectDiscountById(int id) {
		return sqlSession.selectOne("selectDiscountById", id);
	}

	@Override
	public void insertDiscount(Discount discount) {
		sqlSession.insert("insertDiscount",discount);
	}
	
	@Override
	public void updateDiscount(Discount discount) {
		sqlSession.update("updateDiscount", discount);
	}

	@Override
	public void updateDiscountApply(Discount discount) {
		sqlSession.update("updateDiscountApply",discount);
	}

	@Override
	public void updateDiscountState(Discount discount) {
		sqlSession.update("updateDiscountState",discount);
	}

	@Override
	public void deleteDiscountById(int id) {
		sqlSession.delete("deleteDiscountById", id);
	}

	@Override
	public int countDiscounts() {
		return sqlSession.selectOne("countDiscounts");
	}

	@Override
	public int countAppliedDiscounts() {
		return sqlSession.selectOne("countAppliedDiscounts");
	}




}
