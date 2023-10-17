package com.itda.ITDA.service;

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

	public int getFAQListCount();

	public List<AdminBoard> getFAQList(int page, int limit);

	public AdminBoard getFAQDetail(int num);

	public void insertFAQ(AdminBoard faq);

	public boolean isadWriter(int adNum, String adPassword);

	public int FAQModify(AdminBoard FAQdata);

	public int getQNAListCount();

	public List<AdminBoard> getQNAList(int page, int limit);

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

	public List<ReplyWarn> replyProblemDetail(String sickId);

	public List<BoardWarn> boardProblemDetail(String sickId);

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


}
