package com.mju.ict.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Review;

public interface IReviewService {

	public abstract List<Review> getAllReviews(PagingCriteria cri);

	public abstract List<Review> getReviewByUser(int user_id);
	
	public abstract List<Review> getReviewByProduct(int product_id);

	public abstract Review getReviewById(int id);


	public abstract void registerReview(Review review, int order_detail_id, MultipartFile file);
	
	public abstract void updateReview(Review review, MultipartFile file);

	public abstract void deleteReviewById(int id);

	public abstract void addReviewView(int id);

	public abstract int countReviews();




}
