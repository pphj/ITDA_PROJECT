package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerWaiting {
	private int waitNum;			//번호
	private String userId;			//신청자 ID
	private String waitPhone;		//연락처
	private String waitEmail;		//이메일
	private Timestamp waitDate;		//신청일
    private String adminId;			//관리자 ID
    private Timestamp waitOkDate;	//승일날짜
    private String waitState;		//상태
    
}
