package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Seller;

@Mapper
public interface SellerMapper {
	Seller findById(String userId);

	void save(Seller seller);
}
