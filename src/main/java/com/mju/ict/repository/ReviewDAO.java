package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Review;

@Repository
public class ReviewDAO implements IReviewDAO{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public List<Review> selectAllReviews() {
		return sqlSession.selectList("selectAllReviews");
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
	public List<Review> selectReviewByProduct(int product_id) {
		return sqlSession.selectList("selectReviewByProduct",product_id);
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



}
