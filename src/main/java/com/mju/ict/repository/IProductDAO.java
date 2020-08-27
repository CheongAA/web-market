package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.Product;

public interface IProductDAO {
	public abstract List<Product> selectProductsByCategory(int category);

	public abstract Product selectProductById(int id);

	public abstract List<Product> selectAllProducts();

	public abstract void insertProduct(Product product);

	public abstract void deleteProductById(int id);

	public abstract void updateProduct(Product product);

	public abstract List<Product> selectProductByBrand(int id);

	public abstract List<Product> selectDiscountProducts();

	public abstract void updateProductSale(Map<String,Integer> map);

	public abstract List<Product> selectNewProducts();

	public abstract List<Product> selectBestProducts();
}
