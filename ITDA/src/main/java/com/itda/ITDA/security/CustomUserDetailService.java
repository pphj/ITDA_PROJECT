package com.itda.ITDA.security;

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

public class CustomUserDetailService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailService.class);

	@Autowired
	private Itda_UserMapper dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("유저 로그인시 입력한 값: " + username);
		Itda_User user = dao.isId(username);
		
		if (user != null) {
	        logger.info("로그인 아이디: " + username + " 관리자가 로그인 시도했습니다.");
	        // 사용자 정보를 User 클래스로 만들어 반환
	        return User.builder()
	            .username(user.getUserId())
	            .password(user.getUserPw())
	            .authorities(new SimpleGrantedAuthority(user.getAuthName()))
	            .accountExpired(false)
	            .accountLocked(false)
	            .credentialsExpired(false)
	            .disabled(false)
	            .build();
	        
	    }

	    throw new UsernameNotFoundException("로그인 아이디: " + username + " 사용자 또는 관리자 정보를 찾을 수 없습니다.");
	}

}
