package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Discount;
import com.mju.ict.model.Product;
import com.mju.ict.repository.IDiscountDAO;
import com.mju.ict.repository.IProductDAO;

@Service
public class DiscountService implements IDiscountService{

	@Autowired
	IDiscountDAO discountDAO;
	
	@Autowired
	IProductDAO productDAO;


	@Override
	public void registerDiscount(Discount discount,int[] productArr) {
		discountDAO.insertDiscount(discount);
		System.out.println(discount.getDiscount_id());
		
		List<Product> products = productDAO.selectAllProducts();
		for(Product p:products) {
			for(int id:productArr) {
				if(p.getProduct_id() == id) {
					p.setDiscount_id(discount.getDiscount_id());
					productDAO.updateProduct(p);
				}
			}
		}
	}


	@Override
	public List<Discount> getAllDiscounts() {
		return discountDAO.selectAllDiscounts();
	}


	@Override
	public Discount getDiscountById(int id) {
		return discountDAO.selectDiscountById(id);
	}


}
