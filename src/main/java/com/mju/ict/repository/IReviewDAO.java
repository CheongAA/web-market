package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Review;

public interface IReviewDAO {

	public abstract List<Review> selectAllReviews();

	public abstract Review selectReviewById(int id);
	
	public abstract List<Review> selectReviewByUser(int user_id);
	
	public abstract List<Review> selectReviewByProduct(int product_id);
	
	public abstract void insertReview(Review review);

	public abstract void updateReview(Review review);

	public abstract void deleteReviewById(int id);

	public abstract void addReviewView(int id);




}
