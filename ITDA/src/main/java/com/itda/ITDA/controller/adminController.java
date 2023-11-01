package com.itda.ITDA.controller;

import java.math.BigInteger;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itda.ITDA.domain.Admin;
import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.BoardWarn;
import com.itda.ITDA.domain.Coupon;
import com.itda.ITDA.domain.PaginationDTO;
import com.itda.ITDA.domain.QnaReply;
import com.itda.ITDA.domain.ReplyWarn;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.domain.SubProduct;
import com.itda.ITDA.domain.UserTotal;
import com.itda.ITDA.service.adminService;
import com.itda.ITDA.service.qnaReplyService;
import com.itda.ITDA.util.CommonSource;
import com.itda.ITDA.util.ProblemState;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value="/admin")
public class adminController {
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	private adminService adminService;
	private qnaReplyService qnaReplyService;
	
	@Autowired
	public adminController(adminService adminService, qnaReplyService qnaReplyService) {
		this.adminService=adminService;
		this.qnaReplyService=qnaReplyService;
	}
	
	@RequestMapping(value="/adminLogin")
	public ModelAndView adminLogin(ModelAndView mv) {
		
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	
	
	@RequestMapping(value="/Main")
	public ModelAndView setAdmin(ModelAndView mv) throws JsonProcessingException {
		
		int qnaDailyCount = adminService.qnaDailyCount();
		int sellerDailyCount = adminService.sellerDailyCount();
		int problemDailyCount = adminService.problemDailyCount();
		
		List<UserTotal> userTotalData = adminService.getUserTotalList();
		ObjectMapper objectMapper = new ObjectMapper();
		String userTotalDataJson = objectMapper.writeValueAsString(userTotalData);
		
		List<UserTotal> totalSalesData = adminService.getTotalSalesList();
		ObjectMapper objectMapper2 = new ObjectMapper();
		String totalSalesDataJson = objectMapper2.writeValueAsString(totalSalesData);
		
		mv.addObject("qnaDailyCount", qnaDailyCount);
		mv.addObject("sellerDailyCount", sellerDailyCount);
		mv.addObject("problemDailyCount", problemDailyCount);
		mv.addObject("userTotalData", userTotalDataJson);
		mv.addObject("totalSalesData", totalSalesDataJson);
		mv.setViewName("admin/adminMain");
		return mv;
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
	
	
	
	@RequestMapping(value="/FAQ")
	public ModelAndView setFaq(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="search_field", defaultValue="-1", required=false) int index,
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word,
																			ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getFaqListCount());
		
		List<AdminBoard> faqList = adminService.getFaqList(index, search_word , page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("FAQList", faqList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/faq");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/FAQList_ajax")
	public Map<String, Object> faqListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getFaqListCount());
		
		List<AdminBoard> faqList = adminService.getFaqList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("List", faqList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	@GetMapping("/FAQ/{num}")
	public ModelAndView faqDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);					//header에서 "referer"를 통해 알 수있다
		if (beforeURL != null && beforeURL.endsWith("FAQ")) {	//예) localhost:8088/itda/FAQ/5
			adminService.setAdViewUpdate(num);
		}
		
		AdminBoard faqData = adminService.getFaqDetail(num);
		if (faqData == null) {
			logger.info("FAQ 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("FAQ 상세보기 성공");
			mv.setViewName("admin/faq_View");
			mv.addObject("faqdata", faqData);
		}
		return mv;
	}
	
	
	@GetMapping(value="/faq_Write")
	public String faq_Write() {
		return "admin/faq_Write";
	}
	
	
	@PostMapping(value="/faqInsert")
	public String faqInsert(AdminBoard faq, HttpServletRequest request) throws Exception {
		adminService.insertFaq(faq);		//insert 메소드 호출
		logger.info(faq.toString());		//값을 확인하기 위해 logger 사용
		return "redirect:FAQ";
	}
	
	
	@GetMapping("/faqUpdate/{num}")
	public ModelAndView faqUpdateView(@PathVariable("num") int num, ModelAndView mv,
															HttpServletRequest request) {
		AdminBoard faq = adminService.getFaqDetail(num);
		if (faq == null) {									//글 불러오기 실패시
			logger.info("FAQ 수정보기 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "FAQ 수정보기 실패");
			return mv;
		}
		
		logger.info("FAQ 수정보기 성공");
		mv.addObject("FAQdata", faq);		//수정 페이지로 이동시 원문글을 보여줘야 하기 때문에
		mv.setViewName("admin/faq_Update");	//수정 페이지로 이동
		return mv;
	}
	
	
	@PostMapping("/faqUpdateAction")
	public String faqModifyAction(AdminBoard faqData, Model mv,
			HttpServletRequest request,	RedirectAttributes ra) throws Exception {
		boolean adminCheck = adminService.isAdWriter(
				faqData.getAdNum(), faqData.getAdPassword());
		String url = "";
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", faqData.getAdNum());
			return "redirect:faqUpdate/{num}";
		}
		
		int result = adminService.faqModify(faqData);
		if (result == CommonSource.FAIL) {
			logger.info("FAQ 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "FAQ 수정 실패");
			url = "error/error";
		}else {
			logger.info("FAQ 수정 완료");
			url = "redirect:FAQ/{num}";
			ra.addAttribute("num", faqData.getAdNum());
		}
		return url;
	}
	
	@PostMapping("/faqDelete")
	public String faqDeleteAction(AdminBoard faqData, int num,
							Model mv, RedirectAttributes ra, HttpServletRequest request) {
		boolean adminCheck = adminService.isAdWriter(num, faqData.getAdPassword());
		
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", num);
			return "redirect:/FAQ/{num}";
		}
		int result = adminService.faqDelete(num);
		
		if (result == CommonSource.FAIL) {
		logger.info("FAQ 삭제 실패");
		mv.addAttribute("url", request.getRequestURL());
		mv.addAttribute("message", "FAQ 삭제 실패");
		return "error/error";
		}
		logger.info("FAQ 삭제 성공");
		ra.addFlashAttribute("result", "deleteSuccess");
		return "redirect:FAQ";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/QNAList_ajax")
	public Map<String, Object> qnaListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getQnaListCount());
		
		List<AdminBoard> QnaList = adminService.getQnaList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("List", QnaList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	
	@GetMapping("/QNA/{num}")
	public ModelAndView qnaDetail(@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);					//header에서 "referer"를 통해 알 수있다
		if (beforeURL != null && beforeURL.endsWith("list")) {	//예) localhost:8088/itda/FAQ/5
		}
		
		AdminBoard qna = adminService.getFaqDetail(num);
		if (qna == null) {
			logger.info("QNA 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("QNA 상세보기 성공");
			int count = qnaReplyService.getQnaReplyListCount(num);
			mv.setViewName("admin/QNA_View");
			mv.addObject("count", count);
			mv.addObject("qnadata", qna);
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/QnaReplyList")					//adNum -> qnaView.js 의 data값과 맞춰줘야한다
	public Map<String, Object> qnaReplyList(int adNum, int page) {
		List<QnaReply> list = qnaReplyService.getQnaReplyList(adNum, page);
		int listcount = qnaReplyService.getQnaReplyListCount(adNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("listcount", listcount);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/QnaReplyInsert")
	public int qnaReplyInsert(QnaReply QnaReply) {
		return qnaReplyService.qnaReplyInsert(QnaReply);
	}
	
	@ResponseBody
	@RequestMapping(value="/QnaReplyUpdate")
	public int qnaReplyUpdate(QnaReply QnaReply) {
		return qnaReplyService.qnaReplyUpdate(QnaReply);
	}
	
	@ResponseBody
	@RequestMapping(value="/QnaReplyDelete")
	public int qnaReplyDelete(QnaReply qnaReply) {
		return qnaReplyService.qnaReplyDelete(qnaReply);
	}
	
	
	@RequestMapping(value="/userNotice")
	public ModelAndView setUserNotice(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="search_field", defaultValue="-1", required=false) int index,
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word,
																		ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getUserNoticeListCount());
		
		List<AdminBoard> userNoticeList = adminService.getUserNoticeList(index, search_word, page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("userNoticeList", userNoticeList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/userNotice");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/userNoticeList_ajax")
	public Map<String, Object> userNoticeListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getUserNoticeListCount());
		
		List<AdminBoard> userNoticeList = adminService.getUserNoticeList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("userNoticeList", userNoticeList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	@GetMapping("/userNotice/{num}")
	public ModelAndView userNoticeDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		if (beforeURL != null && beforeURL.endsWith("userNotice")) {
			adminService.setAdViewUpdate(num);
		}
		
		AdminBoard userNoticeData = adminService.getUserNoticeDetail(num);
		if (userNoticeData == null) {
			logger.info("userNotice 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("userNotice 상세보기 성공");
			mv.setViewName("admin/userNotice_View");
			mv.addObject("userNoticeData", userNoticeData);
		}
		return mv;
	}
	
	
	@GetMapping(value="/userNotice_Write")
	public String userNotice_Write() {
		return "admin/userNotice_Write";
	}
	
	
	@PostMapping(value="/userNoticeInsert")
	public String userNoticeInsert(AdminBoard userNotice, HttpServletRequest request) throws Exception {
		adminService.userNoticeInsert(userNotice);		//insert 메소드 호출
		logger.info(userNotice.toString());				//값을 확인하기 위해 logger 사용
		return "redirect:userNotice";
	}
	
	
	@GetMapping("/userNoticeUpdate/{num}")
	public ModelAndView userNoticeUpdateView(
			@PathVariable("num") int num, ModelAndView mv,HttpServletRequest request) {
		AdminBoard userNoticeData = adminService.getUserNoticeDetail(num);
		if (userNoticeData == null) {									//글 불러오기 실패시
			logger.info("userNotice 수정보기 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "userNotice 수정보기 실패");
			return mv;
		}
		
		logger.info("userNotice 수정보기 성공");
		mv.addObject("userNoticeData", userNoticeData);		//수정 페이지로 이동시 원문글을 보여줘야 하기 때문에
		mv.setViewName("admin/userNotice_Update");	//수정 페이지로 이동
		return mv;
	}
	
	
	@PostMapping("/userNoticeUpdateAction")
	public String userNoticeUpdateAction(AdminBoard userNoticeData, Model mv,
			HttpServletRequest request, RedirectAttributes ra) throws Exception {
		boolean adminCheck = adminService.isAdWriter(userNoticeData.getAdNum(), userNoticeData.getAdPassword());
		String url = "";
		
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", userNoticeData.getAdNum());
			return "redirect:userNoticeUpdate/{num}";
		}
		
		int result = adminService.userNoticeUpdate(userNoticeData);
		if (result == CommonSource.FAIL) {
			logger.info("userNotice 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "userNotice 수정 실패");
			url = "error/error";
		}else {
			logger.info("userNotice 수정 완료");
			url = "redirect:userNotice/{num}";
			ra.addAttribute("num", userNoticeData.getAdNum());
		}
		return url;
	}
	
	@PostMapping("/userNoticeDelete")
	public String userNoticeDeleteAction(AdminBoard userNoticeData, int num,
							Model mv, RedirectAttributes ra, HttpServletRequest request) {
		boolean adminCheck = adminService.isAdWriter(num, userNoticeData.getAdPassword());
		
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", num);
			return "redirect:userNotice/{num}";
		}
		int result = adminService.noticeDelete(num);
		
		if (result == CommonSource.FAIL) {
			logger.info("공지 삭제 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "공지 삭제 실패");
			return "error/error";
		}
		logger.info("공지 삭제 성공");
		ra.addFlashAttribute("result", "deleteSuccess");
		return "redirect:userNotice";
	}
	
	
	@RequestMapping(value="/itdaNotice")
	public ModelAndView setItdaNotice(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="search_field", defaultValue="-1", required=false) int index,
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word,
																			ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getItdaNoticeListCount());
		
		List<AdminBoard> itdaNoticeList = adminService.getItdaNoticeList(index, search_word, page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("itdaNoticeList", itdaNoticeList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/itdaNotice");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/itdaNoticeList_ajax")
	public Map<String, Object> itdaNoticeListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getItdaNoticeListCount());
		
		List<AdminBoard> itdaNoticeList = adminService.getItdaNoticeList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("itdaNoticeList", itdaNoticeList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	@GetMapping("/itdaNotice/{num}")
	public ModelAndView itdaNoticeDetail(
			@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		if (beforeURL != null && beforeURL.endsWith("itdaNotice")) {
			adminService.setAdViewUpdate(num);
		}
		
		AdminBoard itdaNoticeData = adminService.getItdaNoticeDetail(num);
		if (itdaNoticeData == null) {
			logger.info("itdaNotice 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("itdaNotice 상세보기 성공");
			mv.setViewName("admin/itdaNotice_View");
			mv.addObject("itdaNoticeData", itdaNoticeData);
		}
		return mv;
	}
	
	
	@GetMapping(value="/itdaNotice_Write")
	public String itdaNotice_Write() {
		return "admin/itdaNotice_Write";
	}
	
	
	@PostMapping(value="/itdaNoticeInsert")
	public String itdaNoticeInsert(AdminBoard itdaNotice, HttpServletRequest request) throws Exception {
		adminService.itdaNoticeInsert(itdaNotice);		//insert 메소드 호출
		logger.info(itdaNotice.toString());			//값을 확인하기 위해 logger 사용
		return "redirect:itdaNotice";
	}
	
	
	@GetMapping("/itdaNoticeUpdate/{num}")
	public ModelAndView itdaNoticeUpdateView(@PathVariable("num") int num, ModelAndView mv,
															HttpServletRequest request) {
		AdminBoard itdaNoticeData = adminService.getItdaNoticeDetail(num);
		if (itdaNoticeData == null) {									//글 불러오기 실패시
			logger.info("itdaNotice 수정보기 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "itdaNotice 수정보기 실패");
			return mv;
		}
		
		logger.info("itdaNotice 수정보기 성공");
		mv.addObject("itdaNoticeData", itdaNoticeData);		//수정 페이지로 이동시 원문글을 보여줘야 하기 때문에
		mv.setViewName("admin/itdaNotice_Update");	//수정 페이지로 이동
		return mv;
	}
	
	
	@PostMapping("/itdaNoticeUpdateAction")
	public String itdaNoticeUpdateAction(AdminBoard itdaNoticeData, Model mv,
			HttpServletRequest request, RedirectAttributes ra) throws Exception {
		boolean adminCheck = adminService.isAdWriter(itdaNoticeData.getAdNum(), itdaNoticeData.getAdPassword());
		String url = "";
		
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", itdaNoticeData.getAdNum());
			return "redirect:itdaNoticeUpdate/{num}";
		}
		
		int result = adminService.itdaNoticeUpdate(itdaNoticeData);
		if (result == CommonSource.FAIL) {
			logger.info("itdaNotice 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "itdaNotice 수정 실패");
			url = "error/error";
		}else {
			logger.info("itdaNotice 수정 완료");
			url = "redirect:itdaNotice/{num}";
			ra.addAttribute("num", itdaNoticeData.getAdNum());
		}
		return url;
	}
	
	@PostMapping("/itdaNoticeDelete")
	public String itdaNoticeDeleteAction(AdminBoard itdaNoticeData, int num,
							Model mv, RedirectAttributes ra, HttpServletRequest request) {
		boolean adminCheck = adminService.isAdWriter(num, itdaNoticeData.getAdPassword());
		
		if (adminCheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", num);
			return "redirect:itdaNotice/{num}";
		}
		int result = adminService.noticeDelete(num);
		
		if (result == CommonSource.FAIL) {
		logger.info("공지 삭제 실패");
		mv.addAttribute("url", request.getRequestURL());
		mv.addAttribute("message", "공지 삭제 실패");
		return "error/error";
		}
		logger.info("공지 삭제 성공");
		ra.addFlashAttribute("result", "deleteSuccess");
		return "redirect:itdaNotice";
	}
	
	
	@RequestMapping(value="/adminApprove")
	public ModelAndView setAdminApprove(
			@RequestParam(value="page", defaultValue="1",required=false) int page,
			@RequestParam(value="search_field", defaultValue="-1", required=false) int index,
			@RequestParam(value="search_word", defaultValue="", required=false) String search_word,
			ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getAdminApproveListCount());
		
		List<Admin> adminApproveList = adminService.getAdminApproveList(index, search_word, page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("adminApproveList", adminApproveList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/adminApprove");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/adminApproveList_ajax")
	public Map<String, Object> adminApproveListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getAdminApproveListCount());
		
		List<Admin> adminApproveList = adminService.getAdminApproveList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("adminApproveList", adminApproveList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	@PostMapping("/authApproveUpdate")
	public String adminApproveUpdateAction(
			@RequestParam(value="adminId") String adminId,
			@RequestParam(value="authName") String authName, Model mv,
			HttpServletRequest request) throws Exception {
		
		String url = "";
		
		int result = adminService.adminApproveUpdate(adminId, authName);
		if (result == CommonSource.FAIL) {
			logger.info("권한 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "권한 수정 실패");
			url = "error/error";
		}else {
			logger.info("권한 수정 완료");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "권한 수정 완료");
			url = "redirect:adminApprove";
		}
		return url;
	}
	
	
	@RequestMapping(value="/sellerApprove")
	public ModelAndView setSellerApprove(ModelAndView mv,
		@RequestParam(value="page", defaultValue="1",required=false) int page,
		@RequestParam(value="search_field", defaultValue="-1", required=false) int index,
		@RequestParam(value="search_word", defaultValue="", required=false) String search_word) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getSellerApproveListCount());
		
		List<Seller> sellerApproveList = adminService.getSellerApproveList(index, search_word, page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		mv.addObject("sellerApproveList", sellerApproveList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/sellerApprove");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/sellerApproveList_ajax")
	public Map<String, Object> sellerApproveListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getSellerApproveListCount());
		
		List<Seller> sellerApproveList = adminService.getSellerApproveList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("sellerApproveList", sellerApproveList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		return map;
	}
	
	@PostMapping("/sellerApproveUpdate")
	public String sellerApproveUpdate(
			@RequestParam(value="userId") String userId,
			@RequestParam(value="adminId") String adminId,
			@RequestParam(value="approve") String approve, Model mv,
			HttpServletRequest request) throws Exception {
		
		String url = "";
		int updateResult = 0;
		
		if(approve.equals("Y")) {
			updateResult = adminService.sellerUpdateY(userId, adminId);
		}else if (approve.equals("N")) {
			updateResult = adminService.sellerUpdateN(userId, adminId);
		}
		
		if (updateResult == CommonSource.FAIL) {
			logger.info("상태 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "상태 수정 실패");
			url = "error/error";
		}
		if (updateResult == CommonSource.SUCCESS) {
			logger.info("상태 수정 완료");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "상태 수정 완료");
			url = "redirect:sellerApprove";
		}
		return url;
	}
	
	@RequestMapping(value="/problem")
	public ModelAndView setProblem(@RequestParam(value="page",
				defaultValue="1",required=false) int page, ModelAndView mv) {
		PaginationDTO pb = calculatePagination(page, 10, adminService.getProblemBoardCount());
		PaginationDTO pr = calculatePagination(page, 10, adminService.getProblemReplyCount());
		
		PaginationDTO p = calculatePagination(page, 10, adminService.getProblemListCount());
		List<BoardWarn> problemList = adminService.problemList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("sumListCount", pb.getListCount() + pr.getListCount());
		mv.addObject("problemList", problemList);
		mv.addObject("limit", 10);
		mv.setViewName("admin/problem");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/problemList_ajax")
	public Map<String, Object> problemListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO pb = calculatePagination(page, limit, adminService.getProblemBoardCount());
		PaginationDTO pr = calculatePagination(page, limit, adminService.getProblemReplyCount());
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getProblemListCount());
		List<BoardWarn> problemList = adminService.problemList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("sumListCount", pb.getListCount() + pr.getListCount());
		map.put("problemList", problemList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		return map;
	}
	
	@PostMapping("/problemUpdate")
	public String problemUpdate(@RequestParam(value="userId") String userId,
								@RequestParam(value="approve") int approve, Model mv,
								HttpServletRequest request) throws Exception {
		
		String url = "";
		int updateResult = 0;
		
		if(approve == ProblemState.PAUSE) {				//일시정지
			updateResult = adminService.userUpdatePause(userId);
			adminService.userBoardUpdate(userId);
			adminService.userReplyUpdate(userId);
		}else if (approve == ProblemState.STOP) {		//정지
			updateResult = adminService.userUpdateStop(userId);
			adminService.userBoardUpdate(userId);
			adminService.userReplyUpdate(userId);
		}else if (approve == ProblemState.CLEAR) {		//해제(정상)
			updateResult = adminService.userUpdateClear(userId);
		}
		
		if (updateResult == CommonSource.FAIL) {
			logger.info("회원상태 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "회원상태 수정 실패");
			url = "error/error";
		}
		if (updateResult == CommonSource.SUCCESS) {
			logger.info("회원상태 수정 완료");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "회원상태 수정 완료");
			url = "redirect:problem";
		}
		return url;
	}
	
	@GetMapping("/problem/{sickId}")
	public ModelAndView problemDetail(
			@PathVariable("sickId") String sickId, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		
		List<BoardWarn> boardProblemData = adminService.boardProblemDetail(sickId);
		List<ReplyWarn> replyProblemData = adminService.replyProblemDetail(sickId);
		
		if (boardProblemData == null || replyProblemData == null) {
			logger.info("problem 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "problem 상세보기 실패");
		}else {
			logger.info("problem 상세보기 성공");
			mv.setViewName("admin/problem_View");
			mv.addObject("boardProblemData", boardProblemData);
			mv.addObject("replyProblemData", replyProblemData);
			mv.addObject("sickId", sickId);
		}
		return mv;
	}
	
	@GetMapping("/problem/{sickId}/all")
	public ModelAndView problemDetailAll(
			@PathVariable("sickId") String sickId, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		
		List<BoardWarn> boardProblemData = adminService.boardProblemDetailAll(sickId);
		List<ReplyWarn> replyProblemData = adminService.replyProblemDetailAll(sickId);
		
		if (boardProblemData == null || replyProblemData == null) {
			logger.info("problem 전체보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "problem 상세보기 실패");
		}else {
			logger.info("problem 전체보기 성공");
			mv.setViewName("admin/problem_ViewAll");
			mv.addObject("boardProblemData", boardProblemData);
			mv.addObject("replyProblemData", replyProblemData);
		}
		return mv;
	}
	
	@RequestMapping(value="/coupon")
	public ModelAndView setCouponList(@RequestParam(value="page",
				defaultValue="1",required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getCouponListCount());
		
		List<Coupon> couponList = adminService.couponList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("couponList", couponList);
		mv.addObject("limit", 10);
		mv.setViewName("admin/coupon");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/couponList_ajax")
	public Map<String, Object> couponListAjax(
			@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit,
			Principal adminPrincipal){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getCouponListCount());
		
		List<Coupon> couponList = adminService.couponList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("couponList", couponList);				//해당 페이지의 글 목록 리스트
		map.put("adminId", adminPrincipal.getName());
		map.put("limit", limit);
		return map;
	}
	
	@GetMapping(value="/coupon_Write")
	public String coupon_Write() {
		return "admin/coupon_Write";
	}
	
	@PostMapping(value="/couponInsert")
	public String couponInsert(Coupon couponData, HttpServletRequest request
															) throws Exception {
		int codeLength = 20;
	    Random code = new Random();
	    StringBuilder randomPattern = new StringBuilder();
	    
	    //첫 자리에 0이 생성될경우
	    //int 타입으로 선언한 randomNumber는 앞의 0을 무시하고 값을 저장한다
	    //이럴 경우 쿠폰코드가 20자리가 아닌 19자리가 되므로 첫 자리는 따로 설정
	    int firstNum = code.nextInt(9) + 1;		//첫 자리는 1~9중 하나로 설정
	    randomPattern.append(firstNum);
	    
	    for (int i = 1; i < codeLength; i++) {
	        int randomNumber = code.nextInt(10);
	        randomPattern.append(randomNumber);
	    }
	    
	    //BigInteger는 내부적으로 문자열 형태로 값을 저장하고 처리하기 때문에
	    //BigInteger를 문자열로 처리하는 것이 더 안전하다.
	    String randomString = randomPattern.toString();
	    BigInteger randomCode = new BigInteger(randomString);
	    couponData.setCouponCode(randomCode);					//randomCode값을 쿠폰코드로 설정
	    
		adminService.couponInsert(couponData);		//insert 메소드 호출
		logger.info(couponData.toString());			//값을 확인하기 위해 logger 사용
		return "redirect:coupon";
	}
	
	@PostMapping("/couponDelete")
	public String couponDeleteAction(
						@RequestParam(value="couponNum") int couponNum,
						@RequestParam(value="couponCode") BigInteger couponCode,
						Model mv, RedirectAttributes ra, HttpServletRequest request) {
		//쿠폰 확인
		boolean couponCheck = adminService.isCouponWriter(couponNum, couponCode);
		logger.info("couponCheck : " + couponCheck);
		
		if (couponCheck == false) {
			logger.info("couponCheck false");
			ra.addFlashAttribute("result", "PassFail");
			return "redirect:coupon";
		}
		
		int result = adminService.couponDelete(couponNum);
		
		if (result == CommonSource.FAIL) {
			logger.info("쿠폰 삭제 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "쿠폰 삭제 실패");
			return "error/error";
		}
		logger.info("쿠폰 삭제 성공");
		ra.addFlashAttribute("result", "deleteSuccess");
		return "redirect:coupon";
	}
	
	@PostMapping("/couponUpdate")
	public String couponUpdateAction(
						@RequestParam(value="couponPrice") int couponPrice,
						@RequestParam(value="couponCode") BigInteger couponCode,
						@RequestParam(value="couponTerm") int couponTerm,
						Model mv, RedirectAttributes ra, HttpServletRequest request) {
		//쿠폰 확인
		boolean couponCheck = adminService.couponCheck(couponPrice, couponCode, couponTerm);
		logger.info("couponCheck : " + couponCheck);
		
		if (couponCheck == false) {
			logger.info("couponCheck false");
			ra.addFlashAttribute("result", "PassFail");
			return "redirect:coupon";
		}
		
		int result = adminService.couponUpdate(couponCode);
		
		if (result == CommonSource.FAIL) {
			logger.info("쿠폰 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "쿠폰 수정 실패");
			return "error/error";
		}
		logger.info("쿠폰 수정 성공");
		ra.addFlashAttribute("result", "updateSuccess");
		return "redirect:coupon";
	}
	
	@RequestMapping(value="/product")
	public ModelAndView setProductList(@RequestParam(value="page",
				defaultValue="1",required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 4, adminService.getProductCount());
		
		List<SubProduct> productList = adminService.productList(page, 4);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());
		mv.addObject("productList", productList);
		mv.addObject("limit", 4);
		mv.setViewName("admin/product");
		return mv;
	}
	
	@GetMapping(value="/product_Write")
	public String product_Write() {
		return "admin/product_Write";
	}
	
	@PostMapping(value="/productInsert")
	public String productInsert(SubProduct productData, HttpServletRequest request
															) throws Exception {
		adminService.productInsert(productData);
		return "redirect:product";
	}
	
	@GetMapping("/product/{productName}")
	public ModelAndView productDetail(
			@PathVariable("productName") String productName, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);
		
		List<SubProduct> productData = adminService.productDetail(productName);
		if (productData == null) {
			logger.info("이용권 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "이용권 상세보기 실패");
		}else {
			logger.info("이용권 상세보기 성공");
			mv.setViewName("admin/product_View");
			mv.addObject("productData", productData);
		}
		return mv;
	}
}
