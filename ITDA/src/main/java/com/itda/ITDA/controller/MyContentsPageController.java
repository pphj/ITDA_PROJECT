package com.itda.ITDA.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.LikeContent;
import com.itda.ITDA.domain.Order;
import com.itda.ITDA.service.ChannelList_Service;
import com.itda.ITDA.service.ContentService;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.service.OrderService;
import com.itda.ITDA.service.heartService;
import com.itda.ITDA.util.Message;

@Controller
@RequestMapping(value= "/my")
public class MyContentsPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyContentsPageController.class);
	
	private Itda_UserService itdaUserService;
	private ChannelList_Service channelList_Service;
	private OrderService orderService;
	private ContentService contentService;
	private heartService heartService; 
	
	
	@Autowired
	public MyContentsPageController(Itda_UserService itdaUserService, ChannelList_Service channelList_Service, 
									OrderService orderService, ContentService contentService,
									heartService heartService) {
		this.itdaUserService = itdaUserService;
		this.channelList_Service = channelList_Service;
		this.orderService = orderService;
		this.contentService = contentService;
		this.heartService = heartService;
	}
	
	
	@GetMapping(value="/subscriptions")
	public String goSubscriptions(Model model,
			HttpSession session, Principal principal) {
		
		String id = principal.getName();
		logger.info("id : " + principal.getName());
		
		Itda_User idCheck = itdaUserService.isUserIdORSellerId(id);
		logger.info("getUserId 결과 : " + idCheck.getUserId());
		logger.info("getSellerId 결과 : " + idCheck.getSellerId());
		
		String sellerId = idCheck.getSellerId();
		
		if(idCheck.getUserId() != null) {
			
	    	Itda_User vo = itdaUserService.read(id);
	    	model.addAttribute("user", vo);
	    	session.setAttribute("userName", vo.getUserName());
	    	session.setAttribute("userId", vo.getUserId());
	    	session.setAttribute("userProfile", vo.getUserProfile());
	    	
	    	if (sellerId == null || sellerId.equals("")) {
	    		model.addAttribute("message", "NOT_SELLER");
	    		session.setAttribute("message", "NOT_SELLER");
	    	}
	    	
	    	return "mypage/subscriptions";
			
	    } else {
	    	logger.info("페이지 연결 에러");
	    	return "redirect:/";
	    }
	    
	}

	
	// 마이페이지 구독채널의 최신 콘텐츠
	@GetMapping(value="/subscriptions/contents")
	public String subscriptionsContents() {
		return"mypage/subscriptions_contents";
	}
	
	// 마이페이지 쿠폰
	@GetMapping(value="/coupons")
	public String coupons() {
		return"mypage/coupons";
	}
	
	// 마이페이지 설정(구독 설정)
	@GetMapping(value="/notification")
	public String notification() {
		return "mypage/notification";
	}
	
	// 마이페이지 결제 내역
	@GetMapping(value="/payment/subscriptions")
	public String paymentSubscriptions(Model model,
										Principal principal,
										Order order) throws Exception {
		
		String id = principal.getName();
		List<Order> orderList = itdaUserService.myOrderList(id);
		int count = itdaUserService.orderListCount(id);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("count", count);
		
		return "mypage/payment_subscriptions";
	}
	
	// 마이페이지 결제 내역 자세히 보기
	@GetMapping(value="/payment/subscriptions/{payedNum}")
	public String paymentSubscriptionsEpisode(@PathVariable(value = "payedNum") int payedNum,
												Model model, Order order) {
		
		order = itdaUserService.getOrderInfo(payedNum);
		
		model.addAttribute("orderInfo", order);
		
		return "mypage/payment_subscriptions_episode";
	}

	
	// 관심 콘텐츠(좋아요 콘텐츠) 페이지
	@GetMapping(value="/contents")
	public String lickContents(LikeContent likeContent,
								Principal principal,
								Model model) {
		
		String id = principal.getName();
		
		List<LikeContent> likeContentList = itdaUserService.likeContentList(id);
		int count = itdaUserService.likeContentCount(id);
		
		model.addAttribute("contentList", likeContentList);
		model.addAttribute("cnt", count);
		
		
		return "mypage/contents";
	}
	
	// 관심 콘텐츠 삭제 프로세스
	@PostMapping(value="contents/likeDeletePro")
	public String likeDeleteProcess(LikeContent likeContent,
								Principal principal,
								Model model,
								HttpServletRequest request) {
		
		String id = principal.getName();
		
		likeContent.setBoardNum(likeContent.getBoardNum());
		likeContent.setUser_id(id);
		
		int boardNum = likeContent.getBoardNum();
		
		heartService.removeHeart(boardNum, id);
		heartService.decreaseChBoardHeart(boardNum);
		
		request.setAttribute("msg", Message.SUCCESS);
		
		return "mypage/contents_delete_action";
	}
	
	// 나의 채널 가져오기
	@GetMapping(value="/channellist")
	public String myChannellist(ChannelList channel,
								Principal principal,
								Model model) {
		
		String id = principal.getName();
		
		channel = channelList_Service.myChannelList(id);
		
		model.addAttribute("channel", channel);
		logger.info("CHOPENDATE : " + channel.getChOpenDate());
		
		return "mypage/mychannellist";
	}
	


}
