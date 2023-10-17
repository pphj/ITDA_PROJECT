package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChBoard;

@Mapper
public interface ChBoardMapper {

	//컨텐츠 서치 키워드
	List<ChBoard> searchContentsByKeyword(String keyword);

	
}
