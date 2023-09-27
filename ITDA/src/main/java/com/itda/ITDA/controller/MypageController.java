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
	
	@GetMapping(value="/subscriptions")
	public String subsctiptions() {
		return "mypage/subscriptions";
	}
	
	/*
	 * @GetMapping(value = "/channelmain") public String Detail() { return
	 * ("channel/ChannelMain"); }
	 */
	
	@GetMapping(value="/subscriptions/contents")
	public String subscriptions_contents() {
		return"mypage/subscriptions_contents";
	}
	
	@GetMapping(value="/coupons")
	public String coupons() {
		return"mypage/coupons";
	}
	
	@GetMapping(value="/notification")
	public String notification() {
		return "mypage/notification";
	}
	
	@GetMapping(value="/payment/subscriptions")
	public String payment_subscriptions() {
		return "mypage/payment_subscriptions";
	}
	
	@GetMapping(value="/payment/subscriptions/episode")
	public String payment_subscriptions_episode() {
		return "mypage/payment_subscriptions_episode";
	}
	
	@GetMapping(value="/contents")
	public String contents() {
		return "mypage/contents";
	}

}
