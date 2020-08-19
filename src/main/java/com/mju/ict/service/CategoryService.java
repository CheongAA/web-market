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
	public List<Category> getLargeCategories() {
		return categoryDAO.selectLargeCategories();
	}

	@Override
	public List<Category> getCurrentCategories(int category) {
		if(category % 100 !=0) {
			int large = (category / 100) * 100;
			return categoryDAO.selectCurrentCategories(large);
		}
		return categoryDAO.selectCurrentCategories(category);
	}

	@Override
	public void registerCategory(Category category) {
		categoryDAO.insertCategory(category);
		
	}

	@Override
	public void deleteCategoryByCode(int category_code) {
		categoryDAO.deleteCategoryByCode(category_code);
		
	}

	@Override
	public Category getCategoryByCode(int category_code) {
		return categoryDAO.selectCategoryByCode(category_code);
	}

	@Override
	public void updateCategory(Category category) {
		categoryDAO.updateCategory(category);
	}



}
