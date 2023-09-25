package com.itda.ITDA;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//스프링 부트 생성 시, war 파일을 선택했을 때만 생성된다.
public class ServletInitializer extends SpringBootServletInitializer {
	
	//WAR 파일을 생성하고 외부 서블릿 컨테이너에 배포하여 스프링부트 애플리케이션을 실행하는 역할을 하는 클래스
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		//configure : SpringApplicationBuilder를 이용하며, application.sources() 메서드를 사용해
		//외부 서블릿 컨테이너에서 실행할 스프링 부트 애플리케이션을 설정해준다.
		return application.sources(ItdaApplication.class);
	}

}
