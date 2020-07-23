package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Product;
import com.mju.ict.repository.IProductDAO;

@Service
public class ProductService implements IProductService{

	@Autowired
	IProductDAO productDAO;
	
	@Override
	public List<Product> getProductsByCategory(int category) {
		return productDAO.selectProductsByCategory(category);
	}

	@Override
	public Product getProductById(int id) {
		return productDAO.selectProductById(id);
	}

	@Override
	public List<Product> getAllProducts() {
		return productDAO.selectAllProducts();
	}

	@Override
	public void registerProduct(Product product) {
		productDAO.insertProduct(product);
		
	}

	@Override
	public void deleteProductById(int id) {
		productDAO.deleteProductById(id);
	}

	@Override
	public Product updateProduct(Product product) {
		productDAO.updateProduct(product);
		return productDAO.selectProductById(product.getProduct_id());
	}

}
