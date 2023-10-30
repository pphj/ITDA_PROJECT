package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface heartMapper {

	void addHeart(int boardNum, String userId);

	void removeHeart(int boardNum, String userId);

	boolean existsByBoardNumAndUserId(@Param("boardNum") int boardNum, @Param("userId") String userId);

	int getHeartCount(@Param("boardNum") int boardNum);

	void updateChBoardHeart(int boardNum);

	void decreaseChBoardHeart(int boardNum);

	void deleteChBoardHeart(int boardNum);

}
