package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.mybatis.mapper.ChannelListMapper;
import com.itda.ITDA.mybatis.mapper.ContentMapper;

@Service
public class MainServiceImpl implements MainService {

	private final ChannelListMapper channelListMapper;
	private final ContentMapper contentMapper;

	@Autowired
	public MainServiceImpl(ChannelListMapper channelListMapper, ContentMapper contentMapper) {
		this.channelListMapper = channelListMapper;
		this.contentMapper = contentMapper;
	}

	@Override
	public List<ChannelList> searchChannelsByKeyword(String keyword) {
		return channelListMapper.searchChannelsByKeyword("%" + keyword + "%");
	}

	@Override
	public List<ChBoard> searchContentsByKeyword(String keyword) {
		return contentMapper.searchContentsByKeyword("%" + keyword + "%");
	}

	@Override
	public List<ChBoard> searchContentsByKeyword(String keyword, int pageSize, int offset) {
		// TODO Auto-generated method stub
		return null;
	}

}
