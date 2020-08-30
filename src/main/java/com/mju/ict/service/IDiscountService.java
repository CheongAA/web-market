package com.mju.ict.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Discount;

public interface IDiscountService {

	public abstract List<Discount> getAllDiscounts();

	public abstract Discount getDiscountById(int id);
	
	public abstract void registerDiscount(Discount discount, int[] productArr, MultipartFile file);

	public abstract void changeDiscountApply(int id);

}
