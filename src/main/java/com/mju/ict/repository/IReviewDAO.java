package com.mju.ict.repository;

import java.util.List;
import java.util.Map;

import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Review;

public interface IReviewDAO {

	public abstract List<Review> selectAllReviews(PagingCriteria cri);

	public abstract Review selectReviewById(int id);
	
	public abstract List<Review> selectReviewByUser(int user_id);
	
	public abstract List<Review> selectReviewByProduct(Map<String, Integer> map);
	
	public abstract void insertReview(Review review);

	public abstract void updateReviewById(Review review);

	public abstract void deleteReviewById(int id);

	public abstract void addReviewView(int id);

	public abstract int countReviews();

	public abstract int countReviewsByProduct(int id);




}
