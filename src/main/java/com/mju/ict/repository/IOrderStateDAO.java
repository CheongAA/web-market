package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.OrderState;

public interface IOrderStateDAO {

	List<OrderState> selectAllOrderStates();
}
