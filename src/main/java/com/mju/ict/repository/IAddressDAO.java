package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Address;

public interface IAddressDAO {
	public abstract void insertAddress(Address address);

	public abstract List<Address> selectAddressByUser(int user_id);

}
