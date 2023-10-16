package com.itda.ITDA.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;

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

	List<ChBoard> getChannelCategoryData(HashMap<String, Integer> map);

	int getChannelCategoryCount(int chnum, int chCate_Id);

	Seller getSellerInfo(String userid);

	ChannelList getSellerSetting(int chnum);

	ChannelList getSellerUpdate(String chprofile, String chname, int chnum);

	void saveChannelList(Itda_User itda_User);

	int getSellerUpdate(ChannelList channelList);

	List<ChCategory> getChcategory();

	List<ChBoardCategory> getSellerCategory(int chnum);

	void addCategory(ChBoardCategory chBoardCategory);

}
