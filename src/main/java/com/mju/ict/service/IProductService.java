package com.mju.ict.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Paging;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;

public interface IProductService {

	public abstract List<Product> getAllProducts();
	
	public abstract List<Product> getProductsByCategory(int category, PagingCriteria cri);

	public abstract Product getProductById(int id);

	public abstract List<Product> getNewProducts();

	public abstract List<Product> getBestProducts();

	public abstract List<Product> getProductsByDiscount(int id);
	
	public abstract List<Product> getProductsByBrand(int id);

	public abstract List<Product> getDiscountProducts(PagingCriteria cri);
	
	public abstract List<Product> searchProductByTerm(String term);

	public abstract void registerProduct(Product product, MultipartFile img, MultipartFile descImg);

	public abstract void deleteProductById(int id);

	public abstract void updateProduct(Product product, MultipartFile img, MultipartFile descImg);

	public abstract void changeProductSale(int id);
	
	// 상품 총 갯수
	public abstract int countProducts();

	public abstract int countProductByCategory(int category_code);

	public abstract int countProductByDiscount();

	public abstract List<Product> getAllProducts(PagingCriteria cri);

}
