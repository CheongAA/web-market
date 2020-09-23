package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Brand;
import com.mju.ict.model.PagingCriteria;

public interface IBrandDAO {
	public abstract List<Brand> selectAllBrands();
	
	public abstract List<Brand> selectAllBrands(PagingCriteria cri);

	public abstract List<Brand> selectBrandByTerm(String term);

	public abstract Brand selectBrandById(int id);

	public abstract void insertBrand(Brand brand);

	public abstract void updateBrand(Brand brand);

	public abstract void deleteBrandById(int id);

	public abstract int countBrands();



}
