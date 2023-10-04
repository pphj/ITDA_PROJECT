package com.itda.ITDA.security;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.GenericFilterBean;

@Component
public class JWTTokenFilter extends GenericFilterBean {

    private final JWTTokenProvider tokenProvider;

    public JWTTokenFilter(JWTTokenProvider tokenProvider) {
        this.tokenProvider = tokenProvider;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // 요청 경로 확인
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();

        // 메인 페이지와 resources 디렉토리의 하위 경로, .png 파일에 접근할 때는 토큰 검증을 수행하지 않음
        if (!requestURI.equals("${pageContext.request.contextPath}/") &&
            !requestURI.startsWith("${pageContext.request.contextPath}/resources/") &&
            !requestURI.endsWith(".png")) {
            String token = resolveToken(httpRequest);
            
            // 토큰이 null이 아니고 유효한 경우에만 검증을 수행하도록 변경합니다.
            if (token != null) {
                Authentication authentication = tokenProvider.getAuthentication(token);
                if (authentication != null) {
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                }
            }
        }

        chain.doFilter(request, response);
    }

    private String resolveToken(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        
         // Authorization 헤더가 존재하고 Bearer로 시작하는 경우에만 토큰을 추출합니다.
         // Bearer로 시작하는 경우에만 추출하는 이유는 JWT Token의 정해진 규칙과 일치하는 유효한 토큰만을 처리하기 위함입니다.
         if (bearerToken != null && bearerToken.startsWith("Bearer ")) { //인증 스킴
             return bearerToken.substring(7); // "Bearer " 이후의 토큰 문자열 반환
         }
         
         return null; // 토큰이 없으면 null 반환
     }

}
