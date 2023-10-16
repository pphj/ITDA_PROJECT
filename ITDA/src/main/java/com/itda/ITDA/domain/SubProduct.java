package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubProduct {
	private int productId;					//관리자 ID
	private String productName;				//관리자 비밀번호
	private String productWriter;			//관리자 이름
	private String productUpdater;			//관리자 부서
    private String productDetail;			//관리자 직급
    private int productPrice;				//관리자 이메일
    private int productTerm;				//권한명
    private Timestamp productCreDate;		//권한명
    private Timestamp productUpdateDate;		//권한명
    private String productDelete;			//권한명
    
}
