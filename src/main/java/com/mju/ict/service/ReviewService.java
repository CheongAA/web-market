package com.mju.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Review;
import com.mju.ict.repository.IOrderDetailDAO;
import com.mju.ict.repository.IReviewDAO;

@Service
public class ReviewService implements IReviewService{

	@Autowired
	IReviewDAO reviewDAO;
	
	@Autowired
	IOrderDetailDAO orderDetailDAO;

	@Override
	public List<Review> getAllReviews() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review getReviewById(int id) {
		return reviewDAO.selectReviewById(id);
	}

	
	@Override
	public List<Review> getReviewByUser(int user_id) {
		return reviewDAO.selectReviewByUser(user_id);
	}
	
	@Override
	public List<Review> getReviewByProduct(int product_id) {
		return reviewDAO.selectReviewByProduct(product_id);
	}
	
	
	@Override
	public void registerReview(Review review, int order_detail_id) {
		reviewDAO.insertReview(review);
		
		Map<String,Integer> map = new HashMap<String,Integer>();				   
		map.put("order_detail_id", order_detail_id);
		map.put("review_id", review.getReview_id());
		
		orderDetailDAO.updateReview(map);
		
		
	}

	@Override
	public void updateReview(Review review) {
		reviewDAO.updateReviewById(review);
	}

	@Override
	public void deleteReviewById(int id) {
		reviewDAO.deleteReviewById(id);
	}

	@Override
	public void addReviewView(int id) {
		reviewDAO.addReviewView(id);
	}










}
