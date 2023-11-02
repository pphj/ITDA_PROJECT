package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.Paycall;
import com.itda.ITDA.domain.Payment;
import com.itda.ITDA.domain.RefundUser;
import com.itda.ITDA.domain.SubProduct;

@Mapper
public interface OrderMapper {

	List<SubProduct> subProductList();

	SubProduct productInfo(SubProduct product);

	int insertPayCall(Paycall payCall);

	String getOrderNo(String id);

	int insertPayment(Payment payment);

	Payment paymentCompletUser(String id);

	RefundUser isPayRefundOrder(RefundUser refundUser);

	int updatePayRefundUser(RefundUser refundUser);

	int updateEndDateIsNull(RefundUser refundUser);

	int updatePayedStatusIsR(RefundUser refundUser);

	Paycall isOrderNo(Paycall payCall);

}
