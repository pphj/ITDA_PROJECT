package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.BoardWarn;
import com.itda.ITDA.domain.ReplyWarn;
import com.itda.ITDA.domain.SellerWaiting;
import com.itda.ITDA.mybatis.mapper.AdminMapper;

@Service
public class adminServiceImpl implements adminService {
	private AdminMapper dao;
	
	@Autowired
	public adminServiceImpl(AdminMapper dao) {
		this.dao = dao;
	}
	
	@Override
	public int getFAQListCount() {
		return dao.getFAQListCount();
	}

	@Override
	public List<AdminBoard> getFAQList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getFAQList(map);
	}

	@Override
	public AdminBoard getFAQDetail(int num) {
		return dao.getFAQDetail(num);
	}

	@Override
	public void insertFAQ(AdminBoard faq) {
		dao.insertFAQ(faq);
	}

	@Override
	public boolean isadWriter(int adNum, String adPassword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", adNum);
		map.put("pass", adPassword);
		AdminBoard result = dao.isadWriter(map);
		
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public int FAQModify(AdminBoard FAQdata) {
		return dao.FAQModify(FAQdata);
	}

	@Override
	public int getQNAListCount() {
		return dao.getQNAListCount();
	}

	@Override
	public List<AdminBoard> getQNAList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getQNAList(map);
	}

	@Override
	public List<AdminBoard> getUserNoticeList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getUserNoticeList(map);
	}

	@Override
	public int getUserNoticeListCount() {
		return dao.getUserNoticeListCount();
	}

	@Override
	public AdminBoard getUserNoticeDetail(int num) {
		return dao.getUserNoticeDetail(num);
	}

	@Override
	public void userNoticeInsert(AdminBoard userNotice) {
		dao.userNoticeInsert(userNotice);
	}

	@Override
	public int userNoticeUpdate(AdminBoard userNoticeData) {
		return dao.userNoticeUpdate(userNoticeData);
	}

	@Override
	public void setAdViewUpdate(int num) {
		dao.setAdViewUpdate(num);		
	}

	@Override
	public int getItdaNoticeListCount() {
		return dao.getItdaNoticeListCount();
	}

	@Override
	public List<AdminBoard> getItdaNoticeList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getItdaNoticeList(map);
	}

	@Override
	public AdminBoard getItdaNoticeDetail(int num) {
		return dao.getItdaNoticeDetail(num);
	}

	@Override
	public void itdaNoticeInsert(AdminBoard itdaNotice) {
		dao.itdaNoticeInsert(itdaNotice);
		
	}

	@Override
	public int itdaNoticeUpdate(AdminBoard itdaNoticeData) {
		return dao.itdaNoticeUpdate(itdaNoticeData);
	}

	@Override
	public int noticeDelete(int num) {
		return dao.noticeDelete(num);
	}

	@Override
	public int getAdminApproveListCount() {
		return dao.getAdminApproveListCount();
	}

	@Override
	public List<Admin> getAdminApproveList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getAdminApproveList(map);
	}

	@Override
	public int adminApproveUpdate(String adminId, String authName) {
		return dao.adminApproveUpdate(adminId, authName);
	}

	@Override
	public int getSellerApproveListCount() {
		return dao.getSellerApproveListCount();
	}

	@Override
	public List<SellerWaiting> getSellerApproveList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getSellerApproveList(map);
	}

	@Override
	public int sellerWaitingUpdateY(String userId) {
		return dao.sellerWaitingUpdateY(userId);
	}

	@Override
	public int sellerWaitingUpdateN(String userId) {
		return dao.sellerWaitingUpdateN(userId);
	}

	@Override
	public int getProblemBoardCount() {
		return dao.getProblemBoardCount();
	}

	@Override
	public int getProblemReplyCount() {
		return dao.getProblemReplyCount();
	}

	@Override
	public List<BoardWarn> problemList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.problemList(map);
	}

	@Override
	public int sellerInsert(String userId, String waitPhone, String waitEmail) {
		return dao.sellerInsert(userId, waitPhone, waitEmail);
	}

	@Override
	public int getProblemListCount() {
		return dao.problemListCount();
	}

	@Override
	public int userUpdatePause(String userId) {
		return dao.userUpdatePause(userId);
	}

	@Override
	public int userUpdateStop(String userId) {
		return dao.userUpdateStop(userId);
	}

	@Override
	public int userUpdateClear(String userId) {
		return dao.userUpdateClear(userId);
	}

	@Override
	public List<ReplyWarn> replyProblemDetail(String sickId) {
		return dao.replyProblemDetail(sickId);
	}

	@Override
	public List<BoardWarn> boardProblemDetail(String sickId) {
		return dao.boardProblemDetail(sickId);
	}
	
}
