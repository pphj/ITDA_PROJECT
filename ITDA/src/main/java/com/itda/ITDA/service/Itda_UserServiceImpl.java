package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.GoodUser;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.LikeChNewContent;
import com.itda.ITDA.domain.LikeChannel;
import com.itda.ITDA.domain.LikeContent;
import com.itda.ITDA.domain.Order;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.domain.UserLeaveReason;
import com.itda.ITDA.domain.sub;
import com.itda.ITDA.mybatis.mapper.Itda_UserMapper;

@Service
public class Itda_UserServiceImpl implements Itda_UserService {
	
	private Itda_UserMapper dao;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public Itda_UserServiceImpl(Itda_UserMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
		
	}

	@Override
	public int isId(String userId) {
		Itda_User rmember=dao.isId(userId);
		return (rmember == null) ? -1 : 1;
	}

	@Override
	public int insert(Itda_User mem) {
		return dao.insert(mem);
	}

	@Override
	public int isId(String userId, String userPw) {
		Itda_User rmember = dao.isId(userId);
		int result = -1;
		
		if (rmember != null) {		//아이디가 존재
			if (passwordEncoder.matches(userPw, rmember.getUserPw())) {//인코딩된 비밀번호가 DB와 일치하는지 확인
				result = 1;			//아이디 비밀번호 불일치
			}else {
				result = 0;			//아이디는 DB에 있지만 비밀번호 불일치
			}
		}
		return result;
	}

	@Override
	public Itda_User read(String id) {
		return dao.read(id);
	}

	@Override
	public int userAddressUpdate(Itda_User itdaUser) {
		return dao.userAddressUpdate(itdaUser);
	}

	@Override
	public Itda_User pwCheck(String id) {
		return dao.pwCheck(id);
	}

	@Override
	public void pwUpdate(Itda_User itdaUser) {
		dao.pwUpdate(itdaUser);
		
	}

	@Override
	public Itda_User getUserName(String id) {
		return dao.getUserName(id);
	}

	@Override
	public List<UserLeaveReason> getLeaveReasonCategory() {
		return dao.getLeaveReasonCategory();
	}

	public Itda_User findUserByEmail(String email) {
		return dao.findUserByEmail(email);
	}

	@Override
	public void resetPassword(String email, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int leaveResonInsert(UserLeaveReason leaveReason) {
		return dao.leaveResonInsert(leaveReason);
	}

	@Override
	public int deleteUserInsert(String id) {
		return dao.deleteUserInsert(id);
	}


	@Override
	public int itda_userDelete(String id) {
		return dao.itda_userDelete(id);
	}


	@Override
	public int userCategoryUpdate(UserCategory userCategory) {
		return dao.userCategoryUpdate(userCategory);
	}

	@Override
	public Itda_User isUserIdORSellerId(String id) {
		return dao.isUserIdORSellerId(id);
	}

	@Override
	public Itda_User emailCheck(String id) {
		return dao.emailCheck(id);
	}

	@Override
	public int userUpdateProfile(Itda_User user) {
		return dao.userUpdateProfile(user);
	}

	@Override
	public int userEmailUpdate(Itda_User user) {
		return dao.userEmailUpdate(user);
	}

	@Override
	public Itda_User getUser(String id) {
		return dao.isId(id);
	}


	public boolean changePassword(String userEmail, String newPassword) {
	    try {
	        String encryptedPassword = passwordEncoder.encode(newPassword); 
	        // 비밀번호를 암호화하여 encryptedPassword 변수에 저장

	        dao.updateUserPassword(userEmail, encryptedPassword);
	        // dao 메서드 호출 시 이메일과 암호화된 비밀번호 전달 
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	@Override
	public int insertPaymentUser(String id) {
		return dao.insertPaymentUser(id);
	}

	@Override
	public GoodUser isGoodUser(String id) {
		return dao.isGoodUser(id);
	}

	@Override
	public int insertFirstPaymentUser(GoodUser goodUser) {
		return dao.insertFirstPaymentUser(goodUser);
	}

	@Override
	public int updatePaymentUser(GoodUser goodUser) {
		return dao.updatePaymentUser(goodUser);
	}

	@Override
	public int updateResetPaymentUser(GoodUser goodUser) {
		return dao.updateResetPaymentUser(goodUser);
	}

	@Override
	public List<Order> myOrderList(String id) {
		return dao.myOrderList(id);
	}
	
	 
	public int orderListCount(String id) {
		return dao.orderListCount(id);
	}
	 

	@Override
	public Order getOrderInfo(int orderNum) {
		return dao.getOrderInfo(orderNum);
	}

	@Override
	public List<LikeContent> likeContentList(String id) {
		return dao.likeContentList(id);
	}

	@Override
	public int likeContentCount(String id) {
		return dao.likeContentCount(id);
	}

	public List<LikeChannel> myLikeChList(String id) {
		return dao.myLikeChList(id);
	}

	@Override
	public int myLikeChListCount(String id) {
		return dao.myLikeChListCount(id);
	}

	@Override
	public List<LikeChNewContent> myLikeChNewContentList(String id) {
		return dao.myLikeChNewContentList(id);
	}

	@Override
	public int deleteLickCh(sub sub) {
		return dao.deleteLickCh(sub);
	}




}