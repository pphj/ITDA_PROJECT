package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.AdminBoard;
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

	
}
