package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SalesTotal {
	private int salesTotalNum;			//번호
	private int salesTotal;				//일일 총 매출
	private Timestamp collectionDate;	//수집날짜
	private String writer;				//생성자
    private String updater;				//수정자
    private Timestamp creDate;			//생성일
    private Timestamp updateDate;		//수정일
    
}
