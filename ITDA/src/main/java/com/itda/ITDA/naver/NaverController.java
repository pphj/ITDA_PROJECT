package com.itda.ITDA.naver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.service.NaverService;

@Controller
@RequestMapping(value = "/member")
public class NaverController {
	private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

	private final NaverService naverService;

	public NaverController(NaverService naverService) {
		this.naverService = naverService;
	}

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String naver_login() {

		return "/include/callback"; // "/" 대신에 메인 페이지의 실제 URL을 사용하려면 이 부분을 수정하세요.
	}

	@RequestMapping(value = "/saveNaverUserInfo", method = RequestMethod.GET)
	public String saveNaverUserInfo(@RequestParam String email, @RequestParam String nickname,
			@RequestParam String name, @RequestParam String age, @RequestParam String gender) {

		NaverDTO naver = new NaverDTO();
		naver.setEmail(email);
		naver.setNickname(nickname);
		naver.setName(name);
		naver.setAge(age);
		naver.setGender(gender);

		boolean success = naverService.saveNaverUserInfo(naver);

		if (success) {
			// 성공 메시지를 콘솔에 출력
			System.out.println("성공했나? : " + success);
			// 원하는 경로로 리디렉션
			return "redirect:/";
		} else {
			return "/main/protomain";
		}
	}

}
