package com.itda.ITDA.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TagMapper {

	// TagService tagInsert(String tag, int chnum);

	// int tagInsert(Tag tag);

	// int tagInsert(Tag tag, int contentNum);

	int tagInsert(Map<String, Object> parameters);

	int tagUpdate(Map<String, Object> parameters);

	List<Integer> findTagIdByTagName(String tags);

	void deleteByBoardNum(int boardNum);

	void tagDelete(String tagid);

	void deleteTagsByBoardNum(int boardnum);
	
}
