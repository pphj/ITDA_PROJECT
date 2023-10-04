package com.itda.ITDA.domain;

public class Admin {
	private String adminId;			//관리자 ID
	private String adminPw;			//관리자 비밀번호
	private String adminName;		//관리자 이름
	private String adminDept;		//관리자 부서
    private String adminClass;		//관리자 직급
    private String adminEmail;		//관리자 이메일
    private String authName;		//권한명
    
    
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminDept() {
		return adminDept;
	}
	public void setAdminDept(String adminDept) {
		this.adminDept = adminDept;
	}
	public String getAdminClass() {
		return adminClass;
	}
	public void setAdminClass(String adminClass) {
		this.adminClass = adminClass;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
    
    
}
