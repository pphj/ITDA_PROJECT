package com.itda.ITDA;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.itda.ITDA.security.AdminAccessDeniedHandler;
import com.itda.ITDA.security.AdminLoginFailHandler;
import com.itda.ITDA.security.AdminLoginSuccessHandler;
import com.itda.ITDA.security.AdminUserDetailService;
import com.itda.ITDA.security.UserAccessDeniedHandler;
import com.itda.ITDA.security.UserDetailService;
import com.itda.ITDA.security.UserLoginFailHandler;
import com.itda.ITDA.security.UserLoginSuccessHandler;
import com.itda.ITDA.security.naverDetailService;
import com.itda.ITDA.security.naverLoginFailHandler;
import com.itda.ITDA.security.naverLoginSuccessHandler;

@EnableWebSecurity // 스프링과 시큐리티 결합
@Configuration
public class SecurityConfig {
   @Autowired
   private DataSource datasource;
   
//   @Bean
//   public SecurityFilterChain mainSecurityFilterChain(HttpSecurity http) throws Exception {
//       http.antMatcher("/main/**")
//       		.authorizeRequests(authorizeRequests -> authorizeRequests
//                   .antMatchers("/resources/**").permitAll()
//       		);
//
//       return http.build();
//   }
   

   @Bean
   public SecurityFilterChain adMemberSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.authenticationProvider(adminAuthencationProvider());
	   http.antMatcher("/adMember/**")
	   		.authorizeRequests(authorizeRequests -> authorizeRequests
                   .antMatchers("/resources/**").permitAll()
           )
           .formLogin(formLogin -> formLogin
                   .loginPage("/admin/adminLogin")
                   .loginProcessingUrl("/adMember/loginProcess")
                   .usernameParameter("adminId")
                   .passwordParameter("adminPw")
                   .successHandler(adminLoginSuccessHandler())
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
						.userDetailsService(adminDetailService())
						.tokenValiditySeconds(2419200)
						.tokenRepository(tokenRepository());
					} catch (Exception e) {
					e.printStackTrace();
					}
           });
	   
	   http.exceptionHandling().accessDeniedHandler(adminAccessDeniedHandler());

       return http.build();
   }
   
   @Bean
   public SecurityFilterChain adminSecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/admin/**")
	   		.authorizeRequests(authorizeRequests -> authorizeRequests
	   			.antMatchers("/admin/adminLogin").permitAll()
	            .antMatchers("/admin/sellerApprove").access("hasRole('ROLE_SUPER')")
	            .antMatchers("/admin/adminApprove").access("hasRole('ROLE_SUPER')")
	            .antMatchers("/admin/**").access("hasAnyRole('ROLE_SUPER','ROLE_ADMIN')")
	   			//.antMatchers("/admin/**").permitAll()
	   			.antMatchers("/resources/**").permitAll());
	   
	   http.exceptionHandling().accessDeniedHandler(adminAccessDeniedHandler());
	   
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
	   http.authenticationProvider(userAuthencationProvider());
	   http.antMatcher("/member/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/resources/**").permitAll()
	 		)
	 		.formLogin(formLogin -> formLogin
		               .loginPage("/")
		               .loginProcessingUrl("/member/loginProcess")
		               .usernameParameter("userId")
		               .passwordParameter("userPw")
		               .successHandler(userLoginSuccessHandler())
		               .failureHandler(userLoginFailHandler())
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
							.userDetailsService(userDetailService())
							.tokenValiditySeconds(2419200)
							.tokenRepository(tokenRepository());
						} catch (Exception e) {
							e.printStackTrace();
						}
				});
	   
	   http.exceptionHandling().accessDeniedHandler(userAccessDeniedHandler());
	   
	   return http.build();
   }
   
   @Bean
   public SecurityFilterChain mySecurityFilterChain(HttpSecurity http) throws Exception {
	   http.antMatcher("/my/**")
	 		.authorizeRequests(authorizeRequests -> authorizeRequests
	 				.antMatchers("/my/subscriptions").access("hasRole('ROLE_USER')")
	 				.antMatchers("/resources/**").permitAll());
	   
	   http.exceptionHandling().accessDeniedHandler(userAccessDeniedHandler());
 
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
   
   //네이버
   @Bean
   public SecurityFilterChain naverSecurityFilterChain(HttpSecurity http) throws Exception {
       http.antMatcher("/main/**") // 네이버 로그인 URL 설정
               .authorizeRequests(authorizeRequests -> authorizeRequests
                       .antMatchers("/resources/**").permitAll()
                       .antMatchers("/main").access("hasRole('ROLE_NAVER')") // 이 줄은 해당 유저 권한으로 설정하세요
        )
       .formLogin(formLogin -> formLogin
               .loginPage("/")
               .loginProcessingUrl("/member/loginProcess2")
               .usernameParameter("userId")
               .passwordParameter("userPw")
               .successHandler(naverLoginSuccessHandler())
               .failureHandler(naverLoginFailHandler())
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
					.userDetailsService(naverDetailService())
					.tokenValiditySeconds(2419200)
					.tokenRepository(tokenRepository());
				} catch (Exception e) {
				e.printStackTrace();
				}
       });
   
   http.exceptionHandling().accessDeniedHandler(adminAccessDeniedHandler());

   return http.build();
}


	private UserDetailsService naverDetailService() {
		return new naverDetailService();
	}
	
	private AuthenticationFailureHandler naverLoginFailHandler() {
		return new naverLoginFailHandler();
	}
	
	private AuthenticationSuccessHandler naverLoginSuccessHandler() {
		return new naverLoginSuccessHandler();
	}

@Bean	//유저
   public DaoAuthenticationProvider userAuthencationProvider() {
      DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
      provider.setUserDetailsService(userDetailService());
      provider.setPasswordEncoder(encodePassword());
      return provider;
   }
   
   @Bean	//관리자
   public DaoAuthenticationProvider adminAuthencationProvider() {
	      DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
	      provider.setUserDetailsService(adminDetailService());
	      provider.setPasswordEncoder(encodePassword());
	      return provider;
	   }
   
   @Bean
   public PersistentTokenRepository tokenRepository() {
      JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
      jdbcTokenRepository.setDataSource(datasource);
      return jdbcTokenRepository;
   }
   
   @Bean
   public UserDetailsService userDetailService() {				//유저 데이터
      return new UserDetailService();
   }
   
   @Bean
   public UserDetailsService adminDetailService() {				//관리자 데이터
      return new AdminUserDetailService();
   }
   
   @Bean
   public AuthenticationFailureHandler userLoginFailHandler() {			//유저 로그인 실패
      return new UserLoginFailHandler();
   }
   
   @Bean
   public AuthenticationFailureHandler adminLoginFailHandler() {	//관리자 로그인 실패
      return new AdminLoginFailHandler();
   }
   
   @Bean
   public AuthenticationSuccessHandler userLoginSuccessHandler() {		//유저 로그인 성공
      return new UserLoginSuccessHandler();
   }
   
   @Bean
   public AuthenticationSuccessHandler adminLoginSuccessHandler() {	//관리자 로그인 성공
      return new AdminLoginSuccessHandler();
   }
   
   @Bean
   public UserAccessDeniedHandler userAccessDeniedHandler() {		//유저 접속 제한
	   return new UserAccessDeniedHandler();
   }
   
   @Bean
   public AdminAccessDeniedHandler adminAccessDeniedHandler() {		//관리자 접속 제한
	   return new AdminAccessDeniedHandler();
   }
   
   @Bean
   public BCryptPasswordEncoder encodePassword() {			//비밀번호 인코더
      return new BCryptPasswordEncoder();
   }

}