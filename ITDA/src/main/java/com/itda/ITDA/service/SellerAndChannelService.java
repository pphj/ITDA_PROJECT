package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Seller;

@Service
public class SellerAndChannelService {
    @Autowired
    private SellerService sellerService;
    @Autowired
    private ChannelList_Service channelList_Service;

    @Transactional
    public void saveSellerAndChannel(Seller seller, ChannelList channelList) {
        sellerService.saveOrUpdateSeller(seller);
        channelList_Service.saveChannelList(channelList);
    }
}

