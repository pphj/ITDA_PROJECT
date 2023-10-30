package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.mybatis.mapper.NaverMapper;


@Service
public class NaverService {

    private final NaverMapper dao;

    @Autowired
    public NaverService(NaverMapper dao) {
        this.dao = dao;
    }

    public boolean saveNaverUserInfo(NaverDTO dto) {
        return dao.saveNaverUserInfo(dto);
    }
}