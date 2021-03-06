package com.mju.ict.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Brand;
import com.mju.ict.model.PagingCriteria;

public interface IBrandService {

	public abstract List<Brand> getAllBrands();
	
	public abstract List<Brand> getAllBrands(PagingCriteria cri);

	public abstract List<Brand> searchBrandByTerm(String term);

	public abstract Brand getBrandById(int id);

	public abstract void registerBrand(Brand brand, MultipartFile file);

	public abstract void updateBrand(Brand brand, MultipartFile file);

	public abstract void deleteBrandById(int id);

	public abstract int countBrands();




}
