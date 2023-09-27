package com.itda.ITDA.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

}
