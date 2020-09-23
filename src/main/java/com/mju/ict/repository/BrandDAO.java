package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Brand;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;

@Repository
public class BrandDAO implements IBrandDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Brand> selectAllBrands() {
		return sqlSession.selectList("selectAllBrands");
	}

	@Override
	public List<Brand> selectBrandByTerm(String term) {
		return sqlSession.selectList("selectBrandByTerm", term);
	}

	@Override
	public Brand selectBrandById(int id) {
		return sqlSession.selectOne("selectBrandById",id);
	}

	@Override
	public void insertBrand(Brand brand) {
		sqlSession.insert("insertBrand", brand);
		
	}

	@Override
	public void updateBrand(Brand brand) {
		sqlSession.update("updateBrand", brand);
	}

	@Override
	public void deleteBrandById(int id) {
		sqlSession.delete("deleteBrandById", id);
	}

	@Override
	public List<Brand> selectAllBrands(PagingCriteria cri) {
		return sqlSession.selectList("selectAllBrandsByCri",cri);
	}

	@Override
	public int countBrands() {
		return sqlSession.selectOne("countBrands");
	}

	

}
