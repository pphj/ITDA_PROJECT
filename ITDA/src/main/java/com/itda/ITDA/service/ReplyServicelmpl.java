package com.itda.ITDA.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.controller.ContentController;
import com.itda.ITDA.domain.BoardReply;
import com.itda.ITDA.mybatis.mapper.ReplyMapper;

@Service
public class ReplyServicelmpl implements ReplyService {

	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

	private ReplyMapper dao;

	@Autowired
	public ReplyServicelmpl(ReplyMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<BoardReply> getReplies(int boardNum, Integer state) {
		if (state == 2)
		{
			return dao.getRepliesDesc(boardNum);
		} else
		{
			return dao.getRepliesAsc(boardNum);
		}
	}

	// 대댓글
	@Override
	public int addReply(BoardReply reply) {
		logger.info(reply.getReplySeq() + "");
		logger.info(reply.getReplyLev() + "");
		dao.commentsSequenceUpdate(reply);

		reply.setReplyLev(reply.getReplyLev() + 1);
		reply.setReplySeq(reply.getReplySeq() + 1);

		logger.info(reply.getReplySeq() + "");
		logger.info(reply.getReplyLev() + "");

		return dao.addReply(reply);
	}

	// 댓글
	@Override
	public int commentsInsert(BoardReply reply) {

		return dao.commentsInsert(reply);
	}

	@Override
	public int commentsUpdate(BoardReply reply) {
		return dao.commentsUpdate(reply);
	}

	@Override
	public int getListCount(int boardnum) {
		return dao.getListCount(boardnum);
	}

	@Override
	public int getTotalReplies(int boardNum) {
		return dao.getTotalReplies(boardNum);
	}

	@Override
	public int commentsDelete(int num) {
		int result = 0;
		BoardReply BoardReply = dao.getDetail(num);
		if (BoardReply != null)
		{
			result = dao.commentsDelete(BoardReply);
		}
		return result;
	}

	@Override
	public int boardcommentsDelete(int num) {
		int result = 0;
		List<BoardReply> boardReplies = dao.getDetails(num);

		logger.info("Fetched Board Replies: " + boardReplies);

		if (boardReplies != null)
		{
			for (BoardReply boardReply : boardReplies)
			{
				result += dao.commentsDelete(boardReply);
			}
		}
		return result;
	}

	@Override
	public void deleteBoardReplyByBoardNum(int boardNum) {
		dao.deleteBoardReplyByBoardNum(boardNum);
	}
}
