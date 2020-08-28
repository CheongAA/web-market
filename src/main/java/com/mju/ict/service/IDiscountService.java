package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Discount;

public interface IDiscountService {

	public abstract void registerDiscount(Discount discount);

	public abstract List<Discount> getAllDiscounts();

	public abstract Discount getDiscountById(int id);

}
