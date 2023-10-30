package com.itda.ITDA.security;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.mybatis.mapper.Itda_UserMapper;

/*
 * UserDetails는 인터페이스로 Security에서 사용자의 정보를 담는 인터페이스다.
 * 
 * UserDetailService 인터페이스는 DB에서 유저 정보를 불러오는 loadUserByUsername()이 존재한다.
 * 이를 구현하는 클래스는 DB에서 유저의 정보를 가져와 UserDetails 타입으로 리턴해주는 작업을 한다.
 * 
 * UserDetails 인터페이스를 구현한 클래스는 실제로 사용자의 정보와 사용자가 가진 권한의 정보를 처리해 반환한다.
 * ex) UserDetails user = new User(username, users.getPassword(), roles);
 */
public class CustomUserDetailService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailService.class);

	@Autowired
	private Itda_UserMapper dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("username은 로그인시 입력한 값 : " + username);
		Itda_User users = dao.isId(username);

		if (users == null) {
			logger.info("username" + username + "not found");
			throw new UsernameNotFoundException("username" + username + "not found");
		}

		return users;
	}

}
