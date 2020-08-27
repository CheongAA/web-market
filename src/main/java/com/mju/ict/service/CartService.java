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
		Cart selectedCart = cartDAO.selectCartsByProduct(cart.getProduct_id());
		if(selectedCart !=null) {
			int count = cart.getProduct_count() + selectedCart.getProduct_count();
			selectedCart.setProduct_count(count);
			cartDAO.updateCart(selectedCart);
		}else {
			cartDAO.insertCart(cart);
		}
		
		
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
