package com.mju.ict.repository;

import java.util.List;

import com.mju.ict.model.Address;

public interface IAddressDAO {
	public abstract void insertAddress(Address address);

	public abstract List<Address> selectAddressByUser(int user_id);

	public abstract Address selectAddressById(int id);

	public abstract void updateAddress(Address address);

	public abstract void deleteAddress(int id);

	public abstract void updateAddressDefaultZero(int user_id);

}
