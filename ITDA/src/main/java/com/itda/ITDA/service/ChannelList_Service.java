package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChannelList;

public interface ChannelList_Service {

	ChannelList getChannelDetail(int chnum);

	List<ChBoard> getBoardListByBoardNum(int chnum);

	List<ChBoardCategory> getChannelCategory(int chnum);

	/*int getChannelCategoryCount();*/

	List<ChBoardCategory> getChnnelCategorylist(int chnum);

	/*ChannelList getChannelSellerDetail(int chnum);*/

}