package com.itda.ITDA.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.SubProduct;

@Mapper
public interface OrderMapper {

	List<SubProduct> subProductList();

	SubProduct productInfo(SubProduct product);

}
