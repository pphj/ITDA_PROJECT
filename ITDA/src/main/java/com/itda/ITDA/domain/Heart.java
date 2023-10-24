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
	private int heartCount; // 좋아요 갯수를 저장하는 필드 추가
}
