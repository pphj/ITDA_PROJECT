package com.itda.ITDA.domain;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Coupon {
	private BigInteger couponCode;			//쿠폰 코드
	//private String couponCode;			//쿠폰 코드
	private int couponNum;				//쿠폰 발행 순서
	private String couponName;			//쿠폰 이름
	private String couponDetail;		//쿠폰 내용
    private int couponPrice;			//쿠폰 가격
    private Timestamp couponCreate;		//생성일
    private int couponTerm;				//쿠폰 이용기간
    private String adminId;				//생성자(관리자 아이디)
    private String couponState;			//활성상태
    private Timestamp couponExdate;		//만료일
}
