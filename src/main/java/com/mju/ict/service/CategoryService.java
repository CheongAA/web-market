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
	public List<Category> getCurrentCategories(int category) {
		if(category % 100 !=0) {
			int large = (category / 100) * 100;
			System.out.println(category);
			System.out.println(large);
			return categoryDAO.selectCurrentCategories(large);
		}
		return categoryDAO.selectCurrentCategories(category);
	}



}
