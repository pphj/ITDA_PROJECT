package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;

public interface MainService {

	 List<ChannelList> searchChannelsByKeyword(String keyword);

	 List<ChBoard> searchContentsByKeyword(String keyword);

	List<ChBoard> searchContentsByKeyword(String keyword, int pageSize, int offset);

}
