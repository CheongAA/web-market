package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Category;

public interface ICategoryDAO {
	public abstract List<Category> selectAllCategories();
	public abstract List<Category> selectCurrentCategories(int category);
}
