package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;

public interface ChannelList_Service {

	ChannelList getChannelDetail(int chnum);

	List<ChBoard> getBoardListByBoardNum(int chnum);

	List<ChBoardCategory> getChannelCategory(int chnum);

	/*int getChannelCategoryCount();*/

	List<ChBoardCategory> getChannelCategoryList(int chnum);

	/*ChannelList getChannelSellerDetail(int chnum);*/

	List<ChBoard> getAllChannelCategoryData(int channelnum, String order, int page, int limit);

	int getAllChannelCategoryCount(int channelnum);

	List<ChBoard> getChannelCategoryData(int channelnum, int categoryId, int page, int limit);

	int getChannelCategoryCount(int chnum, int chCate_Id);

	Seller getSellerInfo(String userid);

	ChannelList getSellerSetting(int chnum);

	void saveChannelList(ChannelList channelList);

	 void saveChannelList(Itda_User itda_User);
	 
	int getSellerUpdate(ChannelList channelList);

	List<ChCategory> getChcategory();

	List<ChBoardCategory> getSellerCategory(int chnum);

	void addCategory(ChBoardCategory chBoardCategory);

}