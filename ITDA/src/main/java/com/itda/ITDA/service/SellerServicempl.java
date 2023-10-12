package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void saveOrUpdateSeller(Seller seller) {
	    Seller existingSeller = sellerMapper.findById(seller.getUserId());

	    if (existingSeller != null) {
	        // 기존 판매회원 정보가 있는 경우, UPDATE 문을 사용하여 값을 수정합니다.
	        sellerMapper.update(seller);
	    } else {
	        // 기존 판매회원 정보가 없는 경우, INSERT 문을 사용하여 새로운 레코드를 추가합니다.
	        sellerMapper.insert(seller);
	    }
	}
}
