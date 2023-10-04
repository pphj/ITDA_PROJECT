package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.mybatis.mapper.adMemberMapper;

@Service
public class adMemberServiceImpl implements adMemberService {
	private adMemberMapper dao;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public adMemberServiceImpl (adMemberMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
	}
	
	
	@Override
	public int isId(String adminId, String adminPw) {
		Admin ad = dao.isId(adminId);
		int result = -1;
		
		if(ad != null) {
			if (passwordEncoder.matches(adminPw, ad.getAdminPw())) {
				result = 1;
			}else {
				result = 0;
			}
		}
		return result;
	}

	@Override
	public int isId(String id) {
		Admin ad = dao.isId(id);
		return (ad == null) ? -1 : 1;
	}

}
