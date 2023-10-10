/*
package com.itda.ITDA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/sellerchannels")
public class ChannelListSellerController {
	
		private static final Logger logger = LoggerFactory.getLogger(ChannelListSellerController.class);
	
		private ChannelList_Service channelList_Service;
	
		// chnum 파라미터가 없거나 null인 경우에 대한 처리를 수행합니다.
		final int WRONG_CHNUM = 0;
	
		@Autowired
		public ChannelListSellerController(ChannelList_Service channelList_Service) {
			this.channelList_Service = channelList_Service;
		}
	
		@RequestMapping(value = "/{chnum}", method = RequestMethod.GET)
		public ModelAndView showSellerChannelMainPage(@PathVariable(value = "chnum") int chnum, ModelAndView mv,
				HttpServletRequest request) {
	
			if (chnum == WRONG_CHNUM)
			{
				logger.info("채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
				mv.addObject("url", request.getRequestURI());
				mv.addObject("message", "채널 메인 페이지 표시 실패: chnum 파라미터가 없거나 잘못된 값입니다.");
				return mv;
			}
	
			logger.info("채널 메인 페이지 표시 요청: chnum=" + chnum);
	
			// 채널 리스트를 가져옴
			ChannelList ChSellerdetail = channelList_Service.getChannelSellerDetail(chnum);
	
			if (ChSellerdetail == null)
			{
				logger.info("채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
				mv.setViewName("error/error");
				mv.addObject("url", request.getRequestURI());
				mv.addObject("message", "채널 메인 페이지 표시 실패: 해당 번호의 채널을 찾을 수 없습니다.");
			} else
			{
	
				mv.setViewName("channel/ChannelMain_Seller");
				mv.addObject("ChSellerdetail", ChSellerdetail);
	
			}
			return mv;
	
		}
	
}
*/
