package com.itda.ITDA.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Admin implements UserDetails {
	private static final long serialVersionUID = 3057197847211770564L;
	private String adminId;			//관리자 ID
	private String adminPw;			//관리자 비밀번호
	private String adminName;		//관리자 이름
	private String adminDept;		//관리자 부서
    private String adminClass;		//관리자 직급
    private String adminEmail;		//관리자 이메일
    private String authName;		//권한명
    private String userProfile;
    @Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		list.add(new SimpleGrantedAuthority(getAuthName()));
		return list;
	}
    
    @Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getPassword() {
		return adminPw;
	}

	@Override
	public String getUsername() {
		return adminId;
	}
	
	public String setUserProfile() {
		return "/static/image/main/login.png";
	}
}
