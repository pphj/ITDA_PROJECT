package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Heart {
	private int id;
	private String userId;
	private int boardNum;
	private Timestamp createdAt;
}
