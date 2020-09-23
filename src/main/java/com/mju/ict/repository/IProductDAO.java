package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.Paging;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;

public interface IProductDAO {
	
	public abstract List<Product> selectAllProducts();
	
	public abstract List<Product> selectProductsByCategory(Map<String,Object> map);

	public abstract Product selectProductById(int id);

	public abstract List<Product> selectProductByBrand(int id);

	public abstract List<Product> selectDiscountProducts(PagingCriteria cri);

	public abstract List<Product> selectNewProducts();

	public abstract List<Product> selectBestProducts();

	public abstract List<Product> selectProductsByDiscount(int id);
	
	public abstract List<Product> selectProductByTerm(String term);

	public abstract void insertProduct(Product product);

	public abstract void updateProduct(Product product);
	
	public abstract void updateProductDiscountNull(int product_id);

	public abstract void updateProductSale(Map<String,Integer> map);
	
	public abstract void updateProductDiscount(Product product);
	
	public abstract void deleteProductById(int id);

	public abstract void addSalesQuantity(Map<String,Integer> map);

	public abstract int countProductList();

	public abstract int countProductByCategory(int category_code);

	public abstract int countProductByDiscount();



}
