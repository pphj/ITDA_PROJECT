package com.itda.ITDA.domain;

import java.security.Timestamp;

public class ChBoard {
	private int boardNum;
	private int chNum;
	private String Writer;
	private String boardTitle;
	private int boardHeart;
	private int chCate_Id;
	private String boardOpen;
	private String boardNore;
	private Timestamp boardDate;
	private Timestamp boardUpdate;
	private int boardVisit;
	private String thumbNail;
	private String intro;
	private String boardContent;
	private int cnt;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getChNum() {
		return chNum;
	}
	public void setChNum(int chNum) {
		this.chNum = chNum;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getBoardHeart() {
		return boardHeart;
	}
	public void setBoardHeart(int boardHeart) {
		this.boardHeart = boardHeart;
	}
	public int getChCate_Id() {
		return chCate_Id;
	}
	public void setChCate_Id(int chCate_Id) {
		this.chCate_Id = chCate_Id;
	}
	public String getBoardOpen() {
		return boardOpen;
	}
	public void setBoardOpen(String boardOpen) {
		this.boardOpen = boardOpen;
	}
	public String getBoardNore() {
		return boardNore;
	}
	public void setBoardNore(String boardNore) {
		this.boardNore = boardNore;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public Timestamp getBoardUpdate() {
		return boardUpdate;
	}
	public void setBoardUpdate(Timestamp boardUpdate) {
		this.boardUpdate = boardUpdate;
	}
	public int getBoardVisit() {
		return boardVisit;
	}
	public void setBoardVisit(int boardVisit) {
		this.boardVisit = boardVisit;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
}
