package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodUser {
	
	private String userId;
	private int payedNum;
	private Timestamp startDate;
	private long endDate;
	private Timestamp firstDate;
	

}
