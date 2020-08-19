package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Discount;

public interface IDiscountDAO {

	public abstract void insertDiscount(Discount discount);

	public abstract List<Discount> selectAllDiscounts();

}