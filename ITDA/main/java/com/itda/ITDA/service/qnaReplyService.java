package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.QnaReply;

public interface qnaReplyService {

	public List<QnaReply> getQnaReplyList(int adNum, int page);

	public int getQnaReplyListCount(int adNum);

	public int QnaReplyInsert(QnaReply qnaReply);
	
	public int QnaReplyUpdate(QnaReply qnaReply);

	public int QnaReplyDelete(QnaReply qnaReply);

}
