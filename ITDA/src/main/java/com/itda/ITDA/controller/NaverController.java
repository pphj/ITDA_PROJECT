package com.itda.ITDA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itda.ITDA.service.NaverService;

@Controller
@RequestMapping(value = "/naver")
public class NaverController {
    private final NaverService naverService;

    @Autowired
    public NaverController(NaverService naverService) {
        this.naverService = naverService;
    }

    @GetMapping("/login")
    public String redirectToNaverLogin(Model model) {
        String naverLoginUrl = naverService.getNaverLogin();
        model.addAttribute("naverUrl", naverLoginUrl);
        return "user/userLogin";
    }
}
