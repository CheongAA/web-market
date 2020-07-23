package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Product;

public interface IProductDAO {
	public abstract List<Product> selectProductsByCategory(int category);

	public abstract Product selectProductById(int id);

	public abstract List<Product> selectAllProducts();

	public abstract void insertProduct(Product product);

	public abstract void deleteProductById(int id);

	public abstract void updateProduct(Product product);
}
