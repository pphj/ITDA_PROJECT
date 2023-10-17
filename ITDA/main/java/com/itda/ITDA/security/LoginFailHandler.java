package com.itda.ITDA.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailHandler implements AuthenticationFailureHandler {
	private static final Logger logger = LoggerFactory.getLogger(LoginFailHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		logger.info(exception.getMessage());
		logger.info("로그인 실패");

		//메세지를 세션에 저장해놓았기 때문에 새로고침하면 계속 알럿창이 뜸
		//해결하기 위해 controller의 login에서 세션값을 지워준다
		session.setAttribute("loginfail", "loginFailMsg");
		
		String url = request.getContextPath() + "/";
		response.sendRedirect(url);
		
	}
	
	
}
