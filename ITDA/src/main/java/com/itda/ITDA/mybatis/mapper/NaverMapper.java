
package com.itda.ITDA.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.NaverDTO;

@Mapper
public interface NaverMapper {

boolean saveNaverUserInfo(NaverDTO dto);

void setuserPw(String encPassword);

NaverDTO isId(String username);

}