package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.mybatis.mapper.heartMapper;

@Service
public class heartServicelmpl implements heartService {
	private heartMapper dao;

	@Autowired
	public heartServicelmpl(heartMapper dao) {
		this.dao = dao;
	}

	@Override
	public void addHeart(int boardNum, String userId) {
		dao.addHeart(boardNum, userId);
	}

	@Override
	public void removeHeart(int boardNum, String userId) {
		dao.removeHeart(boardNum, userId);
	}

}