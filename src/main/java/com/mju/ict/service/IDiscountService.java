package com.mju.ict.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Discount;
import com.mju.ict.model.PagingCriteria;

public interface IDiscountService {

	public abstract List<Discount> getAllDiscounts(PagingCriteria cri);
	
	public abstract List<Discount> getRecentDiscounts();

	public abstract Discount getDiscountById(int id);
	
	public abstract void registerDiscount(Discount discount, int[] productArr, MultipartFile file);
	
	public abstract void updateDiscount(Discount discount, int[] productArr, MultipartFile file);

	public abstract void deleteDiscountById(int id);
	
	public abstract void changeDiscountApply(int id);

	public abstract int countDiscounts();

	public abstract int countAppliedDiscounts();





}
