package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Product;

@Repository
public class ProductDAO implements IProductDAO{
    @Autowired
    private SqlSession sqlSession;
    
	@Override
	public List<Product> selectProductsByCategory(int category) {
		return sqlSession.selectList("selectProductsByCategory",category);
	}

	@Override
	public Product selectProductById(int id) {
		return sqlSession.selectOne("selectProductById",id);
	}

	@Override
	public List<Product> selectAllProducts() {
		return sqlSession.selectList("selectAllProducts");
	}

	@Override
	public void insertProduct(Product product) {
		sqlSession.insert("insertProduct",product);		
	}
	

}
