package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;

public interface ChannelList_Service {

	ChannelList getChannelDetail(int chnum);

	List<ChBoard> getBoardListByBoardNum(int chnum);
}
