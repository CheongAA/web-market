package com.mju.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mju.ict.model.Discount;
import com.mju.ict.model.Paging;
import com.mju.ict.model.PagingCriteria;
import com.mju.ict.model.Product;
import com.mju.ict.service.IDiscountService;
import com.mju.ict.service.IProductService;

@Controller
@RequestMapping("/discount")
public class DiscountController {


	@Autowired
	IDiscountService discountService;
	
	@Autowired
	IProductService productService;

	//할인 목록 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getDiscount(PagingCriteria cri,Model model) {
		
	    Paging pageMaker = new Paging();
	    cri.setPerPageNum(5);
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(discountService.countAppliedDiscounts());
	    
	    List<Discount> discounts = discountService.getAllDiscounts(cri);
	    
		model.addAttribute("discounts", discounts);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("activeEvent", "h2");
		return "discount/list";
	}
	
	//할인 상세 페이지
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getDiscountDetail(@PathVariable int id,Model model) {
		Discount discount = discountService.getDiscountById(id);
		List<Product> products = productService.getProductsByDiscount(id);
		
		model.addAttribute("discount", discount);
		model.addAttribute("products", products);
		return "discount/detail";
	}

}
