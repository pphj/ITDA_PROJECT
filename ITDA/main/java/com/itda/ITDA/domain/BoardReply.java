package com.itda.ITDA.domain;

import java.security.Timestamp;

public class BoardReply {
	private int replyNum;
	private int boardNum;
	private String replyWriter;
	private String replyContent;
	private int replyRef;
	private int replyLev;
	private int replySeq;
	private Timestamp replyDate;
	private Timestamp replyUpdate;
	private int cnt;
	
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyRef() {
		return replyRef;
	}
	public void setReplyRef(int replyRef) {
		this.replyRef = replyRef;
	}
	public int getReplyLev() {
		return replyLev;
	}
	public void setReplyLev(int replyLev) {
		this.replyLev = replyLev;
	}
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public Timestamp getReplyUpdate() {
		return replyUpdate;
	}
	public void setReplyUpdate(Timestamp replyUpdate) {
		this.replyUpdate = replyUpdate;
	}
	
	
	
}
