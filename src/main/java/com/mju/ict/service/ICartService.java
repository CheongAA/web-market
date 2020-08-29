package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Cart;

public interface ICartService {

	public abstract List<Cart> getCartsByUser(int user_id);
	
	public abstract List<Cart> getCartsById(int[] cartArr);
	
	public abstract void registerCart(Cart cart);

	public abstract void updateCart(Cart cart);

	public abstract void deleteCart(int[] cartArr);


}
