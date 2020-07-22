package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Product;

public interface IProductService {
	public abstract List<Product> getProducts(int category);

	public abstract Product getProductById(int id);

	public abstract List<Product> getAllProducts();

	public abstract void registerProduct(Product product);
}
