package com.itda.ITDA.controller;

import java.security.Principal;

import javax.swing.text.AbstractDocument.Content;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.service.InfoService;

@Controller
@RequestMapping(value = "/info")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	private InfoService infoService;

	@Autowired
	public InfoController(InfoService infoService) {
		this.infoService = infoService;
	}


	@GetMapping(value = "/notice")
	public ModelAndView notice(ModelAndView mv) {
		mv.setViewName("info/notice");
		return mv;
	}

	@GetMapping(value = "/faq")
	public ModelAndView faq(ModelAndView mv) {
		mv.setViewName("info/faq");
		return mv;
	}
	
	@GetMapping(value = "/qna")
	public ModelAndView qna(ModelAndView mv) {
		mv.setViewName("info/qna");
		return mv;
	}
	
	@GetMapping(value = "/requests")
	public ModelAndView requests(ModelAndView mv) {
	    mv.setViewName("info/requests");
	    return mv;
	}
	
	@PostMapping(value = "/qnainsert")
	public String addQna(@ModelAttribute AdminBoard adminBoard,
	                     Principal principal) {
	    String userId = principal.getName();  // 로그인한 유저 ID
	    adminBoard.setUserId(userId);  // 질문자 ID 설정

	    // adWriter, adPassword 등 다른 필드는 별도의 로직으로 처리...
	    
	    infoService.insertQna(adminBoard);  // QnA 데이터 저장

	    return "redirect:/info/qna";  // 처리 후 리다이렉트할 페이지
	}



}
