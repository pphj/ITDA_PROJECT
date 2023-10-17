package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayedData {
	private String payment_method_type;		//결제 수단, CARD 또는 MONEY 중 하나
	private String item_name;				//상품 이름, 최대 100자
	private String item_code;				//상품 코드, 최대 100자
    private int quantity;					//상품 수량
    private Timestamp created_at;			//결제 준비 요청 시각
    private Timestamp approved_at;			//결제 승인 시각
    private String payload;					//결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용
}
