package com.itda.ITDA.service;

import java.util.List;

import com.itda.ITDA.domain.SubProduct;

public interface OrderService {

	List<SubProduct> subProductList();

	SubProduct productInfo(SubProduct product);

}
