package com.itda.ITDA.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.itda.ITDA.domain.Amount;
import com.itda.ITDA.domain.CouponIssue;
import com.itda.ITDA.domain.GoodUser;
import com.itda.ITDA.domain.KakaoCancelResponse;
import com.itda.ITDA.domain.KakaoPayApproval;
import com.itda.ITDA.domain.Paycall;
import com.itda.ITDA.domain.Payment;
import com.itda.ITDA.domain.ReadyResponse;
import com.itda.ITDA.domain.RefundUser;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.service.CouponService;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.service.OrderService;
import com.itda.ITDA.util.Constants;
import com.itda.ITDA.util.Message;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@SessionAttributes({"tid"}) 
@RequestMapping(value= "/product")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	private OrderService orderService;
	private Itda_UserService itdaUserService;
	private CouponService couponService;

	@Autowired
	public OrderController(OrderService orderService, Itda_UserService itdaUserService,
			CouponService couponService) {
		this.orderService = orderService;
		this.itdaUserService = itdaUserService;
		this.couponService = couponService;

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
	public String product_info(SubProduct product, 
								Model model) {

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
								Model model,
								CouponIssue couponIssue) {
		
		String id = principal.getName();
		
		
		List<CouponIssue> myCouponList = couponService.myCouponList(id);
		model.addAttribute("couponList", myCouponList);
		
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
										@RequestParam("item_name") String item_name,
										@RequestParam("discount") String discountPrice,
										@RequestParam("couponCode") String couponCode
										) { // 결제 준비 컨트롤러

		String id = principal.getName();
		payCall.setUserId(id);
		payCall.setCouponCode(couponCode);
		payCall.setCallPrice(totalAmount);
		payCall.setProductId(payCall.getProductId());
		payCall.setCallDiscount(Integer.parseInt(discountPrice));

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
		logger.info("할인가격:" + discountPrice);
		// 카카오 결제 준비하기 - 결제요청 service 실행.
		
		String getOrderNo = orderService.getOrderNo(id);
		
		logger.info("getOrderNo : " + getOrderNo);
		
		ReadyResponse readyResponse = orderService.payReady(totalAmount, item_name, getOrderNo);
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		logger.info("결제고유 번호: " + readyResponse.getTid());
		// Order정보를 모델에 저장
		//model.addAttribute("payCall", payCall);

		return readyResponse;
	}
	
	@GetMapping(value="/approval")
	public String payCompleted(@RequestParam("pg_token") String pgToken, 
								@ModelAttribute("tid") String tid, 
								Payment payment,
								Model model,
								Principal principal,
								GoodUser goodUser) throws Exception {
		
		logger.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		logger.info("결제고유 번호: " + tid);
		String id = principal.getName();
		
		// 카카오 결제 요청하기
		KakaoPayApproval approveResponse = orderService.payApprove(tid, pgToken);
		
		String item_code = approveResponse.getItem_code();
		
		Paycall payCall = new Paycall();
		
		payCall.setCallNum(Integer.parseInt(item_code));
		payCall = orderService.isOrderNo(payCall);
		
		if(payCall.getCallNum() == (Integer.parseInt(approveResponse.getItem_code()))) {
			logger.info("getOrderNo & getItem_code() = " + payCall.getCallNum() + "&&" + approveResponse.getItem_code() );
		}

		if (pgToken != null && tid != null) {
			// 5. payment 저장
			// orderNo, payMathod, 주문명.
			// - 카카오 페이로 넘겨받은 결재정보값을 저장.
			// payment.setOrderNum(Integer.parseInt(approveResponse.getItem_code()));
			
			int nine = 9;
			LocalDateTime minusNine = approveResponse.getCreated_at().toLocalDateTime().minusHours(nine);
			LocalDateTime minusNine2 = approveResponse.getApproved_at().toLocalDateTime().minusHours(nine);
			Timestamp userGetCreated_at = Timestamp.valueOf(minusNine);
			Timestamp userGetApproved_at = Timestamp.valueOf(minusNine2);
			
			Amount amount = approveResponse.getAmount();

			payment.setPayedMethod(approveResponse.getPayment_method_type()); // 결제 수단
			payment.setOrderNum(Integer.parseInt(approveResponse.getItem_code())); // 주문 번호
			payment.setPayedDate(userGetCreated_at); // 결제 시간
			payment.setPayedPrice(amount.getTotal()); // 총 금액
			payment.setPayedVat(amount.getVat()); // 부가세
			payment.setDiscountPrice(payCall.getCallDiscount()); // 할인금액
			payment.setPayedCode(tid); // 결제 코드
			payment.setUserId(id);
			payment.setPayedOkDate(userGetApproved_at); // 결제 완료 시간
			
			if(payCall.getCouponCode() != null || payCall.getCouponCode().equals("0")){
				String cpUse = "Y";
				CouponIssue couponIssue = new CouponIssue();
				couponIssue.setCouponCode(payCall.getCouponCode());
				couponIssue.setCpUse(cpUse);
				couponIssue.setUserId(id);
				couponIssue.setCouponUseDate(approveResponse.getCreated_at());
				int result = couponService.updateCouponUse(couponIssue);
			}

			int insert = orderService.insertPayment(payment);

			if (insert == Constants.INSERT_SUCCESS) {
				logger.info(Message.INSERT_SUCCESS);

				logger.info("principal.getName() : " + id);
				if (id != null) {

					Payment completUser = orderService.paymentCompletUser(id);

					// GoodUser goodUser = new GoodUser();
					GoodUser isGoodUser = itdaUserService.isGoodUser(id);

					Timestamp realTime = new Timestamp(System.currentTimeMillis());
					
					logger.info("completUser.getUserId() : " + completUser.getUserId());
					logger.info("현재시간=============== : " + realTime.getTime());
					try {
						// 처음 결제하는 유저일 경우
						if (completUser.getUserId() != null && isGoodUser == null) {
							logger.info("==================처음 결제하는 유저 ================== : " );

							goodUser.setPayedNum(completUser.getPayedNum());
							goodUser.setFirstDate(completUser.getPayedOkDate());
							goodUser.setStartDate(completUser.getPayedOkDate());
							goodUser.setUserId(completUser.getUserId());
							goodUser.setProductTerm(completUser.getProductTerm());
							goodUser.setEndDate(completUser.getPayedOkDate());
							
							logger.info("goodUser.setPayedNum : " + goodUser.getPayedNum());

							logger.info("goodUser.getEndDate() = " + goodUser.getEndDate());
							logger.info("completUser.getPayedOkDate()) = " + completUser.getPayedOkDate());
							logger.info("goodUser.getFirstDate() = " + goodUser.getFirstDate());

							int result = itdaUserService.insertFirstPaymentUser(goodUser);
							if(result == Constants.INSERT_SUCCESS) {
								logger.info(Message.INSERT_SUCCESS);
							}
							// 유료 회원인데, 현재 날짜보다 구독 만료일이 클 경우
						} else if (isGoodUser.getUserId() != null && isGoodUser.getEndDate() != null && isGoodUser.getEndDate().getTime() >= realTime.getTime()) {
							
							logger.info("===================유료 회원인데, 현재 날짜보다 구독 만료일이 클 경우 ================== : " );
							
							goodUser.setPayedNum(completUser.getPayedNum());
							goodUser.setFirstDate(completUser.getFirstDate());
							goodUser.setStartDate(completUser.getPayedOkDate());
							goodUser.setUserId(completUser.getUserId());
							goodUser.setProductTerm(completUser.getProductTerm());
							goodUser.setEndDate(isGoodUser.getEndDate());

							logger.info("goodUser.getEndDate() = " + goodUser.getEndDate());

							 int result = itdaUserService.updatePaymentUser(goodUser);
							 if(result == Constants.UPDATE_SUCCESS) {
								 logger.info(Message.PAYMENT_USER_UPDATE_SUCCESS);
							 }

						}else {
							logger.info("===============그 외의 결제유저 ================== : " );
							
							goodUser.setPayedNum(completUser.getPayedNum());
							goodUser.setFirstDate(isGoodUser.getFirstDate());
							goodUser.setStartDate(completUser.getPayedOkDate());
							goodUser.setUserId(completUser.getUserId());
							goodUser.setProductTerm(completUser.getProductTerm());
							goodUser.setEndDate(completUser.getPayedOkDate());
							
							 int result = itdaUserService.updateResetPaymentUser(goodUser);
							 if(result == Constants.UPDATE_SUCCESS) {
								 logger.info(Message.PAYMENT_RESET_USER_UPDATE_SUCCESS);
								 
							 }
						}
					} catch (Exception e) {
						e.printStackTrace();
						logger.info(Message.INSERT_FALL);
					}
				}
			}

		}

		// logger.info(order);
		logger.info("payment.getPayedCode" + payment.getPayedCode());
		logger.info("payment.setPayedMethod" + payment.getPayedMethod());
		logger.info("payment.setOrderNum" + payment.getOrderNum());


		return "redirect:/my/subscriptions";
	}	

	@RequestMapping(value="/fail")
	public String payFail(HttpServletRequest request) {
		
		logger.info(Message.PAYMENT_FAIL);
		request.setAttribute("msg", Message.PAYMENT_FAIL);
		
		return "product/payment_fail";
	}
	
	@RequestMapping(value="/cancel")
	public String payCancel(HttpServletRequest request) {

		logger.info(Message.PAYMENT_CANCLE);
		request.setAttribute("msg", Message.PAYMENT_CANCLE);
		
		return "product/payment_cancle";
	}
	
	@RequestMapping(value="/subscriptions/info/refund")
	public String payRefund(Principal principal,
							RefundUser refundUser,
							HttpServletRequest request,
							@RequestParam("couponCode") String couponCode) {
		
		String id = principal.getName();
		
		refundUser.setUserId(id);
		refundUser.setPayedNum(refundUser.getPayedNum());
		refundUser.setPayedPrice(refundUser.getPayedPrice());
		refundUser.setProductTerm(refundUser.getProductTerm());
		
		// 기존 유저가 쿠폰 사용자인지 확인되면 쿠폰 사용여부 업데이트
		CouponIssue cpIssue = new CouponIssue();
		cpIssue.setCouponCode(couponCode);
		if(cpIssue.getCouponCode()!=null || Integer.parseInt(cpIssue.getCouponCode()) != 0) {
			String cpUse = "N";
			cpIssue.setCpUse(cpUse);
			cpIssue.setUserId(id);
			cpIssue.setCouponUseDate(null);
			int result = couponService.updateCouponUse(cpIssue);
		}
		
		RefundUser refundOrder = orderService.isPayRefundOrder(refundUser);
		GoodUser goodUser = itdaUserService.isGoodUser(id);
		logger.info("payment.setPayedNum : " + refundUser.getPayedNum());
		logger.info("refundUser.getProductTerm()========= : " + refundUser.getProductTerm());
       
		KakaoCancelResponse kakaoCancelResponse = orderService.kakaoCancel(refundOrder);
		
		// 결제 환불하는 유저의 유료회원 테이블 업데이트
		Timestamp nowTime = new Timestamp(System.currentTimeMillis());
		
		int productTermInDays = refundUser.getProductTerm();
		
		LocalDateTime plusDays = goodUser.getStartDate().toLocalDateTime().plusDays(productTermInDays);
		LocalDateTime minusDays = goodUser.getEndDate().toLocalDateTime().minusDays(productTermInDays);
		Timestamp productPeriodUse = Timestamp.valueOf(plusDays);
		Timestamp userExpirationDate = Timestamp.valueOf(minusDays);
		
		
		logger.info("nowTime ====== " + nowTime);
		logger.info("productPeriodUse ====== " + productPeriodUse);
		logger.info("userExpirationDate ====== " + userExpirationDate);
		// endDate - productTerm > 오늘 날짜인 경우
		if(userExpirationDate.after(nowTime)) {
			refundUser.setEndDate(userExpirationDate);
			
			int result = orderService.updatePayRefundUser(refundUser);
			int result2 = orderService.updatePayedStatusIsR(refundUser);
			if(result > 0 && result2 > 0) {
				logger.info(Message.REFUND_EXISTING_USER_UPDATE_SUCCESS);
				request.setAttribute("msg", Message.PAYMENT_CANCLE);
			}
		// endDate - productTerm < startDate인 경우
		}else{
			refundUser.setEndDate(userExpirationDate);
			int result = orderService.updatePayRefundUser(refundUser);
			int result2 = orderService.updatePayedStatusIsR(refundUser);
			
			if(result > 0 && result2 > 0) {
				logger.info(Message.REFUND_NEW_USER_UPDATE_SUCCESS);
				request.setAttribute("msg", Message.PAYMENT_CANCLE);
				request.setAttribute("msg", Message.PAYMENT_CANCLE);
			}
		}
		
		return "redirect:/product/cancel";
    }
}
