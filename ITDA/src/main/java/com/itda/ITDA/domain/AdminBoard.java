package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminBoard {
	private int adNum;					//번호
	private String userId;				//QNA 질문자
	private String adWriter;			//작성자
	private String adPassword;			//비밀번호
	private String adTitle;				//제목
	private String adContent;			//내용
	private int adView;					//조회수
	private int QcateId;				//카테고리 ID
	private Timestamp adDate;			//작성일
	private Timestamp adUpdate;			//수정일
	private String Key;					//글의 종류
	private String adState;				//상태 

}

