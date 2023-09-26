package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
