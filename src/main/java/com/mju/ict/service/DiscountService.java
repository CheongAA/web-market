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
	
	//할인 전체 조회
	@Override
	public List<Discount> getAllDiscounts() {
		return discountDAO.selectAllDiscounts();
	}


	//discount_id로 할인 조회
	@Override
	public Discount getDiscountById(int id) {
		return discountDAO.selectDiscountById(id);
	}

	//할인 등록
	@Override
	public void registerDiscount(Discount discount,int[] productArr) {
		discountDAO.insertDiscount(discount);
		
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





}
