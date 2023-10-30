package com.itda.ITDA.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponIssue {
	private int cpNum; 						//쿠폰 발송 번호
	private String couponCode;				//쿠폰 코드
	private String userId;					//유저 아이디
	private String cpUse;					//쿠폰 사용여부
    private Timestamp couponUseDate;		//사용일
    private Timestamp startDate;			//받은 날짜
    private Timestamp couponUseExdate;		//만료 날짜
    
    //---------- 
	private String couponName;			//쿠폰 이름
	private String couponDetail;		//쿠폰 내용
    private int couponPrice;			//쿠폰 가격
    private int couponTerm;				//쿠폰 이용기간
    private String couponState;			//활성상태

}
