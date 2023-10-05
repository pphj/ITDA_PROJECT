package com.itda.ITDA.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.domain.PaginationDTO;
import com.itda.ITDA.service.adminService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
@RequestMapping(value="/admin")
public class adminController {
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	private adminService adminService;
	
	@Autowired
	public adminController(adminService adminService) {
		this.adminService=adminService;
	}
	
	@RequestMapping(value="/Main")
	public ModelAndView SetAdmin(ModelAndView mv) {
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
	public ModelAndView SetFaQ(@RequestParam(value="page", defaultValue="1",
										required=false) int page, ModelAndView mv) {
		PaginationDTO p = calculatePagination(page, 10, adminService.getFAQListCount());
		
		List<AdminBoard> FAQList = adminService.getFAQList(page, 10);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", p.getMaxPage());		
		mv.addObject("startpage", p.getStartPage());	
		mv.addObject("endpage", p.getEndPage());		
		mv.addObject("listcount", p.getListCount());	
		mv.addObject("FAQList", FAQList);				//해당 페이지의 글 목록 리스트
		mv.addObject("limit", 10);
		mv.setViewName("admin/FAQ");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/FAQList_ajax")
	public Map<String, Object> FAQListAjax(@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getFAQListCount());
		
		List<AdminBoard> FAQList = adminService.getFAQList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("List", FAQList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	@GetMapping("/FAQ/{num}")
	public ModelAndView FAQDetail(@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);					//header에서 "referer"를 통해 알 수있다
		if (beforeURL != null && beforeURL.endsWith("list")) {	//예) localhost:8088/itda/FAQ/5
		}
		
		AdminBoard faq = adminService.getFAQDetail(num);
		if (faq == null) {
			logger.info("FAQ 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("FAQ 상세보기 성공");
			mv.setViewName("admin/FAQ_view");
			mv.addObject("faqdata", faq);
		}
		return mv;
	}
	
	
	@GetMapping(value="/FAQ_write")
	public String FAQ_write() {
		return "admin/FAQ_write";
	}
	
	
	@PostMapping(value="/FAQadd")
	public String FAQadd(AdminBoard faq, HttpServletRequest request) throws Exception {
		adminService.insertFAQ(faq);		//insert 메소드 호출
		logger.info(faq.toString());		//값을 확인하기 위해 logger 사용
		return "redirect:FAQ";
	}
	
	
	@GetMapping("/FAQmodify/{num}")
	public ModelAndView ModifyView(@PathVariable("num") int num, ModelAndView mv,
															HttpServletRequest request) {
		AdminBoard faq = adminService.getFAQDetail(num);
		if (faq == null) {									//글 불러오기 실패시
			logger.info("FAQ 수정보기 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "FAQ 수정보기 실패");
			return mv;
		}
		
		logger.info("FAQ 수정보기 성공");
		mv.addObject("FAQdata", faq);		//수정 페이지로 이동시 원문글을 보여줘야 하기 때문에
		mv.setViewName("admin/FAQ_modify");	//수정 페이지로 이동
		return mv;
	}
	
	
	@PostMapping("/FAQmodifyAction")
	public String FAQModifyAction(AdminBoard FAQdata, String check, Model mv, HttpServletRequest request,
													RedirectAttributes ra) throws Exception {
		boolean admincheck = adminService.isadWriter(FAQdata.getAdNum(), FAQdata.getAdPassword());
		String url = "";
		if (admincheck == false) {
			ra.addFlashAttribute("result", "passFail");
			ra.addAttribute("num", FAQdata.getAdNum());
			return "redirect:FAQmodify/{num}";
		}
		
		int result = adminService.FAQModify(FAQdata);
		if (result == 0) {
			logger.info("FAQ 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "FAQ 수정 실패");
			url = "error/error";
		}else {
			logger.info("FAQ 수정 완료");
			url = "redirect:FAQ/{num}";
			ra.addAttribute("num", FAQdata.getAdNum());
		}
		return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/QNAList_ajax")
	public Map<String, Object> QNAListAjax(@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		PaginationDTO p = calculatePagination(page, limit, adminService.getQNAListCount());
		
		List<AdminBoard> QNAList = adminService.getQNAList(page, limit);	//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", p.getMaxPage());
		map.put("startpage", p.getStartPage());
		map.put("endpage", p.getEndPage());
		map.put("listcount", p.getListCount());
		map.put("List", QNAList);				//해당 페이지의 글 목록 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	@GetMapping("/QNA/{num}")
	public ModelAndView QNADetail(@PathVariable("num") int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);					//header에서 "referer"를 통해 알 수있다
		if (beforeURL != null && beforeURL.endsWith("list")) {	//예) localhost:8088/itda/FAQ/5
		}
		
		AdminBoard qna = adminService.getFAQDetail(num);
		if (qna == null) {
			logger.info("QNA 상세보기 실패");
			mv.addObject("url", request.getRequestURI());
			mv.addObject("message", "상세보기 실패");
		}else {
			logger.info("QNA 상세보기 성공");
			mv.setViewName("admin/QNA_view");
			mv.addObject("qnadata", qna);
		}
		return mv;
	}
	
	@RequestMapping(value="/userNotice")
	public ModelAndView SetUserNotice(ModelAndView mv) {
		mv.setViewName("admin/userNotice");
		return mv;
	}
	
	@RequestMapping(value="/sellerApprove")
	public ModelAndView SetSellerApprove(ModelAndView mv) {
		mv.setViewName("admin/sellerApprove");
		return mv;
	}
	
	@RequestMapping(value="/itdaNotice")
	public ModelAndView SetItdaNotice(ModelAndView mv) {
		mv.setViewName("admin/itdaNotice");
		return mv;
	}
	
	@RequestMapping(value="/adminApprove")
	public ModelAndView SetAdminApprove(ModelAndView mv) {
		mv.setViewName("admin/adminApprove");
		return mv;
	}
	
	@RequestMapping(value="/problem")
	public ModelAndView SetProblem(ModelAndView mv) {
		mv.setViewName("admin/problem");
		return mv;
	}
}
