package com.itda.ITDA.service;

import java.util.Map;

import com.itda.ITDA.domain.Itda_User;

public interface Itda_UserService {

	int isId(String userId);

	int insert(Itda_User mem);

	int isId(String userId, String userPw);

	Itda_User read(String id);

	int userAddressUpdate(Map map);

	Itda_User pwCheck(String id);

	void pwUpdate(Map map);




	
}
