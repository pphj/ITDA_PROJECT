package com.itda.ITDA.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itda.ITDA.controller.ContentController;
import com.itda.ITDA.domain.BoardReply;
import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.GoodUser;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.Tag;
import com.itda.ITDA.domain.WCATEGORY;
import com.itda.ITDA.mybatis.mapper.ContentMapper;

@Service
public class ContentServiceImpl implements ContentService {
	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

	private ContentMapper dao;
	private TagService tagService;
	private ReplyService replyService;
	private heartService heartService;

	@Autowired
	public ContentServiceImpl(ContentMapper dao, TagService tagService, ReplyService replyService,
			heartService heartService) {
		this.dao = dao;
		this.tagService = tagService;
		this.replyService = replyService;
		this.heartService = heartService;
	}

	@Override
	public List<ChBoard> getContentAll(int pageCount, int startRow, int endRow) {
		return dao.getContentAll(pageCount, startRow, endRow);
	}

	@Override
	public List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow) {
		return dao.getContentByCategory(categoryNum, pageCount, startRow, endRow);
	}

	@Override
	public List<ChannelList> getChannelList() {
		return dao.getChannelList();
	}

	@Override
	public List<ChannelList> getChannelListByNum(int categoryNum) {
		return dao.getChannelListByNum(categoryNum);
	}

	@Override
	public List<ChBoard> HotContentSelect() {
		return dao.HotContentSelect();
	}

	@Override
	public List<ChCategory> selectchCate_Id() {
		return dao.selectchCate_Id();
	}

	@Override
	public ChBoard getContentDetail(int boardnum) {
		return dao.getContentDetail(boardnum);

	}

	@Override
	public Seller getSellerInfo(String userid) {
		return dao.getSellerInfo(userid);
	}

	@Override
	public List<Tag> getTagInfo(int chnum, int boardnum) {
		return dao.getTagInfo(chnum, boardnum);

	}

	@Override
	public boolean isContentWriter(int boardNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		ChBoard result = dao.isContentWriter(map);
		if (result == null)
			return false;
		else
			return true;
	}

	@Override
	public int contentModify(ChBoard chboard) {
		return dao.contentModify(chboard);
	}

	@Override
	public List<ChBoardCategory> getCategoryNameList(int chnum) {
		return dao.getCategoryNameList(chnum);
	}

	@Override
	public List<ChBoard> newContentSelect(int chnum) {
		return dao.newContentSelect(chnum);
	}

	@Override
	@Transactional
	public void deleteBoard(int boardNum) {
		logger.info("Start deleting board: " + boardNum);

		replyService.deleteBoardReplyByBoardNum(boardNum);
		logger.info("성공 deleting board reply warnings");

		replyService.boardcommentsDelete(boardNum);
		logger.info("성공 deleting board replies");

		tagService.deleteTagsByBoardNum(boardNum);
		logger.info("성공 deleting board tags");

		heartService.deleteChBoardHeart(boardNum);
		logger.info("성공 decreasing board heart");

		dao.deleteWarningsByBoardNum(boardNum);
		logger.info("성공 deleting board warnings");

		int result = dao.deleteBoard(boardNum);
		if (result > 0)
		{
			logger.info("성공 deleted board: " + boardNum);
		} else
		{
			logger.info("No board to delete with boardNum: " + boardNum);
		}
	}

	@Override
	public Itda_User getUserInfo(String userId) {
		return dao.getUserInfo(userId);
	}

	@Override
	public List<ChBoardCategory> getChannelCategory(int boardnum) {
		return dao.getChannelCategory(boardnum);
	}

	@Override
	public String findNameById(int chCateId) {
		return dao.findNameById(chCateId);
	}

	// ContentServiceImpl 클래스
	@Override
	@Transactional
	public void increaseViewCount(int boardNum, int boardVisit) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		try
		{
			logger.info("increaseViewCount method in service called with boardNum: " + boardNum);
			dao.increaseViewCount(boardNum, boardVisit);
			logger.info("조회수 증가합니다!");
		} catch (Exception e)
		{
			logger.error("조회수 증가 실패", e);
			throw new RuntimeException("조회수 증가 실패", e);
		}
	}

	@Override
	public BoardReply getReplyById(int replyNum) {
		return dao.getReplyById(replyNum);
	}

	@Override
	public List<WCATEGORY> getAllWCategories() {
		return dao.getAllWCategories();
	}

	@Override
	public Itda_User getUser(String userId) {
		return dao.getUser(userId);
	}

	@Override
	public boolean checkReportedCategory(String userId, String category) {
		return dao.checkReportedCategory(userId, category);
	}

	@Override
	public boolean report(String punchId, String sickId, String warnCateId, int boardNum, String warnReason,
			int replyNum) {
		Map<String, Object> params = new HashMap<>();
		params.put("punchId", punchId);
		params.put("sickId", sickId);
		params.put("warnCateId", warnCateId);
		params.put("boardNum", boardNum);
		params.put("warnReason", warnReason);
		params.put("replyNum", replyNum);

		int result = dao.insertReport(params);

		return result > 0;
	}

	@Override
	public ChBoard getBoardInfo(int boardNum) {
		return dao.getBoardInfo(boardNum);
	}

	@Override
	public boolean checkContentCategory(String userId, String category) {
		return dao.checkContentCategory(userId, category);
	}

	@Override
	public boolean reportContent(String punchId, String sickId, String warnCateId, int boardNum, String warnReason,
			int chNum) {
		Map<String, Object> params = new HashMap<>();
		params.put("punchId", punchId);
		params.put("sickId", sickId);
		params.put("warnCateId", warnCateId);
		params.put("boardNum", boardNum);
		params.put("warnReason", warnReason);
		params.put("chNum", chNum);

		int result = dao.insertContentReport(params);

		return result > 0;
	}

	@Override
	public Itda_User getUsersFromGoodUser(String userid) {
		return dao.getUsersFromGoodUser(userid);
	}

	@Override
	public GoodUser getsubUser(String userid) {
		return dao.getsubUser(userid);
	}

	@Override
	public void deleteWarningsByBoardNum(int boardNum) {
		dao.deleteWarningsByBoardNum(boardNum);
	}

	@Override
	public boolean checkReportStatus(int num) {
		return dao.checkReportStatus(num);
	}

	@Override
	public ChannelList getChannelListByChnum(int chnum) {
		return dao.getChannelListByChnum(chnum);
	}

	@Override
	public Seller getSellerInfoByUserId(String userId) {
		return dao.getSellerInfoByUserId(userId);
	}

}
