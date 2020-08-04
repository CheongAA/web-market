package com.mju.ict.service;

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
	public void addCart(Cart cart) {
		cartDAO.insertCart(cart);
	}

	@Override
	public List<Cart> getCartsByUser(int user_id) {
		return cartDAO.selectCartsByUser(user_id);
	}



}
