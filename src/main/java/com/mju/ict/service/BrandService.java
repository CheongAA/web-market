package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Brand;
import com.mju.ict.repository.IBrandDAO;

@Service
public class BrandService implements IBrandService{

	@Autowired
	IBrandDAO brandDAO;

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
	public void registerBrand(Brand brand) {
		brandDAO.insertBrand(brand);
	}

	//브랜드 수정
	@Override
	public void updateBrand(Brand brand) {
		brandDAO.updateBrand(brand);
	}

	//브랜드 삭제
	@Override
	public void deleteBrandById(int id) {
		brandDAO.deleteBrandById(id);
		
	}




}
