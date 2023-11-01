package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.QnaReply;

public interface InfoService {

	void insertQna(AdminBoard adminBoard);
	
	List<AdminBoard> getAdminBoardList();

	 List<AdminBoard> getQnaByUser(String userId);

	int getAdminBoardCount();

	List<AdminBoard> getAdminBoardListByPage(int page, int limit);

	AdminBoard getAdminBoardByUserId(int userId);

	AdminBoard getAdminBoardByAdNum(int adNum);

	List<QnaReply> getQnaRepliesByAdNum(int adNum);
	


	
}
