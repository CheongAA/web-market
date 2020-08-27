package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Cart;

public interface ICartDAO {

	public abstract void insertCart(Cart cart);

	public abstract List<Cart> selectCartsByUser(int user_id);

	public abstract void updateCart(Cart cart);

	public abstract void deleteCart(int cart_id);

	public abstract Cart selectCartById(int id);

	public abstract Cart selectCartsByProduct(int product_id);
}
