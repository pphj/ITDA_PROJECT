package com.itda.ITDA.domain;

import java.security.Timestamp;

public class Seller {
	private String userId;
	private String sellerPhone;
	private String sellerEmail;
	private Timestamp sellerJoinDate;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSellerPhone() {
		return sellerPhone;
	}
	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	public Timestamp getSellerJoinDate() {
		return sellerJoinDate;
	}
	public void setSellerJoinDate(Timestamp sellerJoinDate) {
		this.sellerJoinDate = sellerJoinDate;
	}
	
    
}
