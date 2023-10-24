package com.itda.ITDA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.service.NaverService;

@Controller
//@RequestMapping(value = "/itda")
public class NaverController {
    private final NaverService naverService;

    @Autowired
    public NaverController(NaverService naverService) {
        this.naverService = naverService;
    }

    @GetMapping("/login")
	public String naverLogin() {
	    // 네이버 로그인 페이지로 리다이렉트합니다.
	    String redirectUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=rcyeX4m7t_YVfke5Wd6Y&redirect_uri=http://localhost:9400/itda/member/callback&state=1111";
	    return "redirect:" + redirectUrl;
	}


	
}
