package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Itda_User;

@Mapper
public interface Itda_UserMapper {
	
	Itda_User isId(String username);

	int insert(Itda_User mem);

	Itda_User goSubsctiptions(String userId);

	Itda_User read(String id);

	int userAddressUpdate(Map map);

	Itda_User pwCheck(String id);

	void pwUpdate(Map map);
	
	
}


