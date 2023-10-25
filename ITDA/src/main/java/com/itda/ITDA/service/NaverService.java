package com.itda.ITDA.service;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.itda.ITDA.domain.NaverDTO;


@Service
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

	

		public NaverDTO getNaverInfo(String code) {
			 String tokenUrl = NAVER_AUTH_URI + "/oauth2.0/token";
		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		        // 토큰 요청에 필요한 파라미터 설정
		        MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
		        requestBody.add("grant_type", "authorization_code");
		        requestBody.add("client_id", NAVER_CLIENT_ID);
		        requestBody.add("client_secret", NAVER_CLIENT_SECRET);
		        requestBody.add("redirect_uri", NAVER_REDIRECT_URL);
		        requestBody.add("code", code);

		        // HttpEntity 생성
		        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);

		        // 토큰 요청
		        ResponseEntity<NaverDTO> responseEntity = new RestTemplate().exchange(
		                tokenUrl,
		                HttpMethod.POST,
		                requestEntity,
		                NaverDTO.class
		        );

		        if (responseEntity.getStatusCode().is2xxSuccessful()) {
		            return responseEntity.getBody();
		        } else {
		            // 토큰 요청이 실패한 경우 예외 처리
		            throw new RuntimeException("Failed to request Naver token");
		        }
		    }

}