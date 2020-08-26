package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Cart;
import com.mju.ict.model.Product;

@Repository
public class CartDAO implements ICartDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public void insertCart(Cart cart) {
		sqlSession.insert("insertCart", cart);
		
	}

	@Override
	public List<Cart> selectCartsByUser(int user_id) {
		return sqlSession.selectList("selectCartsByUser", user_id);
	}

	@Override
	public void updateCart(Cart cart) {
		sqlSession.update("updateCart", cart);
	}

}
