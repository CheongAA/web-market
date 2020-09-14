package com.mju.ict.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Brand;

public interface IBrandService {

	public abstract List<Brand> getAllBrands();

	public abstract List<Brand> searchBrandByTerm(String term);

	public abstract Brand getBrandById(int id);

	public abstract void registerBrand(Brand brand, MultipartFile file);

	public abstract void updateBrand(Brand brand, MultipartFile file);

	public abstract void deleteBrandById(int id);

	public abstract String uploadS3Image(MultipartFile file);

}
