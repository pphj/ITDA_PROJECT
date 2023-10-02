package com.itda.ITDA.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value= "/my")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	//@Autowired
	public MypageController() {
		
	}
	
	// 마이페이지 메인(구독채널의 채널)
	@GetMapping(value="/subscriptions")
	public String subsctiptions() {
		return "mypage/subscriptions";
	}
	
	/*
	 * @GetMapping(value = "/channelmain") 
	 * public String Detail() { 
	 * return ("channel/ChannelMain"); 
	 * }
	 */
	
	// 마이페이지 구독채널의 최신 콘텐츠
	@GetMapping(value="/subscriptions/contents")
	public String subscriptions_contents() {
		return"mypage/subscriptions_contents";
	}
	
	// 마이페이지 쿠폰
	@GetMapping(value="/coupons")
	public String coupons() {
		return"mypage/coupons";
	}
	
	// 마이페이지 설정(구독 설정)
	@GetMapping(value="/notification")
	public String notification() {
		return "mypage/notification";
	}
	
	// 마이페이지 결제 내역
	@GetMapping(value="/payment/subscriptions")
	public String payment_subscriptions() {
		return "mypage/payment_subscriptions";
	}
	
	// 마이페이지 결제 내역 자세히 보기
	@GetMapping(value="/payment/subscriptions/episode")
	public String payment_subscriptions_episode() {
		return "mypage/payment_subscriptions_episode";
	}
	
	// 관심 콘텐츠(좋아요 콘텐츠)
	@GetMapping(value="/contents")
	public String contents() {
		return "mypage/contents";
	}

}
