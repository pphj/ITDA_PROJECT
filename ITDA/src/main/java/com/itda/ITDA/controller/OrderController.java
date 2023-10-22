package com.itda.ITDA.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.service.OrderService;
import com.itda.ITDA.util.Message;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value= "/product")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private OrderService orderService;

	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@GetMapping(value="/subscriptions")
	public String product_subscription(Model model){
		
		List<SubProduct> subProductList = orderService.subProductList();
		
		model.addAttribute("subProductList", subProductList);
		
		if(subProductList != null) {
			
			logger.info(Message.SUCCESS);
			
			return "product/product_subscriptions";
		}else {
			
			logger.info(Message.ERROR);
			return "redirect:/";
		}
		
	}
	
	@GetMapping(value = "/subscriptions/info")
	public String product_info(SubProduct product, Model model) {

		product.setProductId(product.getProductId());

		logger.info("product.getProductId() : " + product.getProductId());

		String productId = String.valueOf(product.getProductId());

		if (productId != null && productId != "0") {

			product = orderService.productInfo(product);
			model.addAttribute("productInfo", product);
			logger.info(Message.SUCCESS);
			
			return "product/product_subscriptions_info";
		} else {
			logger.info(Message.ERROR);

			return "product/product_subscriptions";
		}

	}
		
	@GetMapping(value = "/subscriptions/info/order")
	public String product_order(Principal principal, 
								SubProduct product,
								Model model) {
		
		String id = principal.getName();
		
		if(id == null) {
			
			logger.info("로그인이 필요한 접속자");
			
			return "redirect:/";
		}
		product.setProductId(product.getProductId());
		product = orderService.productInfo(product);
		model.addAttribute("productInfo", product);
		
		

		return "product/product_subscriptions_info_order";

	}	
		
	@GetMapping("/subscriptions/info/order/kakaoPay.do")
	@ResponseBody
	public String kakaopay(Principal principal, SubProduct product) {		//결제 준비 컨트롤러
		try {
			String Authorization = "ab9709a083b3a085972288a24ef76a19";
			String kakaoUrl = "https://kapi.kakao.com/v1/payment/ready";
			String approvalUrl = "http://localhost:9400/itda/product/approval";
			String failUrl = "http://localhost:9400/itda/product/fail";
			String cancelUrl = "http://localhost:9400/itda/product/cancel";
			
			URL url = new URL(kakaoUrl);			//주소
			HttpURLConnection server = (HttpURLConnection) url.openConnection(); 	//서버연결
			server.setRequestMethod("POST");										//처리방식
			server.setRequestProperty("Authorization", "KakaoAK " + Authorization);
			server.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			server.setDoOutput(true);		//서버에 전달을 위해 true
			
			MultiValueMap<String, String> payParams = new LinkedMultiValueMap<String, String>();
			
			payParams.add(cancelUrl, approvalUrl)
			String payParam = "cid=TC0ONETIME"
					+ "&partner_order_id="
					+ "&partner_user_id=USER"
					+ "&item_name=무제한 구독권"
					+ "&quantity=1"
					+ "&total_amount=10"
					+ "&tax_free_amount=0"
					+ "&approval_url=" + approvalUrl
					+ "&fail_url=" + failUrl
					+ "&cancel_url=" + cancelUrl;
			
			OutputStream op = server.getOutputStream();			//전달자
			try (DataOutputStream dop = new DataOutputStream(op)) {	//데이터 전달자
				dop.writeBytes(payParam);							//데이터 파라미터를 bytes로 형변환
			}
			
			int result = server.getResponseCode();				//결과값
			logger.info("result의 값 : " + result);
			
			if (result == 200) {								//정상 처리시 200 응답
				InputStream ip = server.getInputStream();
				logger.info("InputStream의 값 : " + ip);
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(ip))) {
					StringBuilder builder = new StringBuilder();
					String Line;
					while ((Line = reader.readLine()) != null) {
						builder.append(Line);
					}
					return builder.toString();
					
				}
			
			} else {
				logger.info("에러 발생 : " + result);
			}
		} catch (Exception e) {
			logger.error("오류 발생 : " + e.getMessage(), e);
			e.printStackTrace();
		}
		return "fail";
	}
	
	
	@RequestMapping(value="/approval")		//결제 요청 컨트롤러
	public String payApproval(@RequestParam(value="pg_token") String pg_token) {
		try {
			String kakaoUrl = "https://kapi.kakao.com/v1/payment/approve";
			
			URL url = new URL(kakaoUrl);			//주소
			HttpURLConnection server = (HttpURLConnection) url.openConnection(); 	//서버연결
			server.setRequestMethod("POST");										//처리방식
			server.setRequestProperty("Authorization", "KakaoAK ab9709a083b3a085972288a24ef76a19");
			server.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			server.setDoOutput(true);		//서버에 전달을 위해 true
			
			String payParam = "cid=TC0ONETIME"
					+ "&tid=T1234567890123456789"
					+ "&partner_order_id=ITDA"
					+ "&partner_user_id=USER"
					+ "&pg_token=" + pg_token;
			logger.info("결제 승인 파라미터 값 : " + payParam);
			
			OutputStream op = server.getOutputStream();			//전달자
			try (DataOutputStream dop = new DataOutputStream(op)) {	//데이터 전달자
				dop.writeBytes(payParam);							//데이터 파라미터를 bytes로 형변환
			}
			
			int result = server.getResponseCode();				//결과값
			logger.info("result의 값 : " + result);
			if (result == 200) {								//정상 처리시 200 응답
				InputStream ip = server.getInputStream();
				logger.info("InputStream의 값 : " + ip);
				try (BufferedReader reader = new BufferedReader(new InputStreamReader(ip))) {
					StringBuilder builder = new StringBuilder();
					String Line;
					while ((Line = reader.readLine()) != null) {
						builder.append(Line);
					}
					
					return builder.toString();
					
				}
			
			} else {
				logger.info("에러 발생 : " + result);
			}
		} catch (Exception e) {
			logger.error("오류 발생 : " + e.getMessage(), e);
			e.printStackTrace();
		}
		
		return null;
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
