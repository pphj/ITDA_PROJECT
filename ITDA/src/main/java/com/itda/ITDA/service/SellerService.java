package com.itda.ITDA.service;

import com.itda.ITDA.domain.Seller;

public interface SellerService {

	boolean isSeller(String userId);

	void saveOrUpdateSeller(Seller seller);
}
