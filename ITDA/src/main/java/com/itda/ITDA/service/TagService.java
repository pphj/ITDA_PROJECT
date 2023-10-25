package com.itda.ITDA.service;

import java.util.List;
import java.util.Map;

public interface TagService {

	// int tagInsert(Tag tag);

	// int tagInsert(Tag tag, int contentNum);

	int tagInsert(Map<String, Object> parameters);

	int tagUpdate(Map<String, Object> parameters);

	List<Integer> findTagIdByTagName(String tags);

	void deleteByBoardNum(int boardNum);

	void tagDelete(List<String> tagIdlist);

	void deleteTagsByBoardNum(int boardnum);

}
