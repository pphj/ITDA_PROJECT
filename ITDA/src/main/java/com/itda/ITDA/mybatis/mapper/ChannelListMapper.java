package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChannelList;

@Mapper
public interface ChannelListMapper {

	ChannelList getChannelDetail(int chnum);

}
