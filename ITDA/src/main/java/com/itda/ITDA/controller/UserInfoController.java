package com.itda.ITDA.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.util.Contstants;

@Controller
@RequestMapping(value="/user")
public class UserInfoController {
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	private Itda_UserService itdaUserService;
	
	@Autowired
	public UserInfoController(Itda_UserService itdaUserService) {
		this.itdaUserService = itdaUserService;
	}

	
	// 마이페이지 나의 정보 자세히 보기
	@GetMapping(value="/myInfo")
	public String getMyInfo(Model model,
			HttpSession session, Principal principal) {
		
		String id = principal.getName();
		logger.info("id : " + principal.getName());
		
		
		int result = itdaUserService.isId(id);
	    
		logger.info("결과 : " + result);
		
	    if(result == Contstants.CONNECT_SUCCESS) {
	    	
	    	Itda_User vo = itdaUserService.read(id);
	    	model.addAttribute("user", vo);
	    	session.setAttribute("userName", vo.getUserName());
	    	
	    	return "mypage/userinfo/myinfopage";
	    	
	    } else {
	    	logger.info("페이지 연결 에러");
	    	return "redirect:/";
	    }
		
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping(value="/myInfo/viewChangePasswd")
	public String viewChangePasswd() {
		return "mypage/userinfo/viewChangePasswd";
	}
			

}
