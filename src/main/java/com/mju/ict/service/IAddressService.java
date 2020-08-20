package com.mju.ict.service;

import java.util.List;

import com.mju.ict.model.Address;

public interface IAddressService {

	public abstract void registerAddress(Address address);

	public abstract List<Address> getAddressByUser(int user_id);

	public abstract Address getAddressById(int id);

	public abstract void updateAddress(Address address);

	public abstract void deleteAddressById(int id);

}
