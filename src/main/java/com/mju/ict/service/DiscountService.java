package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Discount;
import com.mju.ict.repository.IDiscountDAO;

@Service
public class DiscountService implements IDiscountService{

	@Autowired
	IDiscountDAO discountDAO;


	@Override
	public void registerDiscount(Discount discount) {
		discountDAO.insertDiscount(discount);		
	}


	@Override
	public List<Discount> getAllDiscounts() {
		return discountDAO.selectAllDiscounts();
	}


}
