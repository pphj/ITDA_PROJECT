package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.BoardWarn;
import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.ReplyWarn;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.domain.UserTotal;
import com.itda.ITDA.mybatis.mapper.AdminMapper;

@Service
public class adminServiceImpl implements adminService {
	private AdminMapper dao;
	
	@Autowired
	public adminServiceImpl(AdminMapper dao) {
		this.dao = dao;
	}
	
	//리스트 공통 사용 메소드
	public HashMap<String, Integer> listLogic (int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return map;
	}
	
	@Override
	public int getFAQListCount() {
		return dao.getFAQListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getFAQList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getFAQList(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public AdminBoard getFAQDetail(int num) {
		return dao.getFAQDetail(num);
	}
	
	@Transactional
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
	
	@Transactional
	@Override
	public int FAQModify(AdminBoard FAQdata) {
		return dao.FAQModify(FAQdata);
	}
	
	@Transactional
	@Override
	public int faqDelete(int num) {
		return dao.faqDelete(num);
	}
	
	@Override
	public int getQNAListCount() {
		return dao.getQNAListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getQNAList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getQNAList(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getUserNoticeList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getUserNoticeList(list);
	}

	@Override
	public int getUserNoticeListCount() {
		return dao.getUserNoticeListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public AdminBoard getUserNoticeDetail(int num) {
		return dao.getUserNoticeDetail(num);
	}
	
	@Transactional
	@Override
	public void userNoticeInsert(AdminBoard userNotice) {
		dao.userNoticeInsert(userNotice);
	}
	
	@Transactional
	@Override
	public int userNoticeUpdate(AdminBoard userNoticeData) {
		return dao.userNoticeUpdate(userNoticeData);
	}
	
	@Transactional
	@Override
	public void setAdViewUpdate(int num) {
		dao.setAdViewUpdate(num);		
	}

	@Override
	public int getItdaNoticeListCount() {
		return dao.getItdaNoticeListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getItdaNoticeList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getItdaNoticeList(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public AdminBoard getItdaNoticeDetail(int num) {
		return dao.getItdaNoticeDetail(num);
	}
	
	@Transactional
	@Override
	public void itdaNoticeInsert(AdminBoard itdaNotice) {
		dao.itdaNoticeInsert(itdaNotice);
		
	}
	
	@Transactional
	@Override
	public int itdaNoticeUpdate(AdminBoard itdaNoticeData) {
		return dao.itdaNoticeUpdate(itdaNoticeData);
	}
	
	@Transactional
	@Override
	public int noticeDelete(int num) {
		return dao.noticeDelete(num);
	}

	@Override
	public int getAdminApproveListCount() {
		return dao.getAdminApproveListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Admin> getAdminApproveList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getAdminApproveList(list);
	}
	
	@Transactional
	@Override
	public int adminApproveUpdate(String adminId, String authName) {
		return dao.adminApproveUpdate(adminId, authName);
	}

	@Override
	public int getSellerApproveListCount() {
		return dao.getSellerApproveListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Seller> getSellerApproveList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getSellerApproveList(list);
	}
	
	@Transactional
	@Override
	public int sellerUpdateY(String userId, String adminId) {
		return dao.sellerUpdateY(userId, adminId);
	}
	
	@Transactional
	@Override
	public int sellerUpdateN(String userId, String adminId) {
		return dao.sellerUpdateN(userId, adminId);
	}
	
	@Override
	public int getProblemBoardCount() {
		return dao.getProblemBoardCount();
	}

	@Override
	public int getProblemReplyCount() {
		return dao.getProblemReplyCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<BoardWarn> problemList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.problemList(list);
	}

	@Override
	public int getProblemListCount() {
		return dao.problemListCount();
	}
	
	@Transactional
	@Override
	public int userUpdatePause(String userId) {
		return dao.userUpdatePause(userId);
	}
	
	@Transactional
	@Override
	public int userUpdateStop(String userId) {
		return dao.userUpdateStop(userId);
	}
	
	@Transactional
	@Override
	public int userUpdateClear(String userId) {
		return dao.userUpdateClear(userId);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<ReplyWarn> replyProblemDetail(String sickId) {
		return dao.replyProblemDetail(sickId);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<BoardWarn> boardProblemDetail(String sickId) {
		return dao.boardProblemDetail(sickId);
	}

	@Override
	public int getCouponListCount() {
		return dao.getCouponListCount();
	}
	
	@Cacheable("couponList")
	@Override
	public List<Coupon> couponList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.couponList(list);
	}
	
	@Transactional
	@Override
	public void couponInsert(Coupon couponData) {
		dao.couponInsert(couponData);
	}

	@Override
	public int getUserTotal() {
		return dao.getUserTotal();
	}
	
	@Transactional
	@Override
	public int userTotalInsert(int dailyUserTotal) {
		return dao.userTotalInsert(dailyUserTotal);
	}
	
	@Cacheable("userTotal")
	@Transactional(readOnly = true)
	@Override
	public List<UserTotal> getUserTotalList() {
		return dao.getUserTotalList();
	}

	@Override
	public int getProductCount() {
		return dao.getProductCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<SubProduct> productList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.productList(list);
	}
	
	@Transactional
	@Override
	public void productInsert(SubProduct productData) {
		dao.productInsert(productData);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<SubProduct> productDetail(String productName) {
		return dao.productDetail(productName);
	}

	@Override
	public int qnaDailyCount() {
		return dao.qnaDailyCount();
	}

	@Override
	public int sellerDailyCount() {
		return dao.sellerDailyCount();
	}

	@Override
	public int problemDailyCount() {
		return dao.problemDailyCount();
	}

	
}
