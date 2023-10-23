package com.itda.ITDA.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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

	@Override
	public String toString() {
		return "BoardReply{" + "replyNum=" + replyNum + ", boardNum=" + boardNum + ", replyWriter='" + replyWriter
				+ '\'' + ", replyContent='" + replyContent + '\'' + ", replyRef=" + replyRef + ", replyLev="
				+ replyLev + ", replySeq=" + replySeq +
				// 날짜 필드가 null인 경우를 대비하여 null 체크를 추가합니다.
				", replyDate="
				+ (replyDate != null ? new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(replyDate) : null) + '}';
	}

}
