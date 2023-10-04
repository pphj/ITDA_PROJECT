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
}
