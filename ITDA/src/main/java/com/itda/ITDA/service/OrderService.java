package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.KakaoCancelResponse;
import com.itda.ITDA.domain.KakaoPayApproval;
import com.itda.ITDA.domain.Paycall;
import com.itda.ITDA.domain.Payment;
import com.itda.ITDA.domain.ReadyResponse;
import com.itda.ITDA.domain.RefundUser;
import com.itda.ITDA.domain.SubProduct;

public interface OrderService {

	List<SubProduct> subProductList();

	SubProduct productInfo(SubProduct product);

	ReadyResponse payReady(int totalAmount, String string, String getOrderNo);

	int insertPayCall(Paycall payCall);

	KakaoPayApproval payApprove(String tid, String pgToken);

	String getOrderNo(String id);

	int insertPayment(Payment payment);

	Payment paymentCompletUser(String id);

	KakaoCancelResponse kakaoCancel(RefundUser refundOrder);

	RefundUser isPayRefundOrder(RefundUser refundUser);

	int updatePayRefundUser(RefundUser refundUser);

	int updateEndDateIsNull(RefundUser refundUser);

	int updatePayedStatusIsR(RefundUser refundUser);

	Paycall isOrderNo(Paycall payCall);


}
