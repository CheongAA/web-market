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

	@Override
	public void registerCart(Cart cart) {
		List<Cart> userCarts = cartDAO.selectCartsByUser(cart.getUser_id());
		
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

	@Override
	public List<Cart> getCartsByUser(int user_id) {
		return cartDAO.selectCartsByUser(user_id);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDAO.updateCart(cart);
	}

	@Override
	public void deleteCart(int[] cartArr) {
		for(int cart:cartArr) {
			cartDAO.deleteCart(cart);
		}
	}

	@Override
	public List<Cart> getCartsById(int[] cartArr) {
		List<Cart> carts = new ArrayList<Cart>();
		for(int id:cartArr) {
			Cart cart = cartDAO.selectCartById(id);
			carts.add(cart);
		}
		return carts;
	}



}
