package com.mju.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Category;
import com.mju.ict.repository.ICategoryDAO;

@Service
public class CategoryService implements ICategoryService{

	@Autowired
	ICategoryDAO categoryDAO;

	
	//카테고리 전체 조회
	@Override
	public List<Category> getAllCategories() {
		return categoryDAO.selectAllCategories();
	}
	
	//대분류 카테고리 조회
	@Override
	public Map<String, String> getLargeCategories() {
		List<Category> categories = categoryDAO.selectLargeCategories();
		Map<String, String> result = new HashMap<String,String>();
		for(Category c:categories) {
			result.put( Integer.toString(c.getCategory_code()), c.getCategory_name());
		}
		return result;
	}

	//현재 카테고리 조회
	@Override
	public List<Category> getCurrentCategories(int category) {
		//중분류 카테고리 
		if(category % 100 !=0) {
			int large = (category / 100) * 100;
			return categoryDAO.selectCurrentCategories(large);
		}
		//대분류 카테고리
		return categoryDAO.selectCurrentCategories(category);
	}
	
	//category_code로 카테고리 조회
	@Override
	public Category getCategoryByCode(int category_code) {
		return categoryDAO.selectCategoryByCode(category_code);
	}
	
	//카테고리 등록
	@Override
	public void registerCategory(Category category) {
		categoryDAO.insertCategory(category);
		
	}
	
	//카테고리 수정
	@Override
	public void updateCategory(Category category) {
		categoryDAO.updateCategory(category);
	}

	//카테고리 삭제
	@Override
	public void deleteCategoryByCode(int category_code) {
		categoryDAO.deleteCategoryByCode(category_code);
	}

}
