package com.itda.ITDA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.mybatis.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
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
	

}
