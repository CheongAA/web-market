package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Category;
import com.mju.ict.repository.ICategoryDAO;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	ICategoryDAO categoryDAO;

	@Override
	public List<Category> getAllCategories() {
		return categoryDAO.selectAllCategories();
	}

	@Override
	public List<Category> getCategoriesByLarge(String large) {
		return categoryDAO.selectCategoriesByLarge(large);
	}


}
