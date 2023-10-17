package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;

@Mapper
public interface ContentMapper {

	List<ChBoard> getContentAll(int pageCount, int startRow, int endRow);

	List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow);
	
	List<ChannelList> getChannelList();

	List<ChannelList> getChannelListByNum(int categoryNum);

	List<ChBoard> HotContentSelect();

	List<ChCategory> selectchCate_Id();

	ChBoard getContentDetail(int boardnum);

	

	
}
