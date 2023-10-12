package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.mybatis.mapper.UserCategoryMapper;

@Service
public class UserCategoryServiceImpl implements UserCategoryService {

	private final UserCategoryMapper userCategoryMapper;

	@Autowired
	public UserCategoryServiceImpl(UserCategoryMapper userCategoryMapper) {
		this.userCategoryMapper = userCategoryMapper;
	}

	@Override
	public int insert(UserCategory userCategrou) {
		return userCategoryMapper.insert(userCategrou);
	}

}
