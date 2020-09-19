package com.mju.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Review;
import com.mju.ict.repository.IOrderDetailDAO;
import com.mju.ict.repository.IReviewDAO;
import com.mju.ict.util.S3Util;

@Service
public class ReviewService implements IReviewService{

	@Autowired
	IReviewDAO reviewDAO;
	
	@Autowired
	IOrderDetailDAO orderDetailDAO;
	
	@Autowired
	private S3Util s3;

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
	public void registerReview(Review review, int order_detail_id,MultipartFile file) {
		if(!file.isEmpty()) {
			review.setReview_img(s3.uploadS3Image("review/img",file));
		}
		
		reviewDAO.insertReview(review);
		
		Map<String,Integer> map = new HashMap<String,Integer>();				   
		map.put("order_detail_id", order_detail_id);
		map.put("review_id", review.getReview_id());
		
		orderDetailDAO.updateReview(map);
		
		
	}

	@Override
	public void updateReview(Review review,MultipartFile file) {
		if(!file.isEmpty()) {
			if(review.getReview_img() != null) {
				s3.fileDelete(review.getReview_img());
			}
			review.setReview_img(s3.uploadS3Image("review/img",file));
		}
		reviewDAO.updateReviewById(review);
	}

	@Override
	public void deleteReviewById(int id) {
		s3.fileDelete(reviewDAO.selectReviewById(id).getReview_img());
		reviewDAO.deleteReviewById(id);
	}

	@Override
	public void addReviewView(int id) {
		reviewDAO.addReviewView(id);
	}










}
