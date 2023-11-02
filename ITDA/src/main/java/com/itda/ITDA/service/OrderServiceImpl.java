package com.itda.ITDA.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.itda.ITDA.controller.OrderController;
import com.itda.ITDA.domain.KakaoCancelResponse;
import com.itda.ITDA.domain.KakaoPayApproval;
import com.itda.ITDA.domain.Paycall;
import com.itda.ITDA.domain.Payment;
import com.itda.ITDA.domain.ReadyResponse;
import com.itda.ITDA.domain.RefundUser;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.mybatis.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	private OrderMapper dao;
	
	@Autowired
	public OrderServiceImpl(OrderMapper dao) {
		this.dao = dao;
		
	}

	@Override
	public List<SubProduct> subProductList() {
		return dao.subProductList();
	}

	@Override
	public SubProduct productInfo(SubProduct product) {
		return dao.productInfo(product);
	}
	
	@Override
	public String getOrderNo(String id) {
		return dao.getOrderNo(id);
	}
	
	@Override
	public ReadyResponse payReady(int totalAmount, String productName, String getOrderNo) {
		
		String approvalUrl = "http://localhost:9400/itda/product/approval";
		String failUrl = "http://localhost:9400/itda/product/fail";
		String cancelUrl = "http://localhost:9400/itda/product/cancel";
		
		MultiValueMap<String, String> payParams = new LinkedMultiValueMap<String, String>();
		payParams.add("cid", "TC0ONETIME");
		payParams.add("partner_order_id", "1004");
		payParams.add("partner_user_id", "ITDA");
		payParams.add("item_name", productName);
		payParams.add("item_code", getOrderNo);
		payParams.add("quantity", "1");
		payParams.add("total_amount", String.valueOf(totalAmount));
		payParams.add("tax_free_amount", "0");
		payParams.add("approval_url", approvalUrl);
		payParams.add("fail_url", failUrl);
		payParams.add("cancel_url", cancelUrl);
		
		logger.info("item_name : " + productName);
		
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(payParams, this.getHeaders());
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		logger.info("결제준비 응답객체: " + readyResponse);
        // 받아온 값 return
		return readyResponse;
	}
	
    // 결제 승인요청 메서드
	public KakaoPayApproval payApprove(String tid, String pgToken) {
		

		// request값 담기.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", "1004"); // 주문명
		parameters.add("partner_user_id", "ITDA");
		parameters.add("pg_token", pgToken);
		
        // 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
        // 외부url 통신
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
        // 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스. 
		KakaoPayApproval approveResponse = template.postForObject(url, requestEntity, KakaoPayApproval.class);
		logger.info("결제승인 응답객체: " + approveResponse);
		
		return approveResponse;
	}
	
	// header() 셋팅
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK ab9709a083b3a085972288a24ef76a19");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}

	@Override
	public int insertPayCall(Paycall payCall) {
		return dao.insertPayCall(payCall);
	}

	@Override
	public int insertPayment(Payment payment) {
		return dao.insertPayment(payment);
	}

	@Override
	public Payment paymentCompletUser(String id) {
		return dao.paymentCompletUser(id);
	}

	@Override
	public KakaoCancelResponse kakaoCancel(RefundUser refundOrder) {
	       // 카카오페이 요청
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", "TC0ONETIME");
        parameters.add("tid", refundOrder.getPayedCode());
        parameters.add("cancel_amount", String.valueOf(refundOrder.getPayedPrice()));
        parameters.add("cancel_tax_free_amount", "0");
        parameters.add("cancel_vat_amount", String.valueOf(refundOrder.getPayedVat()));

        
        logger.info("payment.getPayedPrice() : " + refundOrder.getPayedPrice());
        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
    
        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();
    
        KakaoCancelResponse cancelResponse = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/cancel",
                requestEntity,
                KakaoCancelResponse.class);
                
        return cancelResponse;
    }

	@Override
	public RefundUser isPayRefundOrder(RefundUser refundUser) {
		return dao.isPayRefundOrder(refundUser);
	}

	@Override
	public int updatePayRefundUser(RefundUser refundUser) {
		return dao.updatePayRefundUser(refundUser);
	}

	@Override
	public int updateEndDateIsNull(RefundUser refundUser) {
		return dao.updateEndDateIsNull(refundUser);
	}

	@Override
	public int updatePayedStatusIsR(RefundUser refundUser) {
		return dao.updatePayedStatusIsR(refundUser);
	}


	@Override
	public Paycall isOrderNo(Paycall payCall) {
		return dao.isOrderNo(payCall);
	}
		




}
