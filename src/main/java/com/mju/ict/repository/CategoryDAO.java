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
	

}
