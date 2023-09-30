package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Itda_User;

@Mapper
public interface Itda_UserMapper {
	
	Itda_User isId(String username);

	int insert(Itda_User mem);
	
	

	
}


