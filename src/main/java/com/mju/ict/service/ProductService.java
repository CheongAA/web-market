package com.mju.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}

	@Override
	public List<Product> getProductsByBrand(int id) {
		return productDAO.selectProductByBrand(id);
	}

	@Override
	public List<Product> getDiscountProducts() {
		return productDAO.selectDiscountProducts();
	}

	@Override
	public void changeProductSale(int id) {
		Product product = productDAO.selectProductById(id);
		Map<String,Integer> map = new HashMap<String,Integer>();				   
		map.put("id", id);
		
		if(product.getOn_sale() == 1) {
			map.put("on_sale", 0);
		}else {
			map.put("on_sale", 1);
		}
		
		productDAO.updateProductSale(map);
	}

	@Override
	public List<Product> getNewProducts() {
		return productDAO.selectNewProducts();
	}

	@Override
	public List<Product> getBestProducts() {
		return productDAO.selectBestProducts();
	}

	@Override
	public List<Product> getProductsByDiscount(int id) {
		return productDAO.selectProductsByDiscount(id);
	}

}
