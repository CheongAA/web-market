package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Product;
import com.mju.ict.repository.IBrandDAO;
import com.mju.ict.repository.IProductDAO;

@Service
public class BrandService implements IBrandService{

	@Autowired
	IBrandDAO brandDAO;

	@Override
	public List<Brand> getAllBrands() {
		return brandDAO.selectAllBrands();
	}

	@Override
	public Brand getBrandById(int id) {
		return brandDAO.selectBrandById(id);
	}

	@Override
	public void registerBrand(Brand brand) {
		brandDAO.insertBrand(brand);
	}

	@Override
	public Brand updateBrand(Brand brand) {
		brandDAO.updateBrand(brand);
		return brandDAO.selectBrandById(brand.getBrand_id());
	}

	@Override
	public void deleteBrandById(int id) {
		brandDAO.deleteBrandById(id);
		
	}


}
