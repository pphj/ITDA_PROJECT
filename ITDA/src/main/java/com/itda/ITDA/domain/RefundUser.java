package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RefundUser {
	// GoodUser
	private String userId;
	private int payedNum;
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp firstDate;
	
	// Payment
	private int orderNum;				//주문번호
	private String payedMethod;			//결제수단
	private Timestamp payedDate;		//결제시간
	private int payedPrice;				//결제금액
	private String payedUser;			//입금자
    private String payedBank;			//입금은행
    private Timestamp payedOkDate;		//결제완료시간
    private String payedStatus;			//결제상태
    private String payedCode;			//tid 저장
    private int payedVat;				//부가세
    private int discountPrice;
    
    //Paycall
	private int callNum;			//주문번호
	private int productId;			//상품 ID
    
    //SubProduct
    private int productTerm;				//이용권 표시기간
    
    //couponIssue
	private int cpNum; 						//쿠폰 발송 번호
	private String cpUse;					//쿠폰 사용여부
    private Timestamp couponUseDate;		//사용일
    private Timestamp couponUseExdate;		//만료 날짜
	
	
	

}
