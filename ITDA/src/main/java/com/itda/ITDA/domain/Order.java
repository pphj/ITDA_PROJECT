package com.itda.ITDA.domain;

import java.sql.Timestamp;

import org.apache.ibatis.session.SqlSession;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Order {
	private int cnt;
	
	// subproduct 내용
	//private int productId;					//구독 상품 번호
	private String productName;				//구독 상품 이름
    private String productDetail;			//상품 설명
    private int productPrice;				//삼품 가격
    private int productTerm;				//이용권 표시기간
	 
    // paycall 내용
	private int callNum;			//주문번호
	private String userId;			//결제자
	private String couponCode;			//쿠폰 코드
    
    // payment 내용
	private int payedNum;				//결제번호
	private int orderNum;				//주문번호
	private String payedMethod;			//결제수단
	private int payedPrice;				//결제금액
	private String payedUser;			//입금자
    private String payedBank;			//입금은행
    private Timestamp payedOkDate;		//결제완료시간
    private String payedStatus;			//결제상태
    private int discountPrice;
    
    // gooduser 내용
	private Timestamp startDate;
	private Timestamp endDate;
	private Timestamp firstDate;


}


