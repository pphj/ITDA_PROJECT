package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.SellerWaiting;

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

	public List<SellerWaiting> getSellerApproveList(int page, int i);

}
