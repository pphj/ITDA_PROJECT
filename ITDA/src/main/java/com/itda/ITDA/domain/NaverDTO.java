package com.itda.ITDA.domain;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NaverDTO implements UserDetails{
	 	private String userId;
	 	private String userPw;
	    private String name;
	    private String email;
	    private String nickname;
	    private String gender;
	    private String age;
	    private String userProfile;
	    

@Getter
    private String access_token;

@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
	ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
	list.add(new SimpleGrantedAuthority("ROLE_NAVER"));
	return list;
}

@Override
public String getPassword() {
    return userPw;
}

@Override
public String getUsername() {
    return email;
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

}