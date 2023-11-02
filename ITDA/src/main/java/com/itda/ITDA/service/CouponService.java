package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.CouponIssue;

public interface CouponService {

	int isCouponCode(String couponCode);

	CouponIssue isCouponTerm(CouponIssue couponIssue);

	int registerUserCoupon(CouponIssue couponIssue);

	List<CouponIssue> myCouponList(String id);

	int myCouponCount(String id);

	int updateCouponUse(CouponIssue couponIssue);

	CouponIssue isCouponUse(CouponIssue issue);

}
