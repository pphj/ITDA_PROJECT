package com.itda.ITDA.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChBoard;
import com.itda.ITDA.domain.ChCategory;
import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.service.ContentService;
import com.itda.ITDA.service.MainService;
import com.itda.ITDA.service.NaverService;

@Controller
@RequestMapping(value="/main")
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private MainService mainService;
	private ContentService contentService;
	private NaverService naverService;
	
	@Autowired
	public MainController(MainService mainService, ContentService contentService, NaverService naverService) {
		this.mainService=mainService;
		this.contentService=contentService;
		this.naverService=naverService;
	}
	
	@GetMapping(value="/protomain")		//인기 게시글(카드 로테이션 부분) 로직 포함
	public ModelAndView SetMain(ModelAndView mv) {
		
		List<ChBoard> HotContentList = contentService.HotContentSelect();
		List<ChCategory> chCategoryList = contentService.selectchCate_Id();
		
		mv.addObject("HotContentList", HotContentList);
		mv.addObject("chCategoryList", chCategoryList);
		mv.setViewName("main/protomain");
		return mv;
		
		
	//userProfilePath 
	}
	
	@ResponseBody	//오늘의 컨텐츠
	@RequestMapping(value="/contentByCategory")
	public List<ChBoard> getContentByCategory(
			@RequestParam("categoryNum") int categoryNum,
            @RequestParam("pageCount") int pageCount,
            @RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit) {
		
		int startRow = (pageCount - page) * limit + page;
		int endRow = pageCount * limit;
		
        if (categoryNum == 0) {
            return contentService.getContentAll(pageCount, startRow, endRow);
        } else {
            return contentService.getContentByCategory(categoryNum, pageCount, startRow, endRow);
        }
        
    }
	
	@ResponseBody	//오늘의 채널
	@RequestMapping(value="/ChannelListAction")
	public List<ChannelList> ChannelList(@RequestParam("categoryNum") int categoryNum) {
		
		if (categoryNum == 0) {
            // 카테고리 아이디가 없는 경우, 전체 채널 목록을 가져옵니다.
			return contentService.getChannelList();
        } else {
            // 카테고리 아이디가 있는 경우, 해당 카테고리 아이디의 채널 목록을 가져옵니다.
        	return contentService.getChannelListByNum(categoryNum);
        }
	}
	
	@GetMapping(value = "/search")
	public String search() {
		return "main/search";
	}

	@GetMapping("/search/result")
	public ModelAndView searchResult(@RequestParam("searchQuery") String keyword) {
		List<ChannelList> channelResults = mainService.searchChannelsByKeyword(keyword);
		List<ChBoard> contentResults = mainService.searchContentsByKeyword(keyword);

		ModelAndView modelAndView;

		if (channelResults.isEmpty() && contentResults.isEmpty()) {
			// 검색 결과가 없을 때 "결과없음" 페이지로 리다이렉트
			modelAndView = new ModelAndView("main/no_results");
		} else {
			modelAndView = new ModelAndView("main/search_View");
			modelAndView.addObject("channelResults", channelResults);
			modelAndView.addObject("contentResults", contentResults);
		}

		// 검색어를 모델에 추가하여 뷰로 전달
		modelAndView.addObject("searchQuery", keyword);

		return modelAndView;
	}

	@GetMapping("/search/result/channel")
	public ModelAndView searchChannelResult(@RequestParam("searchQuery") String keyword) {
		// 여기서 검색 결과를 조회하는 서비스 메서드를 호출하여 채널 검색 결과를 가져옵니다.
		List<ChannelList> channelResults = mainService.searchChannelsByKeyword(keyword);

		ModelAndView modelAndView = new ModelAndView("main/ch/channel_search_view"); // 뷰 페이지 이름을 적절히 설정

		modelAndView.addObject("channelResults", channelResults);
		modelAndView.addObject("searchQuery", keyword);

		return modelAndView;
	}

	@GetMapping("/search/result/content")
	public ModelAndView searchContentResult(@RequestParam("searchQuery") String keyword) {
		List<ChBoard> contentResults = mainService.searchContentsByKeyword(keyword);

		ModelAndView modelAndView = new ModelAndView("main/ch/content_search_view");

		modelAndView.addObject("contentResults", contentResults);
		modelAndView.addObject("searchQuery", keyword);

		return modelAndView;
	}
	
	
}
