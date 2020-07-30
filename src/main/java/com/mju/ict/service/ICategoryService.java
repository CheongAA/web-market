package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Category;

public interface ICategoryService {
	public abstract List<Category> getAllCategories();
	public abstract List<Category> getCurrentCategories(int category);
}
