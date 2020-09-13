package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Brand;

public interface IBrandDAO {
	public abstract List<Brand> selectAllBrands();

	public abstract List<Brand> selectBrandByTerm(String term);

	public abstract Brand selectBrandById(int id);

	public abstract void insertBrand(Brand brand);

	public abstract void updateBrand(Brand brand);

	public abstract void deleteBrandById(int id);

}
