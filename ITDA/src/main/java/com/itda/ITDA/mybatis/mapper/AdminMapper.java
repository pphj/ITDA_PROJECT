package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.AdminBoard;

@Mapper
public interface AdminMapper {

	public int getFAQListCount();

	public List<AdminBoard> getFAQList(HashMap<String, Integer> map);

	public AdminBoard getFAQDetail(int num);

	public void insertFAQ(AdminBoard faq);

	public AdminBoard isadWriter(HashMap<String, Object> map);

	public int FAQModify(AdminBoard fAQdata);

}
