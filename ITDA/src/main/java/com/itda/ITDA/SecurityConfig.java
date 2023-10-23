package com.itda.ITDA;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.itda.ITDA.security.AdminLoginFailHandler;
import com.itda.ITDA.security.AdminLoginSuccessHandler;
import com.itda.ITDA.security.AdminUserDetailService;
import com.itda.ITDA.security.CustomUserDetailService;
import com.itda.ITDA.security.LoginFailHandler;
import com.itda.ITDA.security.LoginSuccessHandler;

@EnableWebSecurity // 스프링과 시큐리티 결합
@Configuration
public class SecurityConfig {
   @Autowired
   private DataSource datasource;
   
   @Bean
   public SecurityFilterChain mainSecurityFilterChain(HttpSecurity http) throws Exception {
       http.antMatcher("/main/**")
       		.authorizeRequests(authorizeRequests -> authorizeRequests
                   .antMatchers("/resources/**").permitAll()
       		);

       return http.build();
   }

   @Bean
   public SecurityFilterChain adMemberSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/adMember/**")
	   		.authorizeRequests(authorizeRequests -> authorizeRequests
                   .antMatchers("/resources/**").permitAll()
           )
           .formLogin(formLogin -> formLogin
                   .loginPage("/admin/adminLogin")
                   .loginProcessingUrl("/adMember/loginProcess")
                   .usernameParameter("adminId")
                   .passwordParameter("adminPw")
                   .successHandler(adminloginSuccessHandler())
                   .failureHandler(adminLoginFailHandler())
           )
           .logout(logout -> logout
                   .logoutSuccessUrl("/admin/adminLogin")
                   .logoutUrl("/adMember/logout")
                   .invalidateHttpSession(true)
                   .deleteCookies("remember-me", "JSESSION_ID")
           )
           .rememberMe(rememberMe -> {
        	   try {rememberMe
						.rememberMeParameter("remember-me")
						.userDetailsService(adminUserService())
						.tokenValiditySeconds(2419200)
						.tokenRepository(tokenRepository());
					} catch (Exception e) {
					e.printStackTrace();
					}
           });

       return http.build();
   }
   
   @Bean
   public SecurityFilterChain adminSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/admin/**")
	   		.authorizeRequests(authorizeRequests -> authorizeRequests 
	            //.antMatchers("/admin/adminLogin").permitAll()
//	            .antMatchers("/admin/**").access("hasAnyRole('SUPER_ADMIN','ADMIN')")
	            .antMatchers("/admin/sellerApprove").access("hasRole('SUPER_ADMIN')")
	            .antMatchers("/admin/adminApprove").access("hasRole('SUPER_ADMIN')")
	   			.antMatchers("/resources/**").permitAll());
	   
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain channelsSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/channels/**")
	  		.authorizeRequests(authorizeRequests -> authorizeRequests
	  				.antMatchers("/resources/**").permitAll());
	  
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain contentsSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/contents/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain infoSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/info/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain sellerSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/seller/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain memberSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/member/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll()
	 		)
	 		.formLogin(formLogin -> formLogin
		               .loginPage("/")
		               .loginProcessingUrl("/member/loginProcess")
		               .usernameParameter("userId")
		               .passwordParameter("userPw")
		               .successHandler(loginSuccessHandler())
		               .failureHandler(loginFailHandler())
		        )
		        .logout(logout -> logout
		               .logoutSuccessUrl("/")
		               .logoutUrl("/member/logout")
		               .invalidateHttpSession(true)
		               .deleteCookies("remember-me", "JSESSION_ID")
		        )
		        .rememberMe(rememberMe -> {
		        	try {rememberMe
							.rememberMeParameter("remember-me")
							.userDetailsService(customUserService())
							.tokenValiditySeconds(2419200)
							.tokenRepository(tokenRepository());
						} catch (Exception e) {
							e.printStackTrace();
						}
				});
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain mySecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/my/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain productSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/product/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain paySecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/pay/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain userSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/user/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll());
 
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain SecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll()
	 		);
		   
	   return http.build();
   }
   
   AuthenticationManager authenticationManager(		//인증 요청을 처리
         AuthenticationConfiguration authenticationConfiguration) throws Exception {
            return authenticationConfiguration.getAuthenticationManager();
   }
   
   @Bean	//사용자 정보, 비밀번호를 데이터베이스에서 가져와
   			//사용자가 입력한 비밀번호와 저장된 비밀번호를 비교하여 사용자를 인증
   public DaoAuthenticationProvider userAuthencationProvider() {
      DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
      provider.setUserDetailsService(customUserService());
      provider.setUserDetailsService(adminUserService());
      provider.setPasswordEncoder(encodePassword());
      return provider;
   }
   
   @Bean
   public PersistentTokenRepository tokenRepository() {			//로그인 정보 기억시
      JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
      jdbcTokenRepository.setDataSource(datasource);
      return jdbcTokenRepository;
   }
   
   @Bean
   public UserDetailsService customUserService() {				//유저 데이터
      return new CustomUserDetailService();
   }
   
   @Bean
   public UserDetailsService adminUserService() {				//관리자 데이터
      return new AdminUserDetailService();
   }
   
   @Bean
   public AuthenticationFailureHandler loginFailHandler() {			//유저 로그인 실패
      return new LoginFailHandler();
   }
   
   @Bean
   public AuthenticationFailureHandler adminLoginFailHandler() {	//관리자 로그인 실패
      return new AdminLoginFailHandler();
   }
   
   @Bean
   public AuthenticationSuccessHandler loginSuccessHandler() {		//유저 로그인 성공
      return new LoginSuccessHandler();
   }
   
   @Bean
   public AuthenticationSuccessHandler adminloginSuccessHandler() {	//관리자 로그인 성공
      return new AdminLoginSuccessHandler();
   }
   
   @Bean
   public BCryptPasswordEncoder encodePassword() {			//비밀번호 인코더
      return new BCryptPasswordEncoder();
   }
   
}