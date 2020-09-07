package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Review;

public interface IReviewService {

	public abstract List<Review> getAllReviews();

	public abstract Review getReviewById(int id);
	
	public abstract List<Review> getReviewByUser(int user_id);

	public abstract void registerReview(Review review);

	public abstract void updateReview(Review review);

	public abstract void deleteReviewById(int id);

	public abstract void addReviewView(int id);

}
