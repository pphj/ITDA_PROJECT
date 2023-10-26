package com.itda.ITDA.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeChannel {
	private String userId;
	private int subchnum;
	private Timestamp subdate;
	private int chNum;
	private String ownerId;
	private String chName;
	private String chProfile;
	private String chInfo;
	private int cate_Id;
	private int chFollow;
	private Timestamp chOpenDate;
	private int chVisit;
	private String userProfile;
	private MultipartFile uploadfile;
	private String chProfile_original;

}
