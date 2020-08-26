package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Cart;

public interface ICartService {

	public abstract void addCart(Cart cart);

	public abstract List<Cart> getCartsByUser(int user_id);

	public abstract void updateCart(Cart cart);
}
