package com.itda.ITDA.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserAccessDeniedHandler implements AccessDeniedHandler {
	private static final Logger logger = LoggerFactory.getLogger(UserAccessDeniedHandler.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userAuthorities = authentication.getAuthorities().toString();
	    logger.info("현재 사용자의 권한: " + userAuthorities);
		logger.error("User Access Denied : 접근 권한이 없습니다.");
		
		String alertMessage = "접근 권한이 없습니다.";
		alertMessage = alertMessage.replace("+", " ");
        String script = "<script>alert(decodeURIComponent('" + alertMessage + "')); window.location.href='" + request.getContextPath() + "/';</script>";

        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().write(script);
	}
	
	
}
