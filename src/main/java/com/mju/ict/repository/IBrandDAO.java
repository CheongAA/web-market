package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Brand;

public interface IBrandDAO {
	public abstract List<Brand> selectAllBrands();
}
