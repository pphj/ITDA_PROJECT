package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.AdminBoard;

public interface adminService {

	public int getFAQListCount();

	public List<AdminBoard> getFAQList(int page, int limit);

	public AdminBoard getFAQDetail(int num);

	public void insertFAQ(AdminBoard faq);

	public boolean isadWriter(int adNum, String adPassword);

	public int FAQModify(AdminBoard FAQdata);

	public int getQNAListCount();

	public List<AdminBoard> getQNAList(int page, int limit);

}
