package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.Tag;
import com.itda.ITDA.mybatis.mapper.ContentMapper;

@Service
public class ContentServiceImpl implements ContentService {
	private ContentMapper dao;
	private TagService tagService;

	@Autowired
	public ContentServiceImpl(ContentMapper dao, TagService tagService) {
		this.dao = dao;
		this.tagService = tagService;
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

	@Override
	public Seller getSellerInfo(String userid) {
		return dao.getSellerInfo(userid);
	}

	@Override
	public List<Tag> getTagInfo(int chnum, int boardnum) {
		return dao.getTagInfo(chnum, boardnum);

	}

	@Override
	public boolean isContentWriter(int boardNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		ChBoard result = dao.isContentWriter(map);
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public int contentModify(ChBoard chboard) {
		return dao.contentModify(chboard);
	}

	@Override
	public List<ChBoardCategory> getCategoryNameList(int chnum) {
		return dao.getCategoryNameList(chnum);
	}

	@Override
	public List<ChBoard> newContentSelect(int chnum) {
		return dao.newContentSelect(chnum);
	}



	@Override
	@Transactional
	public void deleteBoard(int boardNum) {
		tagService.deleteTagsByBoardNum(boardNum);

		dao.deleteBoard(boardNum);

	}

	@Override
	public Itda_User getUserInfo(String userId) {
		return dao.getUserInfo(userId);
	}

	@Override
	public List<ChBoardCategory> getChannelCategory(int boardnum) {
		return dao.getChannelCategory(boardnum);
	}

	@Override
	public String findNameById(int chCateId) {
		return dao.findNameById(chCateId);
	}

}
