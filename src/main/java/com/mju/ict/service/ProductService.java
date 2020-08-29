package com.mju.ict.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Product;
import com.mju.ict.repository.IProductDAO;
import com.mju.ict.util.UploadFileUtils;

@Service
public class ProductService implements IProductService{

	@Autowired
	IProductDAO productDAO;
	
	// Product 사진 업로드 경로
	private String uploadPath = "C:\\Users\\HP\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\market\\resources";

	
	//상품 전체 조회
	@Override
	public List<Product> getAllProducts() {
		return productDAO.selectAllProducts();
	}

	//할인 상품 조회
	@Override
	public List<Product> getDiscountProducts() {
		return productDAO.selectDiscountProducts();
	}
	
	//신상품 조회
	@Override
	public List<Product> getNewProducts() {
		return productDAO.selectNewProducts();
	}

	//베스트 상품 조회
	@Override
	public List<Product> getBestProducts() {
		return productDAO.selectBestProducts();
	}
	
	//category_code로 상품 조회
	@Override
	public List<Product> getProductsByCategory(int category) {
		return productDAO.selectProductsByCategory(category);
	}

	//product_id로 상품 조회
	@Override
	public Product getProductById(int id) {
		return productDAO.selectProductById(id);
	}

	//brand_id로 상품 조회
	@Override
	public List<Product> getProductsByBrand(int id) {
		return productDAO.selectProductByBrand(id);
	}

	//discount_id로 상품 조회
	@Override
	public List<Product> getProductsByDiscount(int id) {
		return productDAO.selectProductsByDiscount(id);
	}
	
	

	//상품 등록
	@Override
	public void registerProduct(Product product, MultipartFile file) {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file != null) {
			try {
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			}catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		product.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		product.setProduct_thumbnailImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		productDAO.insertProduct(product);
		
	}
	
	//상품 수정
	@Override
	public void updateProduct(Product product) {
		productDAO.updateProduct(product);
	}

	//상품 삭제
	@Override
	public void deleteProductById(int id) {
		productDAO.deleteProductById(id);
	}

	//상품 노출 수정
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



}
