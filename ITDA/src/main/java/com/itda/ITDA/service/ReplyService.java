package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.BoardReply;

public interface ReplyService {

	List<BoardReply> getReplies(int boardNum, Integer state);

	int addReply(BoardReply reply);

	int commentsInsert(BoardReply reply);

	int commentsUpdate(BoardReply reply);

	int commentsDelete(int num);

	int getListCount(int boardnum);

}
