package com.itda.ITDA.service;

import org.springframework.stereotype.Service;

@Service
public class SellerServicempl implements SellerService {

    @Override
    public boolean isSeller(String userId) {
        return false;
    }
}
