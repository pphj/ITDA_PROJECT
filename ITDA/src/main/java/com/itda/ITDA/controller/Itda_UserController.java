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

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.MailVO;
import com.itda.ITDA.service.Itda_UserService;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/member")
public class Itda_UserController {
	private static final Logger logger = LoggerFactory.getLogger(Itda_UserController.class);

	private Itda_UserService Itda_UserService;
	private PasswordEncoder passwordEncoder;
	private HttpSession session; // HttpSession 객체 선언

	@Autowired
	public Itda_UserController(Itda_UserService Itda_UserService, PasswordEncoder passwordEncoder, HttpSession session) {
		this.Itda_UserService = Itda_UserService;
		this.passwordEncoder = passwordEncoder;
		this.session = session; // HttpSession 객체 주입
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value = "saveid", required = false) Cookie readCookie,
			HttpSession session, Principal userPrincipal) {

		if (readCookie != null) {
			logger.info("저장된 아이디 : " + userPrincipal.getName()); // 로그인한 아이디값을 로그에 찍어봄
			mv.setViewName("redirect:/main/protomain");
		} else {
			mv.setViewName("/main/protomain");
			mv.addObject("loginfail", session.getAttribute("loginfail")); // loginfail을 mv에 저장해주고
			session.removeAttribute("loginfail"); // 세션값은 삭제한다
		}

		return mv;
	}

	@ResponseBody // @ResponseBody : 각 메소드의 실행 결과를 JSON으로 변환하여 HTTP Response Body에 설정된다
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public int idcheck(@RequestParam("userId") String userId) {
		return Itda_UserService.isId(userId);
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String insert(Itda_User mem, RedirectAttributes ra, Model model, HttpServletRequest request) {
	    String encPassword = passwordEncoder.encode(mem.getUserPw());
	    logger.info(encPassword);
	    mem.setUserPw(encPassword);

	    int result = Itda_UserService.insert(mem);

	    if (result == 1) {
	        // 회원 가입 성공 시 프로필 사진 경로를 세션에 저장
	        session.setAttribute("userProfilePath", mem.getUserProfile());

	        ra.addFlashAttribute("result", "joinSuccess");
	        return "redirect:/";
	    } else {
	        model.addAttribute("url", request.getRequestURI());
	        model.addAttribute("message", "회원 가입 실패");
	        return "/main/protomain";
	    }
	}

	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("userId") String id, @RequestParam("userPw") String password,
	                           HttpSession session, RedirectAttributes rattr) { //session 처리 보안
	    // 아이디와 비밀번호를 사용하여 로그인 처리 로직을 구현합니다.
	    // Itda_UserService.isId() 메소드로 아이디의 존재 여부 및 정보를 확인하고,
	    // 해당 아이디의 사용자가 있다면 비밀번호 일치 여부도 검사합니다.
	    // 성공 시 세션에 사용자 정보를 저장하고, 실패 시 에러 메시지 등을 설정합니다.

		int result = Itda_UserService.isId(id, password);
		logger.info("결과 : " + result);
		logger.info("get parameter : " + id + " " + password);

		if (result == 1) {
			session.setAttribute("id", id);
			return "redirect:/";
		} else {
			rattr.addFlashAttribute("result", result);
			return "/";
		}
	}




	@RequestMapping(value = "FindIdPasswordForm", method = RequestMethod.GET)
	public String findIdPasswordForm() {
		return "member/FindIdPasswordForm";
	}

}
