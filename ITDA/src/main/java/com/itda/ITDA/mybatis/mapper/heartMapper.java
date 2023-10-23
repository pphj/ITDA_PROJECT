package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface heartMapper {

	void addHeart(int boardNum, String userId);

	void removeHeart(int boardNum, String userId);

}
