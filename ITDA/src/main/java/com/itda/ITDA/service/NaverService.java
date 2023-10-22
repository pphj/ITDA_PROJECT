package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Value;

public class NaverService {

	 @Value("${naver.client.id}")
	    private String NAVER_CLIENT_ID;

	    @Value("${naver.client.secret}")
	    private String NAVER_CLIENT_SECRET;

	    @Value("${naver.redirect.url}")
	    private String NAVER_REDIRECT_URL;

	    private final static String NAVER_AUTH_URI = "https://nid.naver.com";
	    private final static String NAVER_API_URI = "https://openapi.naver.com";

	    public String getNaverLogin() {
	        return NAVER_AUTH_URI + "/oauth2.0/authorize"
	                + "?client_id=" + NAVER_CLIENT_ID
	                + "&redirect_uri=" + NAVER_REDIRECT_URL
	                + "&response_type=code";
	    }
	}