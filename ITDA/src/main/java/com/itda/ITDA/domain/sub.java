package com.itda.ITDA.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class sub {
	private int subsnum;
	private String userid;
	private int subchnum;
	private Timestamp subdate;
	private String userGender;
	private Date userBirth;
}
