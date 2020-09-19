package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Product;

@Repository
public class ProductDAO implements IProductDAO{
    @Autowired
    private SqlSession sqlSession;
    
	@Override
	public List<Product> selectAllProducts() {
		return sqlSession.selectList("selectAllProducts");
	}
    
	@Override
	public List<Product> selectProductsByCategory(int category) {
		return sqlSession.selectList("selectProductsByCategory",category);
	}

	@Override
	public Product selectProductById(int id) {
		return sqlSession.selectOne("selectProductById",id);
	}
	
	@Override
	public List<Product> selectProductByBrand(int id) {
		return sqlSession.selectList("selectProductsByBrand", id);
	}

	@Override
	public List<Product> selectDiscountProducts() {
		return sqlSession.selectList("selectDiscountProducts");
	}

	@Override
	public List<Product> selectNewProducts() {
		return sqlSession.selectList("selectNewProducts");
	}

	@Override
	public List<Product> selectBestProducts() {
		return sqlSession.selectList("selectBestProducts");
	}

	@Override
	public List<Product> selectProductsByDiscount(int id) {
		return sqlSession.selectList("selectProductsByDiscount",id);
	}

	@Override
	public List<Product> selectProductByTerm(String term) {
		return sqlSession.selectList("selectProductByTerm", term);
	}

	@Override
	public void insertProduct(Product product) {
		sqlSession.insert("insertProduct",product);		
	}


	@Override
	public void updateProduct(Product product) {
		sqlSession.update("updateProduct", product);
	}

	
	@Override
	public void updateProductDiscountNull(int product_id) {
		sqlSession.update("updateProductDiscountNull", product_id);
	}
	
	@Override
	public void updateProductSale(Map<String,Integer> map) {
		sqlSession.update("updateProductSale",map);
	}
	
	@Override
	public void updateProductDiscount(Product product) {
		sqlSession.update("updateProductDiscount", product);
	}


	@Override
	public void deleteProductById(int id) {
		sqlSession.delete("deleteProductById", id);
	}

	@Override
	public void addSalesQuantity(Map<String, Integer> map) {
		sqlSession.update("addSalesQuantity",map);
	}







}
