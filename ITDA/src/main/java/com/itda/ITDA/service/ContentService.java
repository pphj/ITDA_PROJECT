package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;

public interface ContentService {

	List<ChBoard> getContentAll(int pageCount, int startRow, int endRow);

	List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow);

	List<ChannelList> getChannelList();
	
	List<ChannelList> getChannelListByNum(int categoryNum);

	List<ChBoard> HotContentSelect();

	List<ChCategory> selectchCate_Id();
	
	ChBoard getContentDetail(int boardnum);



}
