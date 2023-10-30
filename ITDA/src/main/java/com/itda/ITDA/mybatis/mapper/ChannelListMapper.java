package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.sub;

@Mapper
public interface ChannelListMapper {

	ChannelList getChannelDetail(int chnum);

	List<ChBoard> getBoardListByBoardNum(int chnum);

	List<ChBoardCategory> getChannelCategory(int chnum);

	/*int getChannelCategoryCount();*/

	List<ChBoardCategory> getChannelCategoryList(int chnum);

	/*seller
	ChannelList getChannelSellerDetail(int chnum);
	*/
	List<ChBoard> getAllChannelCategoryData(int chnum, String order, int startrow, int endrow);

	int getAllChannelCategoryCount(int channelnum);

	List<ChBoard> getChannelCategoryData(HashMap<String, Object> map);

	int getChannelCategoryCount(int chnum, int chCate_Id);

	Seller getSellerInfo(String userid);

	ChannelList getSellerSetting(int chnum);

	ChannelList getSellerUpdate(String chprofile, String chname, int chnum);

	void saveChannelList(Itda_User itda_User);

	int getSellerUpdate(ChannelList channelList);

	List<ChCategory> getChcategory();

	List<ChBoardCategory> getSellerCategory(int chnum);

	void addCategory(ChBoardCategory chBoardCategory);

	// 채널 서치 키워드
	List<ChannelList> searchChannelsByKeyword(String keyword);

	int addCategory(int chnum, String chCate_Name);

	ChannelList myChannelList(String id);

	int updateCategory(int chCate_Id, String chCate_Name);

	int deleteCategory(int chCate_Id);

	List<ChBoardCategory> getCategoryNameList(int chnum);

	int checkChannelName(int chnum, String chName);

	int contentInsert(ChBoard contentAdd);

	// int contentInsert(ChBoard contentAdd);

	ChannelList getContentSellerInfo(String userid);

	List<ChBoard> newContentSelect(int chnum);

	Itda_User getUserInfo(String userid);

	void subscribe(String userId, int chnum);

	void unsubscribe(String userId, int chnum);

	List<sub> getSubData(int chnum);

	boolean checkSubscription(String userId, int chnum);

	Map<String, Object> getBoardVisit(int chnum);

	int getSubscriberCount(String userId, int chnum);

}
