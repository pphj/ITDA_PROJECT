package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserTotal {
	private int userTotalNum;			//번호
	private int userTotal;				//총 유저수
	private Timestamp collectionDate;	//수집날짜
	private String writer;				//생성자
    private String updater;				//수정자
    private Timestamp creDate;			//생성일
    private Timestamp updateDate;		//수정일
    
}
