package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.UserLeaveReason;

@Mapper
public interface Itda_UserMapper {
	
	Itda_User isId(String username);

	int insert(Itda_User mem);

	Itda_User goSubsctiptions(String userId);

	Itda_User read(String id);

	int userAddressUpdate(Itda_User itdaUser);

	Itda_User pwCheck(String id);

	void pwUpdate(Itda_User itdaUser);

	Itda_User getUserName(String id);

	List<UserLeaveReason> getLeaveReasonCategory();
	
	Itda_User findUserByEmail(String email);
    
    void resetPassword(Map map);

	int leaveResonInsert(UserLeaveReason leaveReason);

	int deleteUserInsert(String id);

	int itda_userDelete(String id);

	
	
}


