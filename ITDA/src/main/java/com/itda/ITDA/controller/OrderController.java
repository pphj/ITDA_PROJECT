package com.itda.ITDA.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.KakaoPayApproval;
import com.itda.ITDA.domain.Paycall;
import com.itda.ITDA.domain.Payment;
import com.itda.ITDA.domain.ReadyResponse;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.service.OrderService;
import com.itda.ITDA.util.Constants;
import com.itda.ITDA.util.Message;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@SessionAttributes({"tid","order"}) 
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
	public @ResponseBody ReadyResponse payReady(Principal principal, 
										SubProduct product,
										Model model, 
										Paycall payCall,
										@RequestParam("total_amount") int totalAmount,
										@RequestParam("item_name") String item_name) { // 결제 준비 컨트롤러

		String id = principal.getName();
		payCall.setUserId(id);
		payCall.setCallPrice(totalAmount);
		payCall.setProductId(product.getProductId());

		String callPrice = String.valueOf(payCall.getCallPrice());

		if (id != null && callPrice != null) {
			int insertPayCall = orderService.insertPayCall(payCall);

			if (insertPayCall == Constants.INSERT_SUCCESS) {
				logger.info(Message.INSERT_SUCCESS);
			}
		} else {
			logger.info(Message.INSERT_FALL);
		}
		logger.info("주문정보:" + payCall);
		logger.info("주문가격:" + totalAmount);
		// 카카오 결제 준비하기 - 결제요청 service 실행.
		ReadyResponse readyResponse = orderService.payReady(totalAmount, item_name);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		
		model.addAttribute("tid", readyResponse.getTid());
		logger.info("결재고유 번호: " + readyResponse.getTid());
		// Order정보를 모델에 저장
		model.addAttribute("payCall", payCall);

		return readyResponse;
	}
	
	@GetMapping(value="/approval")
	public String payCompleted(@RequestParam("pg_token") String pgToken, 
								@ModelAttribute("tid") String tid, 
								//@ModelAttribute("order") String order,
								Payment payment,
								Model model) {
		
		logger.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		//logger.info("주문정보: " + order);		
		logger.info("결제고유 번호: " + tid);
		
		// 카카오 결재 요청하기
		KakaoPayApproval approveResponse = orderService.payApprove(tid, pgToken);	
		
		// 5. payment 저장
		//	orderNo, payMathod, 주문명.
		// - 카카오 페이로 넘겨받은 결재정보값을 저장.
		payment.setOrderNum(Integer.parseInt(approveResponse.getItem_code()));
		payment.setPayedMethod(approveResponse.getPayment_method_type());
		payment.setPayedCode(tid);
		
		//logger.info(order);
		logger.info("payment.getPayedCode" + payment.getPayedCode());
		logger.info("payment.setPayedMethod" + payment.getPayedMethod());
		logger.info("payment.setOrderNum" + payment.getOrderNum());
		
		
		return "redirect:/subscriptions/info/order";
	}
	
/*		
		String order_id = principal.getName();
		
		
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
			
			product.setProductName(product.getProductName());
			
			String productName = product.getProductName();
			
			
			MultiValueMap<String, String> payParams = new LinkedMultiValueMap<String, String>();
			payParams.add("cid", "TC0ONETIME");
			payParams.add("partner_order_id", order_id);
			payParams.add("partner_user_id", "ITDA");
			payParams.add("item_name", productName);
			payParams.add("quantity", "1");
			payParams.add("total_amount", total_amount);
			payParams.add("tax_free_amount", "0");
			payParams.add("approval_url", approvalUrl);
			payParams.add("fail_url", failUrl);
			payParams.add("cancel_url", cancelUrl);
			
			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(payParams, this.getHeaders());
			RestTemplate template = new RestTemplate();
			
			ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
			log.info("결재준비 응답객체: " + readyResponse);
	        // 받아온 값 return
			return readyResponse;
		}

			
			OutputStream op = server.getOutputStream();			//전달자
			try (DataOutputStream dop = new DataOutputStream(op)) {	//데이터 전달자
				dop.writeBytes(payParams);							//데이터 파라미터를 bytes로 형변환
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
 */
	
	
	/*
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
	*/
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
