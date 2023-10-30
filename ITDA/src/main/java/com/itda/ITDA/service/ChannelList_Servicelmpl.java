package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.sub;
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
	public List<ChBoard> getChannelCategoryData(int chnum, String order, int chCate_Id, int page, int limit) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		map.put("chnum", chnum);
		map.put("chCate_Id", chCate_Id);
		map.put("order", order); // 추가

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

	@Override
	public List<ChBoardCategory> getSellerCategory(int chnum) {
		return dao.getSellerCategory(chnum);
	}

	@Override
	public int addCategory(int chnum, String chCate_Name) {
		return dao.addCategory(chnum, chCate_Name);
	}

	@Override
	public ChannelList myChannelList(String id) {
		return dao.myChannelList(id);
	}

	@Override
	public int updateCategory(int chCate_Id, String chCate_Name) {
		return dao.updateCategory(chCate_Id, chCate_Name);
	}

	@Override
	public int deleteCategory(int chCate_Id) {
		return dao.deleteCategory(chCate_Id);
	}

	@Override
	public List<ChBoardCategory> getCategoryNameList(int chnum) {
		return dao.getCategoryNameList(chnum);
	}

	@Override
	public int contentInsert(ChBoard contentAdd) {
		return dao.contentInsert(contentAdd);
	}

	@Override
	public int checkChannelName(int chnum, String chName) {
		return dao.checkChannelName(chnum, chName);
	}

	@Override
	public ChannelList getContentSellerInfo(String userid) {
		return dao.getContentSellerInfo(userid);
	}

	@Override
	public List<ChBoard> newContentSelect(int chnum) {
		return dao.newContentSelect(chnum);
	}

	@Override
	public Itda_User getUserInfo(String userid) {
		return dao.getUserInfo(userid);
	}

	@Override
	public void subscribe(String userId, int chnum) {
		dao.subscribe(userId, chnum);
	}

	@Override
	public void unsubscribe(String userId, int chnum) {
		dao.unsubscribe(userId, chnum);
	}

	@Override
	public List<sub> getSubData(int chnum) {
		return dao.getSubData(chnum);
	}

	public boolean checkSubscription(String userId, int chnum) {
		return dao.checkSubscription(userId, chnum);
	}

	@Override
	public Map<String, Object> getBoardVisit(int chnum) {
		return dao.getBoardVisit(chnum);
	}

	@Override
	public int getSubscriberCount(String userId, int chnum) {
		return dao.getSubscriberCount(userId, chnum);
	}

}