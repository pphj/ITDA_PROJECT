package com.itda.ITDA;

import java.util.stream.Collectors;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.itda.ITDA.security.JWTTokenFilter;
import com.itda.ITDA.security.JWTTokenProvider;
import com.itda.ITDA.security.SecurityService;

@EnableWebSecurity
@Configuration
public class SecurityConfig {
    @Autowired
    private DataSource datasource;

    // 시큐리티 서비스, JWT 토큰 필터, JWT 토큰 프로바이더 추가
    private SecurityService service;	
    private JWTTokenFilter filter; 
    private JWTTokenProvider provider;

    public SecurityConfig(JWTTokenFilter filter, JWTTokenProvider provider, SecurityService service) {
        this.filter = filter; 
        this.provider = provider; 
        this.service = service;  
   }

   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
       //#1. 권한이 필요한 대상입니다.
       http.authorizeRequests()
           .antMatchers("/test").authenticated()
           .antMatchers("/test2").authenticated();
       
       //#2. 세션을 쓰지 않습니다.
       http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
       
       //#3. JWT 필터를 쓰겠다고 설정하여 줍니다.
       http.addFilterBefore(filter, UsernamePasswordAuthenticationFilter.class);
       
       //#4. 사용자의 로그인 행동에 대한 정의 입니다.
       http.formLogin()
           .loginProcessingUrl("/login")
           .usernameParameter("username")
           .passwordParameter("password")        
           .successHandler((request, response, auth) -> {  //로그인 성공시 행동을 정의 합니다.
               String ip = request.getRemoteAddr();
               String user_id = auth.getName();
               
               System.out.println("login ok : "+ip + "" + user_id);
               
               response.setCharacterEncoding("UTF-8");
               response.setHeader("Content-Type", "application/download; UTF-8");
               String token = provider.createToken(user_id, auth.getAuthorities().stream().map(arg -> arg.getAuthority()).collect(Collectors.toList()));
               response.getWriter().write("{\"result\" : \""+token+"\" }");
               
           })       
           .failureHandler((request, response, auth) -> {  //로그인 실패시 행동을 정의 합니다.
               String ip = request.getRemoteAddr();
               String user_id = request.getParameter("username");
               
               System.out.println("login fail : "+ip + "" + user_id);
               
               response.sendRedirect("/");
           })
        	.permitAll();

      //#5.csrf 설정을 off 합니다.
	  http.csrf().disable();

	  return http.build();
   }

   @Bean
   public BCryptPasswordEncoder encodePassword() {
	   return new BCryptPasswordEncoder();
   }
}
