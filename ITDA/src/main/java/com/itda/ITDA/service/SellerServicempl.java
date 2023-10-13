package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.mybatis.mapper.SellerMapper;

@Service
public class SellerServicempl implements SellerService {

	private final SellerMapper sellerMapper;

	@Autowired
	public SellerServicempl(SellerMapper sellerMapper) {
		this.sellerMapper = sellerMapper;
	}

	@Override
	public boolean isSeller(String userId) {
		// userId로 판매회원 정보를 조회하여, 해당 사용자가 판매회원인지 확인합니다.
		return sellerMapper.findById(userId) != null;
	}

	@Override
	public void saveSeller(Itda_User itda_User) {
		// TODO Auto-generated method stub
		sellerMapper.insert(itda_User);

	}
}
