package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Paging;
import com.mju.ict.model.PagingCriteria;
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
	public List<Product> selectProductsByCategory(Map<String,Object> map) {
		return sqlSession.selectList("selectProductsByCategory",map);
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
	public List<Product> selectDiscountProducts(PagingCriteria cri) {
		return sqlSession.selectList("selectDiscountProducts",cri);
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


	@Override
	public int countProducts() {
		return sqlSession.selectOne("countProducts");
	}

	@Override
	public int countProductByCategory(int category_code) {
		return sqlSession.selectOne("countProductByCategory",category_code);
	}

	@Override
	public int countProductByDiscount() {
		return  sqlSession.selectOne("countProductByDiscount");
	}

	@Override
	public List<Product> selectAllProducts(PagingCriteria cri) {
		return sqlSession.selectList("selectAllProductsByCri",cri);
	}







}
