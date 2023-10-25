package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Payment {
	private int payedNum;				//결제번호
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

    
    // gooduser에 insert를 위한 도메인
    private String userId;
    private int productTerm;
    private Timestamp firstDate;
    


}
