package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.mybatis.mapper.AdminMapper;

@Service
public class qnaReplyServiceImpl implements qnaReplyService {
	private AdminMapper dao;
	
	@Autowired
	public qnaReplyServiceImpl (AdminMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<QnaReply> getQnaReplyList(int adNum, int page) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int startrow = 1;
		int endrow = page * 3;
		
		map.put("adNum", adNum);
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getQnaReplyList(map);
	}

	@Override
	public int getQnaReplyListCount(int adNum) {
		return dao.getQnaReplyListCount(adNum);
	}
	
	@Override
	public int QnaReplyInsert(QnaReply qnaReply) {
		return dao.QnaReplyInsert(qnaReply);
	}
	
	@Override
	public int QnaReplyUpdate(QnaReply qnaReply) {
		return dao.QnaReplyUpdate(qnaReply);
	}

	@Override
	public int QnaReplyDelete(QnaReply qnaReply) {
		return dao.QnaReplyDelete(qnaReply);
	}
}
