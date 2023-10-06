package com.itda.ITDA.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaReply {
	private int qnaReplyNum;
	private int adNum;
	private String adminId;
	private String qnaReplyContent;
	private Timestamp qnaReplyDate;
	private Timestamp qnaReplyUpdate;
	private String qnaReplyState;
	
}
