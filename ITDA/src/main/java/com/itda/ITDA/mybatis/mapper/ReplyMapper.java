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

	int commentsDelete(int num);

	int getListCount(int boardnum);

}
