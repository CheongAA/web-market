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
	public List<Cart> selectCartsByUser(int user_id) {
		return sqlSession.selectList("selectCartsByUser", user_id);
	}

	@Override
	public Cart selectCartById(int id) {
		return sqlSession.selectOne("selectCartById",id);
	}

	@Override
	public Cart selectCartsByProduct(int product_id) {
		return sqlSession.selectOne("selectCartByProduct",product_id);
	}
	
	@Override
	public void insertCart(Cart cart) {
		sqlSession.insert("insertCart", cart);
		
	}

	@Override
	public void updateCart(Cart cart) {
		sqlSession.update("updateCart", cart);
	}

	@Override
	public void deleteCart(int cart_id) {
		sqlSession.delete("deleteCart", cart_id);
	}

}
