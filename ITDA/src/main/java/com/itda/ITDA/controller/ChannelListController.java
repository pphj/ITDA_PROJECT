package com.itda.ITDA.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChBoardCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.service.ChannelList_Service;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/channels")
public class ChannelListController {

	private static final Logger logger = LoggerFactory.getLogger(ChannelListController.class);

	private ChannelList_Service channelList_Service;

	// chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
	final int WRONG_CHNUM = 0;

	@Autowired
	public ChannelListController(ChannelList_Service channelList_Service) {
		this.channelList_Service = channelList_Service;
	}

	@RequestMapping(value = "/{chnum}", method = RequestMethod.GET)
	public ModelAndView showChannelMainPage(@PathVariable(value = "chnum") int chnum, // chnum을 파라미터로 전달 받음

			ModelAndView mv, HttpServletRequest request) {

		if (chnum == WRONG_CHNUM)
		{
			logger.info("채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
			return mv;
		}

		logger.info("채널 메인 페이지 표시 요청: chnum=" + chnum);

		// 채널 리스트를 가져옴
		ChannelList ChannelList = channelList_Service.getChannelDetail(chnum);

		if (ChannelList == null)
		{
			logger.info("채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
		} else
		{
			// logger.info("채널 메인 페이지 표시 성공");
			// 채널 정보를 뷰로 전달
			mv.setViewName("channel/ChannelMain");
			mv.addObject("ChannelList", ChannelList);

			// 채널과 연관된 게시물 목록을 가져옴
			List<ChBoard> ChannelBoardList = channelList_Service.getBoardListByBoardNum(chnum);
			mv.addObject("ChannelBoardList", ChannelBoardList);

			// 채널과 연관된 카테고리 목록을 가져옴
			List<ChBoardCategory> ChannelCategory = channelList_Service.getChannelCategory(chnum);
			mv.addObject("ChannelCategory", ChannelCategory);

		}

		return mv;
	}

	@RequestMapping(value = "/contentlist.co", method = RequestMethod.GET)
	public ModelAndView showContentList(@RequestParam(name = "chnum") int chnum, ModelAndView mv,
			HttpServletRequest request, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "limit", defaultValue = "10") int limit,
			@RequestParam(name = "order", defaultValue = "desc") String order,
			@RequestParam(name = "chcate_id", defaultValue = "0") int chCate_Id,
			@RequestParam(name = "state", required = false) String state) {

		if (chnum == WRONG_CHNUM)
		{
			logger.info("컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "컨텐츠 목록 페이지 표시 실패: channelnum 파라미터가 없거나 잘못된 값입니다.");
		} else
		{
			logger.info("컨텐츠 목록 페이지 표시 요청: channelnum=" + chnum);
			List<ChBoardCategory> chcategorylist = channelList_Service.getChannelCategoryList(chnum);
			mv.setViewName("content/content_list");

			List<ChBoard> contentlist = new ArrayList<ChBoard>();
			int listcount = 0;

			if (chCate_Id == 0)
			{ // 전체
				contentlist = channelList_Service.getAllChannelCategoryData(chnum, order, page, limit);
				listcount = channelList_Service.getAllChannelCategoryCount(chnum);
			} else
			{ // 카테고리
				contentlist = channelList_Service.getChannelCategoryData(chnum, chCate_Id, page, limit);
				System.out.println(contentlist.get(0).getBoardDate());
				listcount = channelList_Service.getChannelCategoryCount(chnum, chCate_Id);
			}

			int maxpage = (listcount + limit - 1) / limit;
			int startpage = ((page - 1) / 10) * 10 + 1;
			int endpage = startpage + 10 - 1;
			if (endpage > maxpage)
				endpage = maxpage;

			mv.addObject("page", page);
			mv.addObject("limit", limit);
			mv.addObject("channelnum", chnum);
			mv.addObject("order", order);
			mv.addObject("chCate_Id", chCate_Id);
			mv.addObject("state", state);
			mv.addObject("maxpage", maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("listcount", listcount);
			mv.addObject("contentlist", contentlist);
			mv.addObject("chcategorylist", chcategorylist);
		}
		return mv;
	}


}
