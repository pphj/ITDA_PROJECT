package com.itda.ITDA.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.itda.ITDA.security.SecurityUser;

@Service
public class SecurityService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		SecurityUser user = new SecurityUser(); // 이 부분에서는 데이터베이스에서 가져온 결과로 초기화해야 합니다. SecurityUser는 DTO 객체입니다.
		UserDetails build = null;

		try {
			User.UserBuilder userBuilder = User.withUsername(username).password(user.getPassword());
			userBuilder.authorities(user.getAuthorities());
			build = userBuilder.build();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return build;
	}
}
