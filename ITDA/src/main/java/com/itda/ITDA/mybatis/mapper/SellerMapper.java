package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;

@Mapper
public interface SellerMapper {
	Seller findById(String userId);

	void insert(Itda_User itda_User);

	Seller sellerEmailCheck(String id);

	int sellerEmailUpdate(Seller seller);
		
	
}
