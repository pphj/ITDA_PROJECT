package com.itda.ITDA.util;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import com.itda.ITDA.domain.MailVO;
import com.itda.ITDA.task.SendMail;

public class Util {

	private static final Logger logger = LoggerFactory.getLogger(Util.class);

	private SendMail sendMail;

	@Autowired
	public Util(SendMail sendMail) {
		this.sendMail = sendMail;
	}

	// 6자리 인증코드(난수) 생성 메서드
	private String generateAuthCode() {
		Random random = new Random();
		int range = (int) Math.pow(10, 6); // 10의 6승
		int trim = (int) Math.pow(10, 5); // 10의 5승
		int result = random.nextInt(range) + trim;

		if (result > range) {
			result -= trim;
		}
		logger.info(Integer.toString(result));
		return Integer.toString(result);
	}

	public String emailsend(@RequestParam("email") String email, HttpSession session, MailVO vo) {
		// 난수(인증번호) 생성 (예: 6자리 난수)
		String authCode = generateAuthCode();

		// 세션에 인증번호 저장 (나중에 검증할 때 사용)
		session.setAttribute("authCode", authCode);

		try {
			sendMail.emailAuthentication(email, authCode, vo);
		} catch (Exception e) {
			logger.error("메일 전송 실패", e);
		}

		return authCode;
	}

}
