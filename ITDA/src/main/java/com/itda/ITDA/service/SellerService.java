package com.itda.ITDA.service;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;

public interface SellerService {

	boolean isSeller(String userId);

	void saveSeller(Itda_User itda_User);
}
