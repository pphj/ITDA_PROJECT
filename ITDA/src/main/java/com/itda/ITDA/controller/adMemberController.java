package com.itda.ITDA.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.Admin;
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

//	
//	
//	@RequestMapping(value="/update", method=RequestMethod.GET)
//	public ModelAndView infoupdate(Principal principal, ModelAndView mv, Member mem) {
//	    String id = principal.getName();
//	    
//	    if (id == null) {
//	    	mv.setViewName("redirect:login");
//	    	logger.info("id is null");
//	    }else {
//	    	mem = admemberService.member_info(id);
//	 		mv.addObject("member", mem);
//	 		mv.setViewName("member/member_updateForm");
//	    }
//		return mv;
//	}
//	
//	
//	@PostMapping("/updateProcess")
//	public String UpdateProcess(Member mem, Model model,
//			HttpServletRequest request, RedirectAttributes ra, Principal principal) {
//		int result = 0;
//		String id = principal.getName();
//		System.out.println("넘어온 id 파라미터: " + id);
//		
//		//파라미터로 가져온 id 값과 세션 id가 일치하거나, 관리자 id일 경우
//		
//		if (result == 1) {
//			logger.info("회원정보 수정 성공");
//			ra.addFlashAttribute("result", "updateSuccess");
//			return "redirect:/board/list";
//		}else {
//			model.addAttribute("url", request.getRequestURL());
//			model.addAttribute("message", "회원정보 수정 실패");
//			return "error/error";
//		}
//	}
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/adminMain";
	}
}
