package com.mju.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Product;
import com.mju.ict.repository.IProductDAO;
import com.mju.ict.util.S3Util;
import com.mju.ict.util.UploadFileUtils;

@Service
public class ProductService implements IProductService{

	@Autowired
	IProductDAO productDAO;
	
	@Autowired
	private S3Util s3;

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
	
	
	@Override
	public List<Product> searchProductByTerm(String term) {
		return productDAO.selectProductByTerm(term);
	}

	//상품 등록
	@Override
	public void registerProduct(Product product, MultipartFile file) {
		String uploadPath = "product/img/main";
		
		ResponseEntity<String> img_path = null;
		try {
			img_path = new ResponseEntity<String>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename()),
					HttpStatus.CREATED);
			s3.fileUpload(s3.getBucketName(), uploadPath + img_path.getBody(), file.getBytes());
			product.setProduct_img(s3.getFileURL(uploadPath+img_path.getBody()));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		productDAO.insertProduct(product);
	}
	
	//상품 수정
	@Override
	public void updateProduct(Product product, MultipartFile file) {
//		String imgUploadPath = uploadPath + File.separator + "imgUpload";
//		String ymdPath = U.calcPath(imgUploadPath);
//		String fileName = null;
//
//		if (file != null) {
//			try {
//				fileName = U.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else {
//			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
//		}
//
//		product.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//		product.setProduct_thumbnailImg(
//				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

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
