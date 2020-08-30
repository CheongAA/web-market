package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Discount;

public interface IDiscountDAO {

	public abstract List<Discount> selectAllDiscounts();

	public abstract List<Discount> selectRecentDiscounts();

	public abstract Discount selectDiscountById(int id);

	public abstract void insertDiscount(Discount discount);
	
	public abstract void updateDiscount(Discount discount);

	public abstract void updateDiscountApply(Discount discount);

	public abstract void updateDiscountState(Discount discount);

}
