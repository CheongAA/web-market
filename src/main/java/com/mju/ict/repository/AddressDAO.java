package com.mju.ict.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mju.ict.model.Address;

@Repository
public class AddressDAO implements IAddressDAO{
    @Autowired
    private SqlSession sqlSession;


	@Override
	public List<Address> selectAddressByUser(int user_id) {
		return sqlSession.selectList("selectAddressByUser", user_id);
	}

	@Override
	public Address selectAddressById(int id) {
		return sqlSession.selectOne("selectAddressById",id);
	}


	@Override
	public void insertAddress(Address address) {
		sqlSession.insert("insertAddress", address);
	}
	
	@Override
	public void updateAddress(Address address) {
		sqlSession.update("updateAddress",address);
	}

	@Override
	public void updateAddressDefaultZero(int user_id) {
		sqlSession.update("updateAddressDefaultZero",user_id);
	}
	
	@Override
	public void deleteAddress(int id) {
		sqlSession.delete("deleteAddress", id);
	}




}
