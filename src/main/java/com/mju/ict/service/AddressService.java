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

	//user_id로 배송지 조회
	@Override
	public List<Address> getAddressByUser(int user_id) {
		return addressDAO.selectAddressByUser(user_id);
	}
	
	//user_id로 기본 배송지 조회 
	@Override
	public Address getDefaultAddressByUser(int user_id) {
		List<Address> addresses = addressDAO.selectAddressByUser(user_id);
		Address address = null;
		
		for(Address a:addresses) {
			if(a.getAddress_default() == 1) {
				address = a;
			}
		}
		
		//기본 배송지가 없다면 첫번째 배송지를 반환
		if(address == null) {
			return addresses.get(0);
		}
		
		return address;
	}


	//address_id로 배송지 조회
	@Override
	public Address getAddressById(int id) {
		return addressDAO.selectAddressById(id);
	}
	
	//배송지 등록
	@Override
	public void registerAddress(Address address) {
		addressDAO.insertAddress(address);
	}

	//배송지 수정
	@Override
	public void updateAddress(Address address) {
		//기본 배송지 설정
		if(address.getAddress_default() == 1) {
			addressDAO.updateAddressDefaultZero(address.getUser_id());
		}
		addressDAO.updateAddress(address);
		
	}

	//배송지 삭제
	@Override
	public void deleteAddressById(int id) {
		addressDAO.deleteAddress(id);		
	}






}
