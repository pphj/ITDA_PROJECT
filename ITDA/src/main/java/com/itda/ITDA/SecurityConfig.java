package com.itda.ITDA;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.itda.ITDA.security.JWTTokenFilter;
import com.itda.ITDA.security.JWTTokenProvider;
import com.itda.ITDA.security.SecurityService;

import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;

// import 추가
// import com.itda.ITDA.SecurityService; 
// import com.itda.ITDA.JWTTokenFilter; 
// import com.itda.ITDA.JWTTokenProvider; 

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
       http.csrf().disable();
       http.formLogin().loginPage("/member/login");
       
       return http.build();
   }

   @Bean
   public BCryptPasswordEncoder encodePassword() {
       return new BCryptPasswordEncoder();
   }
   
   @Bean
   WebSecurityCustomizer webSecurityCustomizer() {
       // 정적 리소스에 대한 접근 제한 설정
       return (web) -> web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/");
   }

}
