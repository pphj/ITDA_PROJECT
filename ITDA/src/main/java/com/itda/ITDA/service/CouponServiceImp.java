package com.itda.ITDA.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.CouponIssue;
import com.itda.ITDA.mybatis.mapper.CouponMapper;

@Service
public class CouponServiceImp implements CouponService{

	private CouponMapper dao;
	
	public CouponServiceImp(CouponMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int isCouponCode(String couponCode) {
		return dao.isCouponCode(couponCode);
	}

	@Override
	public CouponIssue isCouponTerm(CouponIssue CouponIssue) {
		return dao.isCouponTerm(CouponIssue);
	}

	@Override
	public int registerUserCoupon(CouponIssue couponIssue) {
		return dao.registerUserCoupon(couponIssue);
	}

	@Override
	public List<CouponIssue> myCouponList(String id) {
		return dao.myCouponList(id);
	}

	@Override
	public int myCouponCount(String id) {
		return dao.myCouponCount(id);
	}

	@Override
	public int updateCouponUse(CouponIssue couponIssue) {
		return dao.updateCouponUse(couponIssue);
	}

	@Override
	public CouponIssue isCouponUse(CouponIssue issue) {
		return dao.isCouponUse(issue);
	}
	

}
