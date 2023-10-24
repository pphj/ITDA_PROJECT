package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.mybatis.mapper.AdminMapper;

@Service
public class qnaReplyServiceImpl implements qnaReplyService {
	private AdminMapper dao;
	
	@Autowired
	public qnaReplyServiceImpl (AdminMapper dao) {
		this.dao = dao;
	}
	
	@Transactional(readOnly = true)
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
	
	@Transactional
	@Override
	public int qnaReplyInsert(QnaReply qnaReply) {
		return dao.QnaReplyInsert(qnaReply);
	}
	
	@Transactional
	@Override
	public int qnaReplyUpdate(QnaReply qnaReply) {
		return dao.QnaReplyUpdate(qnaReply);
	}
	
	@Transactional
	@Override
	public int qnaReplyDelete(QnaReply qnaReply) {
		return dao.QnaReplyDelete(qnaReply);
	}
}
