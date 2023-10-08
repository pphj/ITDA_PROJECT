package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.domain.Itda_User;
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
	public void register(Itda_User mem, String[] selectedCategories) {
		for (String category : selectedCategories) {
			UserCategory userCaetgory = new UserCategory();
			userCaetgory.setUserId(mem.getUserId());
			userCaetgory.setCate_Id(Integer.parseInt(category));

			save(userCaetgory); // 데이터베이스에 저장하기 위해 save 메서드 호출
		}

	}

	@Override
	public void save(UserCategory userCategory) {
		// TODO Auto-generated method stub
		
	}

	

}
