package com.itda.ITDA.service;

public interface heartService {

	void addHeart(int boardNum, String userId);

	void removeHeart(int boardNum, String userId);

	boolean existsByBoardNumAndUserId(int boardNum, String userId);

	int getHeartCount(int boardNum);

}
