package com.itda.ITDA.mybatis.mapper;

import com.itda.ITDA.domain.UserCategory;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserCategoryMapper {
    void save(UserCategory userCategory);
    // Other necessary methods can be added
}