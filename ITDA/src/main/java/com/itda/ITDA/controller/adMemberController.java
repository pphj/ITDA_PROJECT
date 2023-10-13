package com.itda.ITDA.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.service.adMemberService;

@Controller
@RequestMapping(value="/adMember")
public class adMemberController {
	private static final Logger logger = LoggerFactory.getLogger(adMemberController.class);
	
	private adMemberService admemberService;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public adMemberController(adMemberService admemberService, PasswordEncoder passwordEncoder) {
		this.admemberService=admemberService;
		this.passwordEncoder=passwordEncoder;
	}
	
	@RequestMapping(value="/Login", method=RequestMethod.GET)
	public ModelAndView adminLogin(ModelAndView mv,
			@CookieValue(value="saveid", required=false) Cookie readCookie,
			HttpSession session, Principal userPrincipal) {
		
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
			logger.info("저장된 아이디 : " + userPrincipal.getName());
			mv.setViewName("redirect:/admin/Main");
		}else {
			mv.addObject("loginfail", session.getAttribute("loginfail"));
			session.removeAttribute("loginfail");
			mv.setViewName("redirect:/admin/Main");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET)
	public int idcheck(@RequestParam("id") String id) {
		return admemberService.isId(id);
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
