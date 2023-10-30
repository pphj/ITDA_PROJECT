package com.itda.ITDA.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class ChBoard {
	private int boardNum;
	private int chNum;
	private String Writer;
	private String writer;
	// writer둘다지우지마시오
	private String boardTitle;
	private int boardHeart;
	private int chCate_Id;
	private String chCate_Name;
	private String boardOpen;
	private String boardNore;
	private String boardDate;
	private String boardUpdate;
	private Integer boardVisit;
	private MultipartFile upload;
	private String thumbNail;
	private String intro;
	private String boardContent;
	private int cnt;

}
