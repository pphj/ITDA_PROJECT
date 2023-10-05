package com.itda.ITDA.controller;

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
	        @Param("userId") String userId) {

	    // "mond4" 값을 userId로 설정
	    userId = "mond4";

	    Itda_User user = itdaUserService.getUserById(userId);
	    logger.info("userId = " + user.getUserId());

	    model.addAttribute("user", user);
		
		
		return "mypage/userinfo/myinfopage";
	}
	
	// 비밀번호 찾기 페이지
	@GetMapping(value="/myInfo/viewChangePasswd")
	public String viewChangePasswd() {
		return "mypage/userinfo/viewChangePasswd";
	}
			

}
