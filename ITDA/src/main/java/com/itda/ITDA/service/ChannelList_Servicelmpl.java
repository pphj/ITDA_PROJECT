package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
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
	public List<ChBoard> getAllChannelCategoryData(int chnum, String order, int page, int limit) {
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		return dao.getAllChannelCategoryData(chnum, order, startrow, endrow);
	}

	@Override
	public int getAllChannelCategoryCount(int chnum) {
		return dao.getAllChannelCategoryCount(chnum);
	}

	@Override
	public List<ChBoard> getChannelCategoryData(int chnum, int chCate_Id, int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("chnum", chnum);
		map.put("chCate_Id", chCate_Id);

		return dao.getChannelCategoryData(map);
	}

	@Override
	public int getChannelCategoryCount(int chnum, int chCate_Id) {
		return dao.getChannelCategoryCount(chnum, chCate_Id);
	}

	@Override
	public Seller getSellerInfo(String userid) {
		return dao.getSellerInfo(userid);
	}

	@Override
	public ChannelList getSellerSetting(int chnum) {
		return dao.getSellerSetting(chnum);
	}
	

	public void saveChannelList(Itda_User itda_User) {
		dao.saveChannelList(itda_User); // 데이터베이스에 ChannelList 저장
	}

	@Override
	public int getSellerUpdate(ChannelList channelList) {
		return dao.getSellerUpdate(channelList);
	}

	@Override
	public void saveChannelList(ChannelList channelList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ChCategory> getChcategory() {
		return dao.getChcategory();
	}


	public List<ChBoardCategory> getSellerCategory(int chnum) {
		return dao.getSellerCategory(chnum);
	}

	@Override
	public void addCategory(ChBoardCategory chBoardCategory) {
		dao.addCategory(chBoardCategory);
	}

}
