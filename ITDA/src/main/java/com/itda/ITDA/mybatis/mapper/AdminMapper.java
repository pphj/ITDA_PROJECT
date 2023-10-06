package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.QnaReply;

@Mapper
public interface AdminMapper {

	public int getFAQListCount();

	public List<AdminBoard> getFAQList(HashMap<String, Integer> map);

	public AdminBoard getFAQDetail(int num);

	public void insertFAQ(AdminBoard faq);

	public AdminBoard isadWriter(HashMap<String, Object> map);

	public int FAQModify(AdminBoard fAQdata);

	public int getQNAListCount();

	public List<AdminBoard> getQNAList(HashMap<String, Integer> map);

	public List<QnaReply> getQnaReplyList(Map<String, Integer> map);

	public int getQnaReplyListCount(int adNum);

	public int QnaReplyInsert(QnaReply qnaReply);
	
	public int QnaReplyUpdate(QnaReply qnaReply);

	public int QnaReplyDelete(QnaReply qnaReply);

	


}
