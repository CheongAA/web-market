package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Brand;

public interface IBrandService {

	public abstract List<Brand> getAllBrands();

	public abstract List<Brand> searchBrandByTerm(String term);

	public abstract Brand getBrandById(int id);

	public abstract void registerBrand(Brand brand);

	public abstract void updateBrand(Brand brand);

	public abstract void deleteBrandById(int id);

}
