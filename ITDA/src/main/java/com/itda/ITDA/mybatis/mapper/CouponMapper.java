package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.CouponIssue;

@Mapper
public interface CouponMapper {

	int isCouponCode(String couponCode);

	Coupon isCouponTerm(Coupon coupon);

	int registerUserCoupon(CouponIssue couponIssue);

	List<CouponIssue> myCouponList(String id);

	int myCouponCount(String id);

}
