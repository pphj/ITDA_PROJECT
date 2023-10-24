package com.itda.ITDA.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.mybatis.mapper.adMemberMapper;

public class AdminUserDetailService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(AdminUserDetailService.class);

	@Autowired
	private adMemberMapper adminDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    logger.info("관리자 로그인시 입력한 값: " + username);
	    Admin admin = adminDao.idadminId(username);

	    if (admin == null) {
	    	throw new UsernameNotFoundException(
	    			"로그인 아이디: " + username + " 관리자 정보를 찾을 수 없습니다.");
	    }

	    return admin;
	}

}
