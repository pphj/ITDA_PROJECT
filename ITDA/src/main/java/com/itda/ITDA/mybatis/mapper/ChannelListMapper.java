package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;

@Mapper
public interface ChannelListMapper {

	ChannelList getChannelDetail(int chnum);

	List<ChBoard> getBoardListByBoardNum(int chnum);

}
