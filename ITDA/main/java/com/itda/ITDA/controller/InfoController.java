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
	public ModelAndView qna(ModelAndView mv) {

	    // ADMINBOARD 테이블의 데이터 조회 
	    List<AdminBoard> QnaAdminBoardList = infoService.getQnaAdminBoardList();

	    mv.addObject("adminBoardList", QnaAdminBoardList);  // ADMINBOARD 테이블 데이터 추가
	    mv.setViewName("info/qna");

	    return mv;
	}
	
	@GetMapping(value = "/qna/view")
	public ModelAndView showQnaView(@RequestParam("no") int adNum, ModelAndView mv) {
	    // 질문 정보 조회 로직
	    AdminBoard adminBoard = infoService.getAdminBoardByAdNum(adNum);

	    mv.addObject("adminBoard", adminBoard); // 조회된 질문 정보 모델 객체에 추가

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
	                     Principal principal) {
	    if (principal == null)
	        return "redirect:/";
	    
	    String userId = principal.getName();  // 로그인한 유저 ID
	    adminBoard.setUserId(userId);  // 질문자 ID 설정

	    LocalDateTime currentDateTime = LocalDateTime.now();
	    Timestamp adDate = Timestamp.valueOf(currentDateTime);  // LocalDateTime을 Timestamp로 변환
	    adminBoard.setAdDate(adDate);  // 작성일 설정
	    
	    // adWriter, adPassword 등 다른 필드는 별도의 로직으로 처리...
	    
	    infoService.insertQna(adminBoard);  // QnA 데이터 저장

	    return "redirect:/info/qna";  // 처리 후 리다이렉트할 페이지
	}
	
	public PaginationDTO calculatePagination (int page, int limit, int listCount) {
		PaginationDTO p = new PaginationDTO();
		
		p.setLimit(limit);
		p.setListCount(listCount);							//총 글의 수
		p.setMaxPage((listCount + limit -1) / limit);		//최대 페이지 수
		p.setStartPage(((page - 1) / 10) * 10 + 1);			//현재 페이지에 표시할 첫 페이지 수
		p.setEndPage(p.getStartPage() + 10 - 1);			//현재 페이지에 표시할 끝 페이지 수
		
		if (p.getEndPage() > p.getMaxPage()) {
			p.setEndPage(p.getMaxPage());
		}
		
		return p;
	}


	



}
