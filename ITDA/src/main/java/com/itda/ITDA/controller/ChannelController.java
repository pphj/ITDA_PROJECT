package com.itda.ITDA.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.service.ChannelList_Service;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/channel")
public class ChannelController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChannelController.class);

	private ChannelList_Service channelList_Service;

	@GetMapping("/channelmain")
	public ModelAndView Detail(@RequestParam("chnum") int chnum, ModelAndView mv, HttpServletRequest request,
	        @RequestHeader(value = "referer", required = false) String beforeURL) {

	    logger.info("referer:" + beforeURL);

	    ChannelList channellist = channelList_Service.getChannelDetail(chnum);

	    if (channellist == null) {
	        logger.info("채널페이지 보기 실패");
	        mv.setViewName("error/error");
	        mv.addObject("url", request.getRequestURI());
	        mv.addObject("message", "채널페이지 보기 실패입니다.");
	    } else {
	        logger.info("상세보기 성공");
	        mv.setViewName("channel/ChannelMain");
	        mv.addObject("channelList", channellist); // 채널 게시물을 뷰로 전달
	    }
	    return mv;
	}
}
