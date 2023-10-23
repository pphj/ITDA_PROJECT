package com.itda.ITDA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.service.NaverService;

@Controller
@RequestMapping(value = "/itda")
public class NaverController {
    private final NaverService naverService;

    @Autowired
    public NaverController(NaverService naverService) {
        this.naverService = naverService;
    }

    @GetMapping("/login")
	public String naverLogin() {
	    // 네이버 로그인 페이지로 리다이렉트합니다.
	    String redirectUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=rcyeX4m7t_YVfke5Wd6Y&redirect_uri=http://localhost:9400/itda/main/callback&state=1111";
	    return "redirect:" + redirectUrl;
	}


	@GetMapping("/callback")
	public String naverCallback(@RequestParam("code") String code, @RequestParam(name="state", required=false) String state) {
	    try {
	        if (code != null) {
	            // 네이버 인증 코드를 받아와서 처리하는 로직을 구현합니다.
	            NaverDTO naverInfo = naverService.getNaverInfo(code);

	            // 네이버 로그인 성공 후 리다이렉트할 경로 지정
	            return "redirect:/main/protomain";
	        } else {
	            // code가 없을 경우 예외 처리
	            throw new IllegalArgumentException("Invalid authorization code");
	        }
	    } catch (Exception e) {
	        // 예외 처리 로직 작성

	        // 예외 발생 시 리다이렉트할 경로 지정
	        return "redirect:/error-page";
	    }
	}
}
