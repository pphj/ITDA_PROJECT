package com.itda.ITDA.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.service.adMemberService;
import com.itda.ITDA.util.CommonSource;

@Controller
@RequestMapping(value="/adMember")
public class adMemberController {
	private static final Logger logger = LoggerFactory.getLogger(adMemberController.class);
	
	private adMemberService admemberService;
	
	@Autowired
	public adMemberController(adMemberService admemberService) {
		this.admemberService=admemberService;
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
			mv.setViewName("redirect:/admin/adminLogin");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/adminLogin";
	}
	
	@RequestMapping(value="/update")
	public ModelAndView update(Principal principal, ModelAndView mv, Admin admin) {
		String adminId = principal.getName();
	    
	    if (adminId == null) {
	    	mv.setViewName("redirect:admin/Main");
	    	logger.info("아이디가 DB에 없습니다.");
	    }else {
	    	admin = admemberService.adminInfo(adminId);
	 		mv.addObject("admin", admin);
	 		mv.setViewName("admin/adminUpdateForm");
	    }
		return mv;
	}
	
	@PostMapping("/updateProcess")
	public String updateProcess(Admin admin, Model model,
			HttpServletRequest request, RedirectAttributes ra, Principal principal) {
		
		int result = admemberService.adminUpdate(admin);
		
		if (result == CommonSource.SUCCESS) {
			logger.info("관리자 정보 수정 성공");
			ra.addFlashAttribute("result", "updateSuccess");
			return "redirect:/admin/Main";
		}else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "관리자 정보 수정 실패");
			return "error/error";
		}
	}
	
}
