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

	public void save(UserCategory userCategory) {
		userCategoryMapper.save(userCategory);
	}

    // 여기에 추가 서비스 메서드를 구현할 수 있습니다.
}
