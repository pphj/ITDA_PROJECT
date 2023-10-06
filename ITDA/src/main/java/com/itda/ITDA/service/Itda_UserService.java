package com.itda.ITDA.service;

import com.itda.ITDA.domain.Itda_User;

public interface Itda_UserService {

	int isId(String userId);

	int insert(Itda_User mem);

	int isId(String userId, String userPw);

	Itda_User read(String id);


	
}
