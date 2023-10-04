package com.itda.ITDA.domain;

import java.sql.Timestamp;

public class AdminBoard {
	private int adNum;					//번호
	private String userId;				//QNA 질문자
	private String adWriter;			//작성자
	private String adPassword;			//비밀번호
	private String adTitle;				//제목
	private String adContent;			//내용
	private int adView;					//조회수
	private int QcateId;				//카테고리 ID
	private Timestamp adDate;			//작성일
	private Timestamp adUpdate;			//수정일
	private String Key;					//글의 종류
	
	
	public int getAdNum() {
		return adNum;
	}
	public void setAdNum(int adNum) {
		this.adNum = adNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAdWriter() {
		return adWriter;
	}
	public void setAdWriter(String adWriter) {
		this.adWriter = adWriter;
	}
	public String getAdPassword() {
		return adPassword;
	}
	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}
	public String getAdTitle() {
		return adTitle;
	}
	public void setAdTitle(String adTitle) {
		this.adTitle = adTitle;
	}
	public String getAdContent() {
		return adContent;
	}
	public void setAdContent(String adContent) {
		this.adContent = adContent;
	}
	public int getAdView() {
		return adView;
	}
	public void setAdView(int adView) {
		this.adView = adView;
	}
	public int getQcateId() {
		return QcateId;
	}
	public void setQcateId(int qcateId) {
		QcateId = qcateId;
	}
	public Timestamp getAdDate() {
		return adDate;
	}
	public void setAdDate(Timestamp adDate) {
		this.adDate = adDate;
	}
	public Timestamp getAdUpdate() {
		return adUpdate;
	}
	public void setAdUpdate(Timestamp adUpdate) {
		this.adUpdate = adUpdate;
	}
	public String getKey() {
		return Key;
	}
	public void setKey(String key) {
		Key = key;
	}
}
