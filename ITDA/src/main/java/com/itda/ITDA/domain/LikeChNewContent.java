package com.itda.ITDA.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeChNewContent {
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
	
	//channellist
	private String ownerId;
	private String chName;
	private String chProfile;
	private String chInfo;
	private int chFollow;
	private String userProfile;
	private MultipartFile uploadfile;
	private String chProfile_original;
	
	//sub
	private String userid;
	private int subchnum;
	
	
}
