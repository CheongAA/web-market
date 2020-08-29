package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Category;

public interface ICategoryDAO {
	
	public abstract List<Category> selectAllCategories();
	
	public abstract List<Category> selectCurrentCategories(int category);
	
	public abstract List<Category> selectLargeCategories();

	public abstract Category selectCategoryByCode(int category_code);
	
	public abstract void insertCategory(Category category);
	
	public abstract void updateCategory(Category category);
	
	public abstract void deleteCategoryByCode(int category_code);
	
}
