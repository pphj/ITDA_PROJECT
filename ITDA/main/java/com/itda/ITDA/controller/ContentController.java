package com.itda.ITDA.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.service.ContentService;

@Controller
@RequestMapping(value = "/contents")
public class ContentController {

	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);

	private ContentService contentService;

	@Autowired
	public ContentController(ContentService contentService) {
		this.contentService = contentService;
	}

	// 게시글 자세히 보기
	@RequestMapping(value = "/{chnum}/{boardNum}", method = RequestMethod.GET)
	public String getContentDetailMove(@PathVariable(value = "boardNum") int boardnum, Model model,
			@PathVariable(value = "chnum") int chnum) {

		ChBoard board = contentService.getContentDetail(boardnum);
		logger.info("boardNum = " + board.getBoardNum());

		model.addAttribute("board", board);

		return "/content/content_detail";

	}

	/*@RequestMapping(value = "/contentlist.co")
	public String getContentList(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "limit", defaultValue = "10") int limit,
			@RequestParam(name = "channelnum") int channelnum,
			@RequestParam(name = "order", defaultValue = "desc") String order,
			@RequestParam(name = "chcate_id") int categoryId,
			@RequestParam(name = "state", required = false) String state, Model mv) {
	
		List<ChBoard> contentlist = new ArrayList<ChBoard>();
	
		int listcount = 0;
	
		if (categoryId == 0)
		{ // 전체
			contentlist = contentService.getAllChannelCategoryData(channelnum, order, page, limit);
			listcount = contentService.getAllChannelCategoryCount(channelnum);
	
		} else
		{ // 카테고리
			contentlist = contentService.getChannelCategoryData(channelnum, categoryId, page, limit);
			listcount = contentService.getChannelCategoryCount(channelnum, categoryId);
		}
	
		int maxpage = (listcount + limit - 1) / limit;
	
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage)
			endpage = maxpage;
	
		mv.addAttribute("page", page);
		mv.addAttribute("limit", limit);
		mv.addAttribute("channelnum", channelnum);
		mv.addAttribute("order", order);
		mv.addAttribute("chcate_id", categoryId);
		mv.addAttribute("state", state);
		mv.addAttribute("maxpage", maxpage);
		mv.addAttribute("startpage", startpage);
		mv.addAttribute("endpage", endpage);
		mv.addAttribute("listcount", listcount);
		mv.addAttribute("contentlist", contentlist);
	
		// 뷰 페이지로 이동
		return "content/content_list";
	}*/

}
