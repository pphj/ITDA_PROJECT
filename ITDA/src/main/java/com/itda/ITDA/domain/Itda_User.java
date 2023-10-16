package com.itda.ITDA.domain;

import java.security.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Itda_User implements UserDetails {
	private static final long serialVersionUID = 1L;
	private String userId;
	private String userPw;
	private String userName;
	private Date userBirth;
	private String userGender;
	private String userPhone;
	private String userAddress1;
	private String userAddress2;
	private String userPost;
	private String userEmail;
	private Timestamp userJoindate;
	private int statusId;
	private Timestamp updateDate;
	private MultipartFile profile;
	private String userProfile;
	private String authName;
	private String adminId;
	private String userCategory;
	private String chInfo;
	private String channel;
	
    private String sellerPhone;
    private String sellerEmail;
    
    private int cate_Id;
    private String cate_Name;

	public String getAuthName() {
		return "ROLE_" + authName; // "ROLE_"을 접두사로 추가

	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserPost() {
		return userPost;
	}

	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Timestamp getUserJoindate() {
		return userJoindate;
	}

	public void setUserJoindate(Timestamp userJoindate) {
		this.userJoindate = userJoindate;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		list.add(new SimpleGrantedAuthority(getAuthName()));
		return list;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userPw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userId;
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

	public String getUserName() {
		return userName;
	}
	
	

}
