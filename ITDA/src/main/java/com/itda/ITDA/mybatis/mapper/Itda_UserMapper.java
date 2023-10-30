package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.GoodUser;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.LikeChNewContent;
import com.itda.ITDA.domain.LikeChannel;
import com.itda.ITDA.domain.LikeContent;
import com.itda.ITDA.domain.Order;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.domain.UserLeaveReason;
import com.itda.ITDA.domain.sub;

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

	int userCategoryUpdate(UserCategory userCategory);

	Itda_User isUserIdORSellerId(String id);

	Itda_User emailCheck(String id);

	int userUpdateProfile(Itda_User user);

	int userEmailUpdate(Itda_User user);
	
	void updateUserPassword(String userEmail, String encryptedPassword);

	int insertPaymentUser(String id);

	GoodUser isGoodUser(String id);

	int insertFirstPaymentUser(GoodUser goodUser);

	int updatePaymentUser(GoodUser goodUser);

	int updateResetPaymentUser(GoodUser goodUser);

	List<Order> myOrderList(String id);

	Order getOrderInfo(int orderNum);

	int orderListCount(String id);

	List<LikeContent> likeContentList(String id);

	int likeContentCount(String id);

	List<LikeChannel> myLikeChList(String id);

	int myLikeChListCount(String id);

	List<LikeChNewContent> myLikeChNewContentList(String id);

	int deleteLickCh(sub sub);




	
	
}


