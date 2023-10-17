package com.itda.ITDA.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pay")
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@GetMapping("/approval_url")
	public String kakao() {
		return "redirect:/my/subscriptions";
	}
	

	@GetMapping("/kakaoPay.do")
	@ResponseBody
	public String kakaopay() {
		try {

			String kakaoUrl = "https://kapi.kakao.com/v1/payment/ready";
			String approvalUrl = "https://localhost9400/pay/result";
			String failUrl = "https://localhost9400/pay/fail";
			String cancelUrl = "https://localhost9400/pay/cancel";
			
			URL url = new URL(kakaoUrl);			//주소
			HttpURLConnection server = (HttpURLConnection) url.openConnection(); 	//서버연결
			server.setRequestMethod("POST");										//처리방식
			server.setRequestProperty("Authorization", "KakaoAK${ab9709a083b3a085972288a24ef76a19}");
			server.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			server.setDoOutput(true);

			String payParam = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id"
					+ "&item_name=무제한 구독권&quantity=1&total_amount=1&tax_free_amount=0"
					+ "&approval_url=" + approvalUrl
					+ "&fail_url=" + failUrl
					+ "&cancel_url=" + cancelUrl;
			logger.info("결제 파라미터 값 : " + payParam);
			
			OutputStream op = server.getOutputStream();			//전달자
			try (DataOutputStream dop = new DataOutputStream(op)) {	//데이터 전달자
				dop.writeBytes(payParam);							//데이터 파라미터를 bytes로 형변환
			}
			
			int result = server.getResponseCode();				//결과값
			
			if (result == 200) {								//정상 처리시 200 응답
				InputStream ip = server.getInputStream();
				
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(ip))) {
					StringBuilder builder = new StringBuilder();
					String Line;
					while ((Line = reader.readLine()) != null) {
						builder.append(Line);
					}
					return builder.toString();
					
				}
			
			} else {
				logger.info("에러 발생" + result);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "Fail";
	}
	
	@RequestMapping(value="/result")
	public ModelAndView payResult(ModelAndView mv) {
		
		mv.setViewName("product/product_subscriptions_result");
		return mv;
	}
	
	@RequestMapping(value="/fail")
	public ModelAndView payFail(ModelAndView mv) {
		
		mv.setViewName("product/product_subscriptions_fail");
		return mv;
	}
	
	@RequestMapping(value="/cancel")
	public ModelAndView payCancel(ModelAndView mv) {
		
		mv.setViewName("product/product_subscriptions_result");
		return mv;
	}
}