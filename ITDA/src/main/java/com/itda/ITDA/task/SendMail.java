package com.itda.ITDA.task;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.itda.ITDA.domain.MailVO;
import com.itda.ITDA.util.Message;

@Component
public class SendMail {

	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);

	private JavaMailSenderImpl mailSender;

	@Autowired
	public SendMail(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

// 프로젝트 우클릭 -> Properties -> Project Facets -> 자바버전 11로 맞추세요

	public void sendMail(String email, String id) {
		
		MimeMessagePreparator mp = new MimeMessagePreparator() {

			/*
			 * MimeMessage : 이 클래스는 MIME 스타일 이메일 세시지를 나타냅니다. MIMF(영어 : Multipurpose Internet
			 * Mail Extensions)는 전자 우편을 위한 인터넷 표준 포맷입니다.
			 */

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				/*
				 * MimeMessageHelper를 이용하면 첨부 파일이나 특수 문자 인코딩으로 작업할 때 전달된 MimeMessage를 채우는데
				 * 편리합니다.
				 */
				// 두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("k_minchoi@naver.com");
				helper.setTo(email);
				helper.setSubject("아이디 찾기");
				
				// 1. 문자로만 전송하는 경우
				// 두 번째 인자는 html을 사용하겠다는 뜻입니다.
				// helper.setText(vo.getContent(), true);

				// 2. 이미지를 내장해서 보내는 경우
				// cid(content id)
				String content = "요청하신 아이디는 " + id;
				helper.setText(content, true);

//				FileSystemResource file = new FileSystemResource(new File(sendfile));
				// addInline 메서드의 첫 번째 매개변수에는 cid(content id)를 지정합니다.
//				helper.addInline("Home", file);

				// 3. 파일을 첨부해서 보내는 경우
				// 첫 번째 인자 : 첨부될 파일의 이름입니다.
				// 두 번째 인자 : 첨부파일
//				helper.addAttachment("딸기.jpg", file);
			}
		}; // new MimeMessagePreParator() end

		mailSender.send(mp); // 메일 전송합니다.
		logger.info("메일 전송했습니다.");
	} // sendMail(MailVO vo)

	public boolean emailAuthentication(String email, String authCode, MailVO vo) {
		try {
			MimeMessagePreparator mp = new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					helper.setFrom(vo.getFrom());
					helper.setTo(email);
					helper.setSubject(Message.EMAIL_AUTHENTICATION_MESSAGE_TITLE);

					// 1. 문자로만 전송하는 경우
					// 두 번째 인자는 html을 사용하겠다는 뜻입니다.
					// helper.setText(vo.getContent(), true);

					// 2. 이미지를 내장해서 보내는 경우
					// cid(content id)
					String content = Message.EMAIL_AUTHENTICATION_MESSAGE_CONTENT + authCode;
					helper.setText(content, true);
				};

			};
			mailSender.send(mp); // 메일 전송합니다.
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


} // class SendMail
