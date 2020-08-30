package com.mju.ict.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	// Product 사진 업로드 경로
	private String uploadPath = "C:\\Users\\HP\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\market\\resources";
	
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
	public void registerDiscount(Discount discount,int[] productArr, MultipartFile file) {
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


	//할인 적용 수정
	@Override
	public void changeDiscountApply(int id) {
		Discount discount = discountDAO.selectDiscountById(id);
		
		if(discount.getDiscount_apply() == 1) {
			discount.setDiscount_apply(0);
		}else {
			discount.setDiscount_apply(1);
		}
		
		discountDAO.updateDiscountApply(discount);
	}

	//매일 밤 23시 59분 할인날짜를 확인하여 discount_state 변경
	@Scheduled(cron="0 59 23 1/1 * ? *")
	public void changeDiscountState() {
	    Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	
		List<Discount> discounts = discountDAO.selectAllDiscounts();		
		
		for(Discount d:discounts) {
			try {
				int startCompare = d.getDiscount_start().compareTo(date.parse(date.format(today)));
				//이벤트 시작날짜 <= 현재날짜
				if(startCompare <= 0) {
					int endCompare = d.getDiscount_end().compareTo(date.parse(date.format(today)));
					//이벤트 끝날짜 >= 현재날짜
					if(endCompare >= 0) {
						d.setDiscount_state(1);
					}
				}else {
					d.setDiscount_state(0);
				}				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			discountDAO.updateDiscountState(d);			
		}
	}

}
