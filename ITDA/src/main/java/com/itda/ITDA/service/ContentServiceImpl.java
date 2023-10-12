package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.mybatis.mapper.ContentMapper;

@Service
public class ContentServiceImpl implements ContentService {
	private ContentMapper dao;

	@Autowired
	public ContentServiceImpl(ContentMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<ChBoard> getContentAll(int pageCount, int startRow, int endRow) {
		return dao.getContentAll(pageCount, startRow, endRow);
	}

	@Override
	public List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow) {
		return dao.getContentByCategory(categoryNum, pageCount, startRow, endRow);
	}

	@Override
	public List<ChannelList> getChannelList() {
		return dao.getChannelList();
	}

	@Override
	public List<ChannelList> getChannelListByNum(int categoryNum) {
		return dao.getChannelListByNum(categoryNum);
	}

	@Override
	public List<ChBoard> HotContentSelect() {
		return dao.HotContentSelect();
	}

	@Override
	public List<ChCategory> selectchCate_Id() {
		return dao.selectchCate_Id();
	}

	@Override
	public ChBoard getContentDetail(int boardnum) {
		return dao.getContentDetail(boardnum);

	}

}
