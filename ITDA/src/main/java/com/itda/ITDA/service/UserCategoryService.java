package com.itda.ITDA.service;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.UserCategory;

public interface UserCategoryService {

	void register(Itda_User mem, String[] selectedCategories);

	void save(UserCategory userCategory);

	// findById(), delete(), update() 등 추가 메서드를 선언할 수 있습니다.
}
