package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Review;
import com.mju.ict.repository.IReviewDAO;

@Service
public class ReviewService implements IReviewService{

	@Autowired
	IReviewDAO reviewDAO;

	@Override
	public List<Review> getAllReviews() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review getReviewById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<Review> getReviewByUser(int user_id) {
		return reviewDAO.selectReviewByUser(user_id);
	}
	
	
	@Override
	public void registerReview(Review review) {
		// TODO Auto-generated method stub
		
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
