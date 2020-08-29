package com.mju.ict.service;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.Category;

public interface ICategoryService {
	
	public abstract List<Category> getAllCategories();
	
	public abstract List<Category> getCurrentCategories(int category);
	
	public abstract Map<String, String> getLargeCategories();
	
	public abstract Category getCategoryByCode(int category_code);
	
	public abstract void registerCategory(Category category);
	
	public abstract void updateCategory(Category category);
	
	public abstract void deleteCategoryByCode(int category_code);

}
