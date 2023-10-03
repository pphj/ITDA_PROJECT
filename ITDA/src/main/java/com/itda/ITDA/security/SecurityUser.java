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

   // isAccountNonExpired, isAccountNonLocked, isCredentialsNonExpired, isEnabled 메서드는 필요에 따라 구현해주셔야 합니다.
   // 이 메서드들은 계정의 유효성을 확인하고 계정의 활성화 여부를 판단하는데 사용됩니다.

   @Override
   public boolean isAccountNonExpired() {
       // TODO: Replace with the actual account expiration check logic
       return true;
   }

   @Override
   public boolean isAccountNonLocked() {
       // TODO: Replace with the actual account lock check logic
       return true;
   }

   @Override
   public boolean isCredentialsNonExpired() {
       // TODO: Replace with the actual credentials expiration check logic 
       return true; 
   }
   
   @Override 
   public boolean isEnabled() { 
      // TODO: Replace with the actual enabled status check logic 
      return true; 
  } 

}

