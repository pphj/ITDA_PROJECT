package com.itda.ITDA.domain;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Seller {
	private String userId;
    private String sellerPhone;
    private String sellerEmail;
    private Timestamp sellerJoinDate;
    private String authName;
    private String adminId;
    private Timestamp waitOkDate;
    private String waitState;
}
