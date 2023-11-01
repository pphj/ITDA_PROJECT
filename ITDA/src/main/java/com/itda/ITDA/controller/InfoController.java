package com.itda.ITDA.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.PaginationDTO;
import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.service.InfoService;

@Controller
@RequestMapping(value = "/info")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);

	private InfoService infoService;

	@Autowired
	public InfoController(InfoService infoService) {
		this.infoService = infoService;
	}

	@GetMapping(value = "/notice")
	public ModelAndView notice(ModelAndView mv) {
		
		 // ADMINBOARD 테이블의 데이터 조회 
	    List<AdminBoard> adminBoardList = infoService.getAdminBoardList();
	    
	    mv.addObject("adminBoardList", adminBoardList); // ADMINBOARD 테이블 데이터 추가
		mv.setViewName("info/notice");
		return mv;
	}
	
	@GetMapping("/notice/view")
	public ModelAndView showNoticeView(@RequestParam("no") int userId, ModelAndView mv) {
	    // 공지사항 정보 조회 로직
	    AdminBoard adminBoard = infoService.getAdminBoardByUserId(userId);

	    mv.addObject("adminBoard", adminBoard); // 조회된 공지사항 정보 모델 객체에 추가

	    mv.setViewName("info/notice_View"); // view 페이지의 이름 설정

	    return mv;
	}


	@GetMapping("/qna")
	public ModelAndView qna(ModelAndView mv, Principal principal) {

	    // 로그인한 사용자의 ID를 가져오기
	    String userId = principal.getName();

	    // 사용자 ID를 이용하여 ADMINBOARD 테이블의 데이터 조회
	    List<AdminBoard> userQnaList = infoService.getQnaByUser(userId);

	    // 각 질문에 대한 댓글 목록을 가져와서 모델에 추가
	    for (AdminBoard qna : userQnaList) {
	        List<QnaReply> qnaReplyList = infoService.getQnaRepliesByAdNum(qna.getAdNum());
	        qna.setQnaReplyList(qnaReplyList);
	    }

	    mv.addObject("userQnaList", userQnaList);  // 사용자의 QnA 데이터 추가
	    mv.setViewName("info/qna");

	    return mv;
	}


	
	
	
	@GetMapping(value = "/qna/view")
	public ModelAndView showQnaView(@RequestParam("no") int adNum, ModelAndView mv) {
	    // 질문 정보 조회 로직
	    AdminBoard adminBoard = infoService.getAdminBoardByAdNum(adNum);
	    
	    // 질문에 대한 댓글 정보 조회 로직
	    List<QnaReply> qnaReplies = infoService.getQnaRepliesByAdNum(adNum);

	    mv.addObject("adminBoard", adminBoard); // 조회된 질문 정보 모델 객체에 추가
	    mv.addObject("qnaReplyList", qnaReplies); // 질문에 대한 댓글 정보 모델 객체에 추가

	    mv.setViewName("info/qna_View"); // view 페이지의 이름 설정

	    return mv;
	}

	
	
	
	@GetMapping(value = "/faq")
	public ModelAndView faq(ModelAndView mv) {
		mv.setViewName("info/faq");
		return mv;
	}

	
	@GetMapping(value = "/requests")
	public ModelAndView requests(ModelAndView mv) {
	    mv.setViewName("info/requests");
	    return mv;
	}
	
	
	
	@PostMapping(value = "/qnainsert")
	public String addQna(@ModelAttribute AdminBoard adminBoard,
						 @RequestParam("QcateId") int QcateId, // 카테고리를 숫자로 받음
	                     Principal principal) {
	    if (principal == null)
	        return "redirect:/";
	    
	    String userId = principal.getName();  // 로그인한 유저 ID
	    adminBoard.setUserId(userId);  // 질문자 ID 설정

	    LocalDateTime currentDateTime = LocalDateTime.now();
	    Timestamp adDate = Timestamp.valueOf(currentDateTime);  // LocalDateTime을 Timestamp로 변환
	    adminBoard.setAdDate(adDate);  // 작성일 설정
	    
	    // 카테고리 ID 설정
	    adminBoard.setQcateId(QcateId);
	    
	    infoService.insertQna(adminBoard);  // QnA 데이터 저장

	    return "redirect:/info/qna";  // 처리 후 리다이렉트할 페이지
	}
	

}
