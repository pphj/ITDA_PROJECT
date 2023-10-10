package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.mybatis.mapper.ChannelListMapper;

@Service
public class ChannelList_Servicelmpl implements ChannelList_Service {

	private ChannelListMapper dao;

	@Autowired
	public ChannelList_Servicelmpl(ChannelListMapper dao) {
		this.dao = dao;
	}

	@Override
	public ChannelList getChannelDetail(int chnum) {
		return dao.getChannelDetail(chnum);
	}

	@Override
	public List<ChBoard> getBoardListByBoardNum(int chnum) {
		return dao.getBoardListByBoardNum(chnum);
	}

	@Override
	public List<ChBoardCategory> getChannelCategory(int chnum) {
		return dao.getChannelCategory(chnum);
	}

	@Override
	public List<ChBoardCategory> getChannelCategoryList(int chnum) {
		return dao.getChannelCategoryList(chnum);
	}

	/*@Override
	public int getChannelCategoryCount() {
		return dao.getChannelCategoryCount();
	}*/

	@Override
	public List<ChBoard> getAllChannelCategoryData(int channelnum, String order, int page, int limit) {
		return dao.getAllChannelCategoryData(channelnum, order, page, limit);
	}

	@Override
	public int getAllChannelCategoryCount(int channelnum) {
		return dao.getAllChannelCategoryCount(channelnum);
	}

	@Override
	public List<ChBoard> getChannelCategoryData(int channelnum, int categoryId, int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("channelnum", channelnum);
		map.put("categoryId", categoryId);

		return dao.getChannelCategoryData(map);
	}

	@Override
	public int getChannelCategoryCount(int channelnum, int categoryId) {
		return dao.getChannelCategoryCount(channelnum, categoryId);
	}

}
