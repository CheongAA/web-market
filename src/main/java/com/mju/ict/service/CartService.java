package com.mju.ict.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Cart;
import com.mju.ict.repository.ICartDAO;

@Service
public class CartService implements ICartService{

	@Autowired
	ICartDAO cartDAO;
	
	//user_id로 장바구니 조회
	@Override
	public List<Cart> getCartsByUser(int user_id) {
		return cartDAO.selectCartsByUser(user_id);
	}
	
	//cart_id[]로 장바구니 조회 
	@Override
	public List<Cart> getCartsById(int[] cartArr) {
		List<Cart> carts = new ArrayList<Cart>();
		for(int id:cartArr) {
			Cart cart = cartDAO.selectCartById(id);
			carts.add(cart);
		}
		return carts;
	}

	//장바구니 등록
	@Override
	public void registerCart(Cart cart) {
		List<Cart> userCarts = cartDAO.selectCartsByUser(cart.getUser_id());
		
		//장바구니에 이미 존재하는 상품일 때 count만 상승
		for(Cart uc:userCarts) {
			if(uc.getProduct_id() == cart.getProduct_id()) {
				int count = cart.getProduct_count() + uc.getProduct_count();
				uc.setProduct_count(count);
				cartDAO.updateCart(uc);
				return;
			}
		}
		cartDAO.insertCart(cart);
	}

	//장바구니 수정
	@Override
	public void updateCart(Cart cart) {
		cartDAO.updateCart(cart);
	}

	//장바구니 삭제
	@Override
	public void deleteCart(int[] cartArr) {
		for(int cart:cartArr) {
			cartDAO.deleteCart(cart);
		}
	}





}
