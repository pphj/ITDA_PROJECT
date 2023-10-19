package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;

@Mapper
public interface adMemberMapper {

	public Admin isId(String adminId);

	public int adMemberInsert(Admin admin);

	public Admin adminInfo(String adminId);

	public int adminUpdate(Admin admin);

	public int insertQna(AdminBoard adminBoard);

	public List<AdminBoard> getAdminBoardList();

	public AdminBoard getAdminBoardByUserId(int userId);

	public AdminBoard getAdminBoardByAdNum(int adNum);

	public List<AdminBoard> getQnaByUser(String userId);
}
