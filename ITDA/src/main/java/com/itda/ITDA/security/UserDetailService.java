package com.itda.ITDA.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.multipart.MultipartFile;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.mybatis.mapper.Itda_UserMapper;
import com.itda.ITDA.mybatis.mapper.NaverMapper;

public class UserDetailService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(UserDetailService.class);

	@Autowired
	private Itda_UserMapper dao;
	@Autowired
	private NaverMapper dao2;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("유저 로그인시 입력한 값: 1 " + username);
		UserDetails user = null;
		if (username.contains("@")) {
			user = dao2.isId(username);

		} else {
			user = dao.isId(username);
		}

		if (user == null) {
			throw new UsernameNotFoundException("로그인 아이디: " + username + " 사용자 정보를 찾을 수 없습니다.");

		}

		return user;
	}

}
