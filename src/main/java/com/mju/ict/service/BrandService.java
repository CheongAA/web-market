package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Brand;
import com.mju.ict.repository.IBrandDAO;
import com.mju.ict.util.S3Util;
import com.mju.ict.util.UploadFileUtils;

@Service
public class BrandService implements IBrandService{

	@Autowired
	IBrandDAO brandDAO;
	
	@Autowired
	private S3Util s3;
	
	//브랜드 전체 조회
	@Override
	public List<Brand> getAllBrands() {
		return brandDAO.selectAllBrands();
	}
	
	//검색어로 브랜드 조회
	@Override
	public List<Brand> searchBrandByTerm(String term) {
		return brandDAO.selectBrandByTerm(term);
	}

	//brand_id로 브랜드 조회
	@Override
	public Brand getBrandById(int id) {
		return brandDAO.selectBrandById(id);
	}

	//브랜드 등록
	@Override
	public void registerBrand(Brand brand, MultipartFile file) {
		brand.setBrand_img(uploadS3Image(file));
		brandDAO.insertBrand(brand);
	}

	//브랜드 수정
	@Override
	public void updateBrand(Brand brand, MultipartFile file) {
		if(!file.isEmpty()) {
			s3.fileDelete(brand.getBrand_img());
			brand.setBrand_img(uploadS3Image(file));
		}
		brandDAO.updateBrand(brand);
	}
	
	
	//s3 이미지 파일 업로드
	@Override
	public String uploadS3Image(MultipartFile file) {
		String uploadPath = "brand/img";
		
		ResponseEntity<String> img_path = null;
		try {
			img_path = new ResponseEntity<String>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename()),
					HttpStatus.CREATED);
			s3.fileUpload(s3.getBucketName(), uploadPath + img_path.getBody(), file.getBytes());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return s3.getFileURL(uploadPath+img_path.getBody());
	}

	//브랜드 삭제
	@Override
	public void deleteBrandById(int id) {
		s3.fileDelete(brandDAO.selectBrandById(id).getBrand_img());
		brandDAO.deleteBrandById(id);
		
	}




}
