package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.domain.SellerWaiting;

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

	public List<AdminBoard> getUserNoticeList(HashMap<String, Integer> map);

	public int getUserNoticeListCount();

	public AdminBoard getUserNoticeDetail(int num);

	public void userNoticeInsert(AdminBoard userNotice);

	public int userNoticeUpdate(AdminBoard userNoticeData);

	public void setAdViewUpdate(int num);

	public int getItdaNoticeListCount();

	public List<AdminBoard> getItdaNoticeList(HashMap<String, Integer> map);

	public void itdaNoticeInsert(AdminBoard itdaNotice);

	public int itdaNoticeUpdate(AdminBoard itdaNoticeData);

	public AdminBoard getItdaNoticeDetail(int num);

	public int noticeDelete(int num);

	public int getAdminApproveListCount();

	public List<Admin> getAdminApproveList(HashMap<String, Integer> map);

	public int adminApproveUpdate(String adminId, String authName);

	public int getSellerApproveListCount();

	public List<SellerWaiting> getSellerApproveList(HashMap<String, Integer> map);


}
