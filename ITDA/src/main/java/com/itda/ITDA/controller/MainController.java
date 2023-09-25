package com.itda.ITDA.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.service.MainService;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	private MainService mainService;

	@Autowired
	public MainController(MainService mainService) {
		this.mainService = mainService;
	}

	@GetMapping(value = "/protomain")
	public ModelAndView SetMain(ModelAndView mv) {
		mv.setViewName("main/protomain");
		return mv;
	}

	@GetMapping(value = "/search")
	public String search() {
		return "/main/search";
	}

}
