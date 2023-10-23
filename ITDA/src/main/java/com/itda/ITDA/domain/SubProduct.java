package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubProduct {
	private int productId;					//구독 상품 번호
	private String productName;				//구독 상품 이름
	private String productWriter;			//구독 상품 만든이 
	private String productUpdater;			//수정한 사람
    private String productDetail;			//상품 설명
    private int productPrice;				//삼품 가격
    private int productTerm;				//이용권 표시기간
    private Timestamp productCreDate;		//생성일
    private Timestamp productUpdateDate;	//수정일
    private String productDelete;			//삭제일
    
}
