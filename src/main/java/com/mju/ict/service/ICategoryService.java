package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Category;

public interface ICategoryService {
	public abstract List<Category> getAllCategories();
	public abstract List<Category> getCurrentCategories(int category);
	public abstract List<Category> getLargeCategories();
	public abstract void registerCategory(Category category);
	public abstract void deleteCategoryByCode(int category_code);
	public abstract Category getCategoryByCode(int category_code);
	public abstract void updateCategory(Category category);
}
