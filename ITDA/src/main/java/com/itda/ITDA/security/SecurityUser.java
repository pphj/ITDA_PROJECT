package com.itda.ITDA.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class SecurityUser implements UserDetails {

    private static final long serialVersionUID = 1L;
    private String userId;  
    private String password;  
    private List<GrantedAuthority> userAuth;

    //사용자가 가지고 있는 권한(롤) 목록을 반환
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return userAuth;   
	}
	
	@Override
	public String getPassword() {
		return password; 
	}
	
	@Override
	public String getUsername() {
		return userId; 
	}


   //계정이 만료되었는지 여부를 판단	
   @Override
   public boolean isAccountNonExpired() {
       return true;
   }
   //계정이 잠겼는지 여부를 판단
   @Override
   public boolean isAccountNonLocked() {
       return true;
   }
   //자격 증명(비밀번호 등)이 만료되었는지 여부를 판단
   @Override
   public boolean isCredentialsNonExpired() {
       return true; 
   }
   //계정이 활성화되었는지 여부를 판단
   @Override 
   public boolean isEnabled() { 
      return true; 
  } 

}

