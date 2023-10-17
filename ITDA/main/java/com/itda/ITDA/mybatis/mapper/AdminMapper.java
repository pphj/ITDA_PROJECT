package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.BoardWarn;
import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.domain.ReplyWarn;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.domain.UserTotal;

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

	public List<Seller> getSellerApproveList(HashMap<String, Integer> map);

	public int sellerUpdateY(String userId, String adminId);

	public int sellerUpdateN(String userId, String adminId);

	public int getProblemBoardCount();
	
	public int getProblemReplyCount();

	public List<BoardWarn> problemList(HashMap<String, Integer> map);

	public int problemListCount();

	public int userUpdatePause(String userId);

	public int userUpdateStop(String userId);

	public int userUpdateClear(String userId);

	public List<ReplyWarn> replyProblemDetail(String sickId);

	public List<BoardWarn> boardProblemDetail(String sickId);

	public int getCouponListCount();

	public List<Coupon> couponList(HashMap<String, Integer> map);

	public void couponInsert(Coupon couponData);

	public int getUserTotal();

	public int userTotalInsert(int dailyUserTotal);

	public List<UserTotal> getUserTotalList();

	public int getProductCount();

	public List<SubProduct> productList(HashMap<String, Integer> list);

	public void productInsert(SubProduct productData);

	public List<SubProduct> productDetail(String productName);

	public int qnaDailyCount();

	public int sellerDailyCount();

	public int problemDailyCount();




}
