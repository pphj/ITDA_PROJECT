package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.QnaReply;

@Mapper
public interface adMemberMapper {
	//관리자 영역
	public Admin isId(String adminId);

	public int adMemberInsert(Admin admin);

	public Admin adminInfo(String adminId);

	public int adminUpdate(Admin admin);
	
	
	//유저, 공지 영역
	public List<AdminBoard> getAdminBoardList();

	public AdminBoard getAdminBoardByUserId(int userId);

	public AdminBoard getAdminBoardByAdNum(int adNum);

	public List<AdminBoard> getQnaByUser(String userId);

	public int insertQna(AdminBoard adminBoard);

	public Admin idadminId(String username);

	public List<QnaReply> getQnaRepliesByAdNum(int adNum);
	
}
