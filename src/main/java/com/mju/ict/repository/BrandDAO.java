package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Brand;
import com.mju.ict.model.Product;

@Repository
public class BrandDAO implements IBrandDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Brand> selectAllBrands() {
		return sqlSession.selectList("selectAllBrands");
	}
	

}
