package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.mybatis.mapper.NaverMapper;


@Service
public class NaverService {

    private final NaverMapper dao;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public NaverService(NaverMapper dao, PasswordEncoder passwordEncoder) {
        this.dao = dao;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean saveNaverUserInfo(NaverDTO dto) {
		String encPassword = passwordEncoder.encode("1");
		dto.setUserPw(encPassword);
		
        return dao.saveNaverUserInfo(dto);
    }

	public NaverDTO isId(String email) {
		
		return dao.isId(email);
	}
}