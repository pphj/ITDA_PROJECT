package com.itda.ITDA.domain;

import java.security.Timestamp;

public class ChannelList {
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
	
	
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	public int getChNum() {
		return chNum;
	}
	public void setChNum(int chNum) {
		this.chNum = chNum;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public String getChName() {
		return chName;
	}
	public void setChName(String chName) {
		this.chName = chName;
	}
	public String getChProfile() {
		return chProfile;
	}
	public void setChProfile(String chProfile) {
		this.chProfile = chProfile;
	}
	public String getChInfo() {
		return chInfo;
	}
	public void setChInfo(String chInfo) {
		this.chInfo = chInfo;
	}
	public int getCate_Id() {
		return cate_Id;
	}
	public void setCate_Id(int cate_Id) {
		this.cate_Id = cate_Id;
	}
	public int getChFollow() {
		return chFollow;
	}
	public void setChFollow(int chFollow) {
		this.chFollow = chFollow;
	}
	public Timestamp getChOpenDate() {
		return chOpenDate;
	}
	public void setChOpenDate(Timestamp chOpenDate) {
		this.chOpenDate = chOpenDate;
	}
	public int getChVisit() {
		return chVisit;
	}
	public void setChVisit(int chVisit) {
		this.chVisit = chVisit;
	}
	
	
    
}
