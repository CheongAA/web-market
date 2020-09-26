package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Review;

@Repository
public class ReviewDAO implements IReviewDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Review> selectAllReviews(PagingCriteria cri) {
		return sqlSession.selectList("selectAllReviews",cri);
	}

	@Override
	public Review selectReviewById(int id) {
		return sqlSession.selectOne("selectReviewById", id);
	}
	
	@Override
	public List<Review> selectReviewByUser(int user_id) {
		return sqlSession.selectList("selectReviewByUser", user_id);
	}
	
	@Override
	public List<Review> selectReviewByProduct(Map<String, Integer> map) {
		return sqlSession.selectList("selectReviewByProduct",map);
	}


	@Override
	public void insertReview(Review review) {
		sqlSession.insert("insertReview", review);
	}

	@Override
	public void updateReviewById(Review review) {
		sqlSession.update("updateReviewById",review);
	}

	@Override
	public void deleteReviewById(int id) {
		sqlSession.delete("deleteReview",id);
	}

	@Override
	public void addReviewView(int id) {
		sqlSession.update("addReviewView",id);
	}

	@Override
	public int countReviews() {
		return sqlSession.selectOne("countReviews");
	}

	@Override
	public int countReviewsByProduct(int id) {
		return sqlSession.selectOne("countReviewsByProduct",id);
	}




}
