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
	private Timestamp endDate;
	private Timestamp firstDate;
	private int productTerm;
	

//	public void setEndDate(long endDateInMillis) {
//	     this.endDate = new Timestamp(endDateInMillis);
//	  }
}
