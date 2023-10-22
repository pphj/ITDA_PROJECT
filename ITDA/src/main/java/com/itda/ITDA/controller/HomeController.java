package com.itda.ITDA.controller;

import org.apache.maven.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itda.ITDA.service.NaverService;
import org.springframework.ui.ModelMap;



import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HomeController {

//	  private final AppleService appleService;
//	    private final KakaoService kakaoService;
	    private final NaverService naverService;

    @RequestMapping(value="/", method= RequestMethod.GET)
    public String login(Model model) {
//        model.addAttribute("appleUrl", appleService.getAppleLogin());
//        model.addAttribute("kakaoUrl", kakaoService.getKakaoLogin());
        model.addAttribute("naverUrl", naverService.getNaverLogin());

        return "index";
    }
}