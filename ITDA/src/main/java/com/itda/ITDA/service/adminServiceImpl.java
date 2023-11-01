package com.itda.ITDA.service;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
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
	
	@Transactional(readOnly = true)
	@Override
	public int getFaqListCount() {
		return dao.getFAQListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getFaqList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getFAQList(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public AdminBoard getFaqDetail(int num) {
		return dao.getFAQDetail(num);
	}
	
	@Transactional
	@Override
	public void insertFaq(AdminBoard faq) {
		dao.insertFAQ(faq);
	}
	
	@Transactional(readOnly = true)
	@Override
	public boolean isAdWriter(int adNum, String adPassword) {
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
	public int faqModify(AdminBoard FAQdata) {
		return dao.FAQModify(FAQdata);
	}
	
	@Transactional
	@Override
	public int faqDelete(int num) {
		return dao.faqDelete(num);
	}
	
	@Transactional(readOnly = true)
	@Override
	public int getQnaListCount() {
		return dao.getQNAListCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getQnaList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getQNAList(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getUserNoticeList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.getUserNoticeList(list);
	}
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
	@Override
	public int getProblemBoardCount() {
		return dao.getProblemBoardCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public int getProblemReplyCount() {
		return dao.getProblemReplyCount();
	}
	
	//@Cacheable("problem")
	//@CacheEvict("problem")
	@Transactional(readOnly = true)
	@Override
	public List<BoardWarn> problemList(int page, int limit) {
		HashMap<String, Integer> list = listLogic(page, limit);
		return dao.problemList(list);
	}
	
	@Transactional(readOnly = true)
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
	
	@Transactional
	@Override
	public int userBoardUpdate(String userId) {
		return dao.userBoardUpdate(userId);
	}
	
	@Transactional
	@Override
	public int userReplyUpdate(String userId) {
		return dao.userReplyUpdate(userId);
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
	
	@Transactional(readOnly = true)
	@Override
	public List<ReplyWarn> replyProblemDetailAll(String sickId) {
		return dao.replyProblemDetailAll(sickId);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<BoardWarn> boardProblemDetailAll(String sickId) {
		return dao.boardProblemDetailAll(sickId);
	}
	
	@Transactional(readOnly = true)
	@Override
	public int getCouponListCount() {
		return dao.getCouponListCount();
	}
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
	@Override
	public boolean isCouponWriter(int couponNum, BigInteger couponCode) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("couponNum", couponNum);
		map.put("couponCode", couponCode);
		Coupon result = dao.isCouponWriter(map);
		
		if (result == null)
			return false;
		else
			return true;
	}
	
	@Transactional
	@Override
	public int couponDelete(int couponNum) {
		return dao.couponDelete(couponNum);
	}
	
	@Transactional(readOnly = true)
	@Override
	public boolean couponCheck(int couponPrice, BigInteger couponCode, int couponTerm) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("couponPrice", couponPrice);
		map.put("couponCode", couponCode);
		map.put("couponTerm", couponTerm);
		Coupon result = dao.couponCheck(map);
		
		if (result == null)
			return false;
		else
			return true;
	}
	
	@Transactional
	@Override
	public int couponUpdate(BigInteger couponCode) {
		return dao.couponUpdate(couponCode);
	}
	
	@Transactional(readOnly = true)
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
	
	@Transactional(readOnly = true)
	@Override
	public int getProductCount() {
		return dao.getProductCount();
	}
	
	@Cacheable("product")
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
	
	@Transactional(readOnly = true)
	@Override
	public int qnaDailyCount() {
		return dao.qnaDailyCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public int sellerDailyCount() {
		return dao.sellerDailyCount();
	}
	
	@Transactional(readOnly = true)
	@Override
	public int problemDailyCount() {
		return dao.problemDailyCount();
	}
	
	//검색 리스트 공통 메소드
	public Map<String, Object> listLogic_Search(int index, String search_word, int page, int limit, String[] searchField) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    if (index != -1) {
	        map.put("search_field", searchField[index]);
	        map.put("search_word", "%" + search_word + "%");
	    }
	    int startrow = (page - 1) * limit + 1;
	    int endrow = startrow + limit - 1;
	    map.put("start", startrow);
	    map.put("end", endrow);

	    return map;
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Admin> getAdminApproveList(int index, String search_word, int page, int limit) {
		String[] searchField = {"아이디", "이름", "부서", "직급", "권한 등급"};
	    Map<String, Object> list = listLogic_Search(index, search_word, page, limit, searchField);
		return dao.getAdminApproveList2(list);
	}

	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getFaqList(int index, String search_word, int page, int limit) {
		String[] searchField = {"제목", "카테고리", "질문자", "작성자", "날짜"};
		Map<String, Object> list = listLogic_Search(index, search_word, page, limit, searchField);
		return dao.getFAQList2(list);
	}

	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getUserNoticeList(int index, String search_word, int page, int limit) {
		String[] searchField = {"제목", "작성자", "날짜"};
		Map<String, Object> list = listLogic_Search(index, search_word, page, limit, searchField);
		return dao.getUserNoticeList2(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<AdminBoard> getItdaNoticeList(int index, String search_word, int page, int limit) {
		String[] searchField = {"제목", "작성자", "날짜"};
		Map<String, Object> list = listLogic_Search(index, search_word, page, limit, searchField);
		return dao.getItdaNoticeList2(list);
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Seller> getSellerApproveList(int index, String search_word, int page, int limit) {
		String[] searchField = {"신청자", "신청일"};
		Map<String, Object> list = listLogic_Search(index, search_word, page, limit, searchField);
		return dao.getSellerApproveList2(list);
	}
	
	@Cacheable("totalSalesList")
	@Transactional(readOnly = true)
	@Override
	public List<UserTotal> getTotalSalesList() {
		return dao.getTotalSalesList();
	}
	
	
}
