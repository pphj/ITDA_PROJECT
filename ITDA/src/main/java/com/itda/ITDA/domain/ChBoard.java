package com.itda.ITDA.domain;

import java.security.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChBoard {
	private int boardNum;
	private int chNum;
	private String Writer;
	private String boardTitle;
	private int boardHeart;
	private int chCate_Id;
	private String chCate_Name;
	private String boardOpen;
	private String boardNore;
	private Timestamp boardDate;
	private Timestamp boardUpdate;
	private int boardVisit;
	private String thumbNail;
	private String intro;
	private String boardContent;
	private int cnt;

}
