package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
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

}
