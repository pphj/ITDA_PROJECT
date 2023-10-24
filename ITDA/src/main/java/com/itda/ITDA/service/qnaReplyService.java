package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.QnaReply;

public interface qnaReplyService {

	public List<QnaReply> getQnaReplyList(int adNum, int page);

	public int getQnaReplyListCount(int adNum);

	public int qnaReplyInsert(QnaReply qnaReply);
	
	public int qnaReplyUpdate(QnaReply qnaReply);

	public int qnaReplyDelete(QnaReply qnaReply);

}
