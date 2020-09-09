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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review selectReviewById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Review> selectReviewByUser(int user_id) {
		return sqlSession.selectList("selectReviewByUser", user_id);
	}


	@Override
	public void insertReview(Review review) {
		sqlSession.insert("insertReview", review);
	}

	@Override
	public void updateReview(Review review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReviewById(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addReviewView(int id) {
		// TODO Auto-generated method stub
		
	}


}
