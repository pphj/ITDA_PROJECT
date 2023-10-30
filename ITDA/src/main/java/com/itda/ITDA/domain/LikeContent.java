package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeContent {
	//heart
	private int id;
	private String user_id;
	private int board_num;
	private Timestamp created_at;
	private int heartCount; // 좋아요 갯수를 저장하는 필드 추가
	
	//chboard
	private int boardNum;

	private int chNum;
	private String Writer;
	private String writer;
	// writer둘다지우지마시오
	private String boardTitle;
	private int boardHeart;
	private Timestamp boardDate;
	private String thumbNail;
	private String intro;
	private int cnt;
	
	private String chName;
}
