package com.mju.ict.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mju.ict.model.Discount;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;
import com.mju.ict.repository.IDiscountDAO;
import com.mju.ict.repository.IProductDAO;
import com.mju.ict.util.S3Util;

@Service
public class DiscountService implements IDiscountService {

	@Autowired
	IDiscountDAO discountDAO;

	@Autowired
	IProductDAO productDAO;

	@Autowired
	private S3Util s3;

	private String uploadPath = "discount/img";

	// 할인 전체 조회
	@Override
	public List<Discount> getAllDiscounts(PagingCriteria cri) {
		return discountDAO.selectAllDiscounts(cri);
	}

	// 메인에 노출될 3개의 할인 조회
	@Override
	public List<Discount> getRecentDiscounts() {
		return discountDAO.selectRecentDiscounts();
	}

	// discount_id로 할인 조회
	@Override
	public Discount getDiscountById(int id) {
		return discountDAO.selectDiscountById(id);
	}

	// 할인 등록
	@Override
	public void registerDiscount(Discount discount, int[] productArr, MultipartFile file) {
		discount.setDiscount_thumbnailImg(s3.uploadS3Image(uploadPath, file));

		discountDAO.insertDiscount(discount);

		
		List<Product> products = productDAO.selectAllProducts();
		for (Product p : products) {
			for (int id : productArr) {
				if (p.getProduct_id() == id) {
					p.setDiscount_id(discount.getDiscount_id());
					productDAO.updateProductDiscount(p);
				}
			}
		}
	}

	// 할인 수정
	@Override
	public void updateDiscount(Discount discount, int[] productArr, MultipartFile file) {

		// S3 사진 수정
		if (!file.isEmpty()) {
			s3.fileDelete(discount.getDiscount_thumbnailImg());
			discount.setDiscount_thumbnailImg(s3.uploadS3Image(uploadPath, file));
		}

		List<Product> products = productDAO.selectAllProducts();
		for (Product p : products) {
			// 기존 상품 : 수정 삭제
			if (p.getDiscount_id() == discount.getDiscount_id()) {
				p.setDiscount_id(0);
				productDAO.updateProductDiscountNull(p.getProduct_id());
			}
			// 새로운 상품 : 수정 등록
			for (int id : productArr) {
				if (p.getProduct_id() == id) {
					p.setDiscount_id(discount.getDiscount_id());
					productDAO.updateProductDiscount(p);
				}
			}
		}
		discountDAO.updateDiscount(discount);
	}

	@Override
	public void deleteDiscountById(int id) {
		s3.fileDelete(discountDAO.selectDiscountById(id).getDiscount_thumbnailImg());
		discountDAO.deleteDiscountById(id);

	}

	// 할인 적용 수정
	@Override
	public void changeDiscountApply(int id) {
		Discount discount = discountDAO.selectDiscountById(id);

		if (discount.getDiscount_apply() == 1) {
			discount.setDiscount_apply(0);
		} else {
			discount.setDiscount_apply(1);
		}

		discountDAO.updateDiscountApply(discount);
	}

	
	// 매일 밤 23시 59분 할인날짜를 확인하여 discount_state 변경
	@Scheduled(cron = "0 59 23 1/1 * ?", zone="Asia/Seoul")
	public void changeDiscountState() {
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");

		List<Discount> discounts = discountDAO.selectAllDiscounts();
		for (Discount d : discounts) {
			try {
				int startCompare = d.getDiscount_start().compareTo(date.parse(date.format(today)));
				// 이벤트 시작날짜 <= 현재날짜
				if (startCompare <= 0) {
					int endCompare = d.getDiscount_end().compareTo(date.parse(date.format(today)));
					// 이벤트 끝날짜 >= 현재날짜
					if (endCompare >= 0) {
						d.setDiscount_state(1);
					}
				} else {
					d.setDiscount_state(0);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			discountDAO.updateDiscountState(d);
		}
	}

	@Override
	public int countDiscounts() {
		return discountDAO.countDiscounts();
	}

	@Override
	public int countAppliedDiscounts() {
		return discountDAO.countAppliedDiscounts();
	}

}
