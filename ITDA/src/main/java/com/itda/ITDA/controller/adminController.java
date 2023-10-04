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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.AdminBoard;
import com.itda.ITDA.service.adminService;

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
	
	@RequestMapping(value="/FAQ")
	public ModelAndView SetFaQ(@RequestParam(value="page", defaultValue="1",
										required=false) int page, ModelAndView mv) {
		int limit = 10;
		int listcount = adminService.getFAQListCount();
		int maxpage = (listcount + limit -1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		List<AdminBoard> FAQList = adminService.getFAQList(page, limit);
		
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);			//최대 페이지 수
		mv.addObject("startpage", startpage);		//현재 페이지에 표시할 첫 페이지 수
		mv.addObject("endpage", endpage);			//현재 페이지에 표시할 끝 페이지 수
		mv.addObject("listcount", listcount);		//총 글의 수
		mv.addObject("FAQList", FAQList);		//해당 페이지의 글 목록을 갖고 있는 리스트
		mv.addObject("limit", limit);
		mv.setViewName("admin/FAQ");
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/FAQList_ajax")
	public Map<String, Object> FAQListAjax(@RequestParam(value="page", defaultValue="1", required=false) int page,
			@RequestParam(value="limit", defaultValue="10", required=false) int limit){
		
		int listcount = adminService.getFAQListCount();
		int maxpage = (listcount + limit -1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;
		
		if (endpage > maxpage)
			endpage = maxpage;
		
		List<AdminBoard> FAQList = adminService.getFAQList(page, limit);		//리스트를 받아옴
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page", page);
		map.put("maxpage", maxpage);			//최대 페이지 수
		map.put("startpage", startpage);		//현재 페이지에 표시할 첫 페이지 수
		map.put("endpage", endpage);			//현재 페이지에 표시할 끝 페이지 수
		map.put("listcount", listcount);		//총 글의 수
		map.put("FAQList", FAQList);			//해당 페이지의 글 목록을 갖고 있는 리스트
		map.put("limit", limit);
		
		return map;
	}
	
	
	@GetMapping("/FAQdetail")
	public ModelAndView FAQDetail(int num, ModelAndView mv, HttpServletRequest request,
			@RequestHeader(value="referer", required=false) String beforeURL) {
		
		logger.info("referer : " + beforeURL);					//header에서 "referer"를 통해 알 수있다
		if (beforeURL != null && beforeURL.endsWith("list")) {	//예를 들어 localhost:8088/myhome/board/detail?num=5로 들어가면
			//referer는 header에 존재하지 않으므로 required=false로 설정
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
		adminService.insertFAQ(faq);		//저장 메소드 호출
		logger.info(faq.toString());		//값을 확인하기 위해 logger 사용
		return "redirect:FAQ";
	}
	
	
	@GetMapping("/FAQmodify")
	public ModelAndView ModifyView(int num, ModelAndView mv, HttpServletRequest request) {
		AdminBoard faq = adminService.getFAQDetail(num);
		if (faq == null) {									//글 불러오기 실패시
			logger.info("FAQ 수정보기 실패");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "FAQ 수정보기 실패");
			return mv;
		}
		
		logger.info("FAQ 수정보기 성공");
		mv.addObject("FAQdata", faq);					//수정 페이지로 이동시 원문글을 보여줘야 하기 때문에 boarddata를 ModelAndView객체에 저장
		mv.setViewName("admin/FAQ_modify");				//수정 페이지로 이동
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
			return "redirect:FAQmodify";
		}
		
		int result = adminService.FAQModify(FAQdata);				//DAO에서 수정 메소드를 호출
		if (result == 0) {
			logger.info("FAQ 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "FAQ 수정 실패");
			url = "error/error";
		}else {
			logger.info("FAQ 수정 완료");
			url = "redirect:FAQdetail";
			ra.addAttribute("num", FAQdata.getAdNum());
		}
		return url;
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
