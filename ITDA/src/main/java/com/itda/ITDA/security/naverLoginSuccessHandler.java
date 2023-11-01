package com.itda.ITDA.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.mybatis.mapper.NaverMapper;

public class naverLoginSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(naverLoginSuccessHandler.class);
	
	@Autowired
	private NaverMapper dao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("UserLoginSuceessHandler 아이디 : " + authentication.getName());
		
		NaverDTO users = dao.isId(authentication.getName());
		
		logger.info("users : " + users);
		
		if (users != null) {
			String url = request.getContextPath() + "/";
			response.sendRedirect(url);
	        
	    }
	}
}
