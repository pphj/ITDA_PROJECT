package com.itda.ITDA.service;

import java.math.BigInteger;
import java.util.List;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.BoardWarn;
import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.ReplyWarn;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.domain.UserTotal;

public interface adminService {

	public int getFaqListCount();

	public List<AdminBoard> getFaqList(int page, int limit);

	public AdminBoard getFaqDetail(int num);

	public void insertFaq(AdminBoard faq);

	public boolean isAdWriter(int adNum, String adPassword);

	public int faqModify(AdminBoard FAQdata);

	public int faqDelete(int num);

	public int getQnaListCount();

	public List<AdminBoard> getQnaList(int page, int limit);

	public List<AdminBoard> getUserNoticeList(int page, int i);

	public int getUserNoticeListCount();

	public AdminBoard getUserNoticeDetail(int num);

	public void userNoticeInsert(AdminBoard userNotice);

	public int userNoticeUpdate(AdminBoard userNoticeData);

	public void setAdViewUpdate(int num);

	public int getItdaNoticeListCount();

	public List<AdminBoard> getItdaNoticeList(int page, int i);

	public AdminBoard getItdaNoticeDetail(int num);

	public void itdaNoticeInsert(AdminBoard itdaNotice);

	public int itdaNoticeUpdate(AdminBoard itdaNoticeData);

	public int noticeDelete(int num);

	public int getAdminApproveListCount();

	public List<Admin> getAdminApproveList(int page, int limit);

	public int adminApproveUpdate(String adminId, String authName);

	public int getSellerApproveListCount();

	public List<Seller> getSellerApproveList(int page, int i);

	public int sellerUpdateY(String userId, String adminId);

	public int sellerUpdateN(String userId, String adminId);

	public int getProblemBoardCount();

	public List<BoardWarn> problemList(int page, int i);

	public int getProblemReplyCount();

	public int getProblemListCount();

	public int userUpdatePause(String userId);

	public int userUpdateStop(String userId);
	
	public int userUpdateClear(String userId);

	public int userBoardUpdate(String userId);

	public int userReplyUpdate(String userId);
	
	public List<ReplyWarn> replyProblemDetail(String sickId);

	public List<BoardWarn> boardProblemDetail(String sickId);
	
	public List<ReplyWarn> replyProblemDetailAll(String sickId);

	public List<BoardWarn> boardProblemDetailAll(String sickId);
	
	public int getCouponListCount();

	public List<Coupon> couponList(int page, int i);

	public void couponInsert(Coupon couponData);

	public int getUserTotal();

	public int userTotalInsert(int dailyUserTotal);

	public List<UserTotal> getUserTotalList();

	public int getProductCount();

	public List<SubProduct> productList(int page, int i);

	public void productInsert(SubProduct productData);

	public List<SubProduct> productDetail(String productName);

	public int qnaDailyCount();

	public int sellerDailyCount();

	public int problemDailyCount();

	public boolean isCouponWriter(int couponNum, BigInteger couponCode);

	public int couponDelete(int couponNum);

	public List<Admin> getAdminApproveList(int index, String search_word, int page, int limit);

	public List<AdminBoard> getFaqList(int index, String search_word, int page, int limit);

	public List<AdminBoard> getUserNoticeList(int index, String search_word, int page, int limit);

	public List<AdminBoard> getItdaNoticeList(int index, String search_word, int page, int limit);

	public List<Seller> getSellerApproveList(int index, String search_word, int page, int limit);

	public List<UserTotal> getTotalSalesList();

	public boolean couponCheck(int couponPrice, BigInteger couponCode, int couponTerm);

	public int couponUpdate(BigInteger couponCode);
	

}
