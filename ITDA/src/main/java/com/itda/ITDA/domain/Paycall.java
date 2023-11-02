package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paycall {
	private int callNum;			//주문번호
	private String userId;			//결제자
	private String couponCode;			//쿠폰 코드
	private int productId;			//상품 ID
	private int callAmount;			//요청 수량
	private int callPrice;			//요청 금액
    private Timestamp callDate;		//요청일
    private int callDiscount;
    
}
