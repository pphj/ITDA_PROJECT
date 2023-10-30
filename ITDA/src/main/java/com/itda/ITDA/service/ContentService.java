package com.itda.ITDA.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

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

public interface ContentService {

	List<ChBoard> getContentAll(int pageCount, int startRow, int endRow);

	List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow);

	List<ChannelList> getChannelList();

	List<ChannelList> getChannelListByNum(int categoryNum);

	List<ChBoard> HotContentSelect();

	List<ChCategory> selectchCate_Id();

	ChBoard getContentDetail(int boardnum);

	Seller getSellerInfo(String userid);

	List<Tag> getTagInfo(int chnum, int boardnum);

	boolean isContentWriter(int boardNum);

	int contentModify(ChBoard chboard);

	List<ChBoardCategory> getCategoryNameList(int chnum);

	List<ChBoard> newContentSelect(int chnum);

	@Transactional
	void deleteBoard(int boardnum);

	Itda_User getUserInfo(String userId);

	List<ChBoardCategory> getChannelCategory(int boardnum);

	String findNameById(int chCateId);

	void increaseViewCount(int boardNum, int boardVisit);

	BoardReply getReplyById(int replyNum);

	List<WCATEGORY> getAllWCategories();

	boolean report(String punchId, String sickId, String warnCateId, int boardNum, String warnReason, int chNum);

	Itda_User getUser(String name);

	boolean checkReportedCategory(String userId, String category);

	ChBoard getBoardInfo(int boardNum);

	boolean checkContentCategory(String userId, String category);

	boolean reportContent(String punchId, String sickId, String warnCateId, int boardNum, String warnReason,
			int chNum);

	GoodUser getsubUser(String userId);

	Itda_User getUsersFromGoodUser(String userId);

	void deleteWarningsByBoardNum(int boardNum);

	boolean checkReportStatus(int num);

	ChannelList getChannelListByChnum(int chnum);

	Seller getSellerInfoByUserId(String userId);

}
