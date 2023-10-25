package com.itda.ITDA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itda.ITDA.mybatis.mapper.TagMapper;

@Service
public class TagServicelmpl implements TagService {

	private TagMapper dao;

	@Autowired
	public TagServicelmpl(TagMapper dao) {
		this.dao = dao;
	}

	@Override
	public int tagInsert(Map<String, Object> parameters) {
		return dao.tagInsert(parameters);
	}

	@Override
	public int tagUpdate(Map<String, Object> parameters) {
		return dao.tagUpdate(parameters);
	}

	@Override
	public List<Integer> findTagIdByTagName(String tags) {
		return dao.findTagIdByTagName(tags);
	}

	@Override
	public void deleteByBoardNum(int boardNum) {
		dao.deleteByBoardNum(boardNum);
	}

	@Override
	public void tagDelete(List<String> tagIdlist) {
		for (String tagid : tagIdlist)
		{
			dao.tagDelete(tagid);
		}

	}

	@Override
	public void deleteTagsByBoardNum(int boardnum) {
		dao.deleteTagsByBoardNum(boardnum);

	}

}
