package com.itda.ITDA.domain;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Coupon {
	private BigInteger couponCode;		//쿠폰 코드
	private int couponNum;				//쿠폰 발행 순서
	private String couponName;			//쿠폰 이름
	private String couponDetail;		//쿠폰 내용
    private int couponPrice;			//쿠폰 가격
    private Timestamp couponCreate;		//생성일
    private Timestamp couponExdate;		//만료일
    private String adminId;
    
}
