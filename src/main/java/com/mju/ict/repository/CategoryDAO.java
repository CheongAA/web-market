package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Category;

@Repository
public class CategoryDAO implements ICategoryDAO{
    @Autowired
    private SqlSession sqlSession;


	@Override
	public List<Category> selectAllCategories() {
		return sqlSession.selectList("selectAllCategories");
	}

	@Override
	public List<Category> selectCurrentCategories(int category) {
		return sqlSession.selectList("selectCurrentCategories",category);
	}

	@Override
	public List<Category> selectLargeCategories() {
		return sqlSession.selectList("selectLargeCategories");
	}

	@Override
	public void insertCategory(Category category) {
		sqlSession.insert("insertCategory",category);
		
	}

	@Override
	public void deleteCategoryByCode(int category_code) {
		sqlSession.delete("deleteCategoryByCode",category_code);
	}

	@Override
	public Category selectCategoryByCode(int category_code) {
		return sqlSession.selectOne("selectCategoryByCode", category_code);
	}

	@Override
	public void updateCategory(Category category) {
		sqlSession.update("updateCategory", category);
	}
	

}
