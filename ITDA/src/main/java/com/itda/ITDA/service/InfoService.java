package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.AdminBoard;

public interface InfoService {

	void insertQna(AdminBoard adminBoard);
	
	List<AdminBoard> getAdminBoardList();

	List<AdminBoard> getQnaAdminBoardList();

	AdminBoard getAdminBoardByAdNum(int noticeId);

	int getAdminBoardCount();

	List<AdminBoard> getAdminBoardListByPage(int page, int limit);

}
