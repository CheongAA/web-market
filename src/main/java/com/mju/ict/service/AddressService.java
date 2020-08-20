package com.mju.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mju.ict.model.Address;
import com.mju.ict.repository.IAddressDAO;

@Service
public class AddressService implements IAddressService{

	@Autowired
	IAddressDAO addressDAO;


	@Override
	public void registerAddress(Address address) {
		addressDAO.insertAddress(address);
		
	}


	@Override
	public List<Address> getAddressByUser(int user_id) {
		return addressDAO.selectAddressByUser(user_id);
	}


	@Override
	public Address getAddressById(int id) {
		return addressDAO.selectAddressById(id);
	}


	@Override
	public void updateAddress(Address address) {
		if(address.getAddress_default() == 1) {
			System.out.println(address.getUser_id());
			addressDAO.updateAddressDefaultZero(address.getUser_id());
		}
		addressDAO.updateAddress(address);
		
	}


	@Override
	public void deleteAddressById(int id) {
		addressDAO.deleteAddress(id);
		
	}



}
