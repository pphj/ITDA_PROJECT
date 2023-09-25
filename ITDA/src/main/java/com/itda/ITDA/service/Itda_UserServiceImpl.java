package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Itda_User;
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

}
