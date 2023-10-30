package com.itda.ITDA.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.itda.ITDA.controller.ContentController;
import com.itda.ITDA.mybatis.mapper.TagMapper;

@Service
public class TagServicelmpl implements TagService {
	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

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
		try
		{
			dao.deleteTagsByBoardNum(boardnum);
		} catch (EmptyResultDataAccessException e)
		{
			// 'boardnum'에 해당하는 태그가 없을 때 발생하는 예외를 적절히 처리
			// 이 경우, 삭제할 태그가 없으므로 별도의 처리가 필요 없음
			logger.info("No tags to delete with boardNum: " + boardnum);
		}
	}

}
