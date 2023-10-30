package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

@Mapper
public interface ContentMapper {

	List<ChBoard> getContentAll(int pageCount, int startRow, int endRow);

	List<ChBoard> getContentByCategory(int categoryNum, int pageCount, int startRow, int endRow);

	List<ChannelList> getChannelList();

	List<ChannelList> getChannelListByNum(int categoryNum);

	List<ChBoard> HotContentSelect();

	List<ChCategory> selectchCate_Id();

	ChBoard getContentDetail(int boardnum);

	List<ChBoard> searchContentsByKeyword(String string);

	Seller getSellerInfo(String userid);

	List<Tag> getTagInfo(@Param("chnum") int chnum, @Param("boardNum") int boardNum);

	ChBoard isContentWriter(HashMap<String, Object> map);

	int contentModify(ChBoard chboard);

	List<ChBoardCategory> getCategoryNameList(int chnum);

	List<ChBoard> newContentSelect(int chnum);

	int boardDelete(int boardnum);

	Itda_User getUserInfo(String userId);

	List<ChBoardCategory> getChannelCategory(int boardnum);

	String findNameById(int chCateId);

	int deleteBoard(int boardNum);

	void increaseViewCount(int boardNum, int boardVisit);

	void increaseViewCount(int boardNum);

	BoardReply getReplyById(int replyNum);

	List<WCATEGORY> getAllWCategories();

	int insertReport(Map<String, Object> params);

	Itda_User getUser(String userId);

	boolean checkReportedCategory(String userId, String category);

	ChBoard getBoardInfo(int boardNum);

	int insertContentReport(Map<String, Object> params);

	boolean checkContentCategory(String userId, String category);

	Itda_User getUsersFromGoodUser(String userid);

	GoodUser getsubUser(String userid);

	void deleteWarningsByBoardNum(int boardNum);

	boolean checkReportStatus(int num);

	ChannelList getChannelListByChnum(int chnum);

	Seller getSellerInfoByUserId(String userId);

}
