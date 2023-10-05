package com.itda.ITDA.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Admin {
	private String adminId;			//관리자 ID
	private String adminPw;			//관리자 비밀번호
	private String adminName;		//관리자 이름
	private String adminDept;		//관리자 부서
    private String adminClass;		//관리자 직급
    private String adminEmail;		//관리자 이메일
    private String authName;		//권한명
    
}
