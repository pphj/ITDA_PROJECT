package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.BoardReply;
import com.itda.ITDA.mybatis.mapper.ReplyMapper;

@Service
public class ReplyServicelmpl implements ReplyService {
	private ReplyMapper dao;

	@Autowired
	public ReplyServicelmpl(ReplyMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<BoardReply> getReplies(int boardNum, Integer state) {
		String sort = "asc";

		if (state == 2)
		{
			sort = "desc";
		}

		return dao.getReplies(boardNum, sort);
	}

	@Override
	public int addReply(BoardReply reply) {
		commentsUpdate(reply);

		reply.setReplyLev(reply.getReplyLev() + 1);
		reply.setReplySeq(reply.getReplySeq() + 1);

		return dao.addReply(reply);
	}

	@Override
	public int commentsInsert(BoardReply reply) {
		return dao.commentsInsert(reply);
	}

	@Override
	public int commentsUpdate(BoardReply reply) {
		return dao.commentsUpdate(reply);
	}

	@Override
	public int commentsDelete(int num) {
		return dao.commentsDelete(num);
	}

	@Override
	public int getListCount(int boardnum) {
		return dao.getListCount(boardnum);
	}

}
