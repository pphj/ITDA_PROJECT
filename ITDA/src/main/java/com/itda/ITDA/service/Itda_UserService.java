package com.itda.ITDA.service;

import java.util.List;
import java.util.Map;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.domain.UserLeaveReason;

public interface Itda_UserService {

	int isId(String userId);

	int insert(Itda_User mem);

	int isId(String userId, String userPw);

	Itda_User read(String id);

	int userAddressUpdate(Itda_User itdaUser);

	Itda_User pwCheck(String id);

	void pwUpdate(Itda_User itdaUser);
	
	Itda_User findUserByEmail(String email);
    
	void resetPassword(String email, String newPassword);  

	Itda_User getUserName(String id);

	List<UserLeaveReason> getLeaveReasonCategory();

	int leaveResonInsert(UserLeaveReason leaveReason);

	int deleteUserInsert(String id);

	int itda_userDelete(String id);

	int userCategoryUpdate(UserCategory userCategory);

	Itda_User isUserIdORSellerId(String id);

	Itda_User emailCheck(String id);

	Itda_User userEmailUpdate(String id);

	int userUpdateProfile(String id);





	
}
