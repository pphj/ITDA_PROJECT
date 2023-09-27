package com.itda.ITDA.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.service.ChannelList_Service;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/channels")
public class ChannelListController {

    private static final Logger logger = LoggerFactory.getLogger(ChannelListController.class);

  
    private ChannelList_Service channelList_Service;
    
    @Autowired
    public ChannelListController(ChannelList_Service channelList_Service) {
       this.channelList_Service = channelList_Service;
    }


    @GetMapping("/ChannelMain")
    public ModelAndView showChannelMainPage(
            @RequestParam(name = "chnum") int chnum, // chnum을 파라미터로 전달 받음
            ModelAndView mv, HttpServletRequest request,
            @RequestHeader(value = "referer", required = false) String beforeURL) {
        logger.info("referer:" + beforeURL);

        if (chnum == 0) {
            // chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
            // 예: 오류 페이지 표시 또는 다른 처리
            logger.info("채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
            mv.addObject("url", request.getRequestURI());
            mv.addObject("message", "채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
            return mv;
        }

        logger.info("채널 메인 페이지 표시 요청: chnum=" + chnum);

        // 채널 정보를 가져옴
        ChannelList channel = channelList_Service.getChannelDetail(chnum);

        if (channel == null) {
            logger.info("채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
            mv.setViewName("error/error");
            mv.addObject("url", request.getRequestURI());
            mv.addObject("message", "채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
        } else {
            //logger.info("채널 메인 페이지 표시 성공");
            // 채널 정보를 뷰로 전달
            mv.setViewName("channel/ChannelMain");
            mv.addObject("channel", channel);
            
            // 채널과 연관된 게시물 목록을 가져옴
            List<ChBoard> channeldetail = channelList_Service.getBoardListByBoardNum(chnum);
            mv.addObject("channeldetail", channeldetail);
        }

        return mv;
    }
    
    
    
  
}
