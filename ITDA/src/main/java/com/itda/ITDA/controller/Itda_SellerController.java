package com.itda.ITDA.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.service.Itda_UserService;

@Controller
@RequestMapping("/sellerjoinprocess")
public class Itda_SellerController {
	  @Autowired
	  private Itda_UserService Itda_UserService; // 사용자 서비스 클래스에 대한 의존성 주입

	 
	}