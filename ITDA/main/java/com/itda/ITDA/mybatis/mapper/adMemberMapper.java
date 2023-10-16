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
	
	// QnA 게시글을 DB에 삽입하는 메서드 추가
    public int insertQna(AdminBoard adminBoard);

    // QnA 게시글을 DB에서 불러오는 메서드
	public List<AdminBoard> getAdminBoardList();
	
	//공지사항 게시글을 DB에서 불러오는 메서드
	public List<AdminBoard> getQnaAdminBoardList();

	public AdminBoard getAdminBoardByUserId(int userId);
	
	public AdminBoard getAdminBoardByAdNum(int adNum);
	
	
}
