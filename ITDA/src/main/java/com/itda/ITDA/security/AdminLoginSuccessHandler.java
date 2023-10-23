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

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.mybatis.mapper.adMemberMapper;

public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginSuccessHandler.class);
	
	@Autowired
	private adMemberMapper adminDao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("AdminLoginSuceessHandler 성공, 아이디 : " + authentication.getName()
		+ "   계정 권한 : "+ authentication.getAuthorities());
		
		Admin admin = adminDao.idadminId(authentication.getName());
		
		logger.info("admin : " + admin);
		
		if (admin != null) {
	    	String url = request.getContextPath() + "/admin/Main";
			response.sendRedirect(url);
	    }
	}
}
