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
@RequestMapping(value="/contents")
public class ContentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ContentController.class);
	
	private ContentService contentService;
	
	@Autowired
	public ContentController(ContentService contentService) {
		this.contentService = contentService;
	}
	
	// 게시글 자세히 보기
	@RequestMapping(value="/{chnum}/{boardNum}", method= RequestMethod.GET)
	public String getContentDetailMove(@PathVariable(value="boardNum") int boardnum,
									Model model,
									@PathVariable(value="chnum") int chnum) {
		
		ChBoard board = contentService.getContentDetail(boardnum);
		logger.info("boardNum = " + board.getBoardNum());
		
		model.addAttribute("board", board);

		
		return "/content/content_detail";
		
	}

}
