package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.BoardReply;

@Mapper
public interface ReplyMapper {

	List<BoardReply> getReplies(int boardNum, String sort);

	int addReply(BoardReply reply);

	int commentsInsert(BoardReply reply);

	int commentsUpdate(BoardReply reply);

	int commentsDelete(int num, int replyRef, int replyLev, int replySeq);

	int getListCount(int boardnum);

	int getTotalReplies(int boardNum);

	void commentsSequenceUpdate(BoardReply reply);

	List<BoardReply> getRepliesDesc(int boardNum);

	List<BoardReply> getRepliesAsc(int boardNum);

	BoardReply getDetail(int num);

	int commentsDelete(BoardReply boardReply);

	List<BoardReply> getDetails(int num);

	void deleteBoardReplyByBoardNum(int boardNum);

}
