package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.mybatis.mapper.ChBoardMapper;
import com.itda.ITDA.mybatis.mapper.ChannelListMapper;

@Service
public class MainServiceImpl implements MainService {

	private final ChannelListMapper channelListMapper;
	private final ChBoardMapper chBoardMapper;

	@Autowired
	public MainServiceImpl(ChannelListMapper channelListMapper, ChBoardMapper chBoardMapper) {
		this.channelListMapper = channelListMapper;
		this.chBoardMapper = chBoardMapper;
	}

	@Override
	public List<ChannelList> searchChannelsByKeyword(String keyword) {
		return channelListMapper.searchChannelsByKeyword(keyword);
	}

	@Override
	public List<ChBoard> searchContentsByKeyword(String keyword) {
		return chBoardMapper.searchContentsByKeyword(keyword);
	}

}
