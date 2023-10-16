package com.itda.ITDA.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value= "/product")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	public OrderController() {
		
	}
	
	@GetMapping(value="/subscriptions")
	public String product_subscription(){
		return "product/product_subscriptions";
		
	}
	
	@GetMapping(value="/subscriptions/info")
	public String product_info(){
		return "product/product_subscriptions_info";
		
	}
		
	
	@GetMapping(value="/subscriptions/info/order")
	public String product_order(){
		return "product/product_subscriptions_info_order";
		
	}
	
		

}
