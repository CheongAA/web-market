package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Brand;
import com.mju.ict.model.PagingCriteria;
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
		brand.setBrand_img(s3.uploadS3Image("brand/img",file));
		brandDAO.insertBrand(brand);
	}

	//브랜드 수정
	@Override
	public void updateBrand(Brand brand, MultipartFile file) {
		if(!file.isEmpty()) {
			s3.fileDelete(brand.getBrand_img());
			brand.setBrand_img(s3.uploadS3Image("brand/img",file));
		}
		brandDAO.updateBrand(brand);
	}


	//브랜드 삭제
	@Override
	public void deleteBrandById(int id) {
		s3.fileDelete(brandDAO.selectBrandById(id).getBrand_img());
		brandDAO.deleteBrandById(id);
		
	}

	@Override
	public List<Brand> getAllBrands(PagingCriteria cri) {
		return brandDAO.selectAllBrands(cri);
	}

	@Override
	public int countBrands() {
		return brandDAO.countBrands();
	}




}
