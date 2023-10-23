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
		
		int getOrderNo = orderService.getOrderNo(id);
		
		logger.info("getOrderNo : " + getOrderNo);
		
		ReadyResponse readyResponse = orderService.payReady(totalAmount, item_name, getOrderNo);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		
		model.addAttribute("tid", readyResponse.getTid());
		logger.info("결제고유 번호: " + readyResponse.getTid());
		// Order정보를 모델에 저장
		model.addAttribute("payCall", payCall);

		return readyResponse;
	}
	
	@GetMapping(value="/approval")
	public String payCompleted(@RequestParam("pg_token") String pgToken, 
								@ModelAttribute("tid") String tid, 
								@ModelAttribute("getOrderNo") int getOrderNo,
								Payment payment,
								Model model) {
		
		logger.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		//logger.info("주문정보: " + order);		
		logger.info("결제고유 번호: " + tid);
		
		// 카카오 결재 요청하기
		KakaoPayApproval approveResponse = orderService.payApprove(tid, pgToken, getOrderNo);	
		
		// 5. payment 저장
		//	orderNo, payMathod, 주문명.
		// - 카카오 페이로 넘겨받은 결재정보값을 저장.
		//payment.setOrderNum(Integer.parseInt(approveResponse.getItem_code()));
		payment.setPayedMethod(approveResponse.getPayment_method_type()); // 결제 수단
		payment.setOrderNum(getOrderNo); // 주문 번호
		payment.setPayedDate(approveResponse.getCreated_at()); // 결제 시간
		payment.setPayedPrice(approveResponse.getTotal_amount()); // 총 금액
		payment.setPayedVat(approveResponse.getVat_amount()); // 부가세
		payment.setPayedCode(tid); // 결제 코드
		payment.setPayedOkDate(approveResponse.getApproved_at()); // 결제 완료 시간
		
		int insert = orderService.insertPayment(payment);
		
		
		//logger.info(order);
		logger.info("payment.getPayedCode" + payment.getPayedCode());
		logger.info("payment.setPayedMethod" + payment.getPayedMethod());
		logger.info("payment.setOrderNum" + payment.getOrderNum());
		
		//int insert = orderService.InsertPayment(payment);
		logger.info(Message.INSERT_SUCCESS);
		
		return "redirect:/my/subscriptions";
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
