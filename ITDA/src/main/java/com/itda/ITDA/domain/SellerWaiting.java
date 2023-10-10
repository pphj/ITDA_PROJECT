package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerWaiting {
	private int wNum;				//번호
	private String userId;			//신청자 ID
	private String wPhone;			//연락처
	private String wEmail;			//이메일
	private Timestamp waitDate;		//신청일
    private String adminId;			//관리자 ID
    private Timestamp wOkDate;		//승일날짜
    private String wState;			//상태
    
}
