package com.itda.ITDA.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itda.ITDA.domain.FindIdStep01;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.UserCategory;
import com.itda.ITDA.service.DateService;
import com.itda.ITDA.service.FolderService;
import com.itda.ITDA.service.Itda_UserService;
import com.itda.ITDA.service.UserCategoryService;
import com.itda.ITDA.task.SendMail;

import javax.servlet.http.Cookie;

//DAO와 Service가 작성되어야 Controller가 완성된다
@Controller
@RequestMapping(value = "/member")
public class Itda_UserController {
	@Value("${app.image-upload-dir}")
	private String imageUploadDir;
	private static final Logger logger = LoggerFactory.getLogger(Itda_UserController.class);

	private Itda_UserService Itda_UserService;
	private PasswordEncoder passwordEncoder;
	private UserCategoryService userCategoryService;
	private HttpSession session; // HttpSession 객체 선언

	@Autowired
	public Itda_UserController(Itda_UserService Itda_UserService, UserCategoryService userCategoryService,
			PasswordEncoder passwordEncoder, HttpSession session) {
		this.Itda_UserService = Itda_UserService;
		this.passwordEncoder = passwordEncoder;
		this.userCategoryService = userCategoryService;
		this.session = session; // HttpSession 객체 주입
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value = "saveid", required = false) Cookie readCookie,
			HttpSession session, Principal userPrincipal) {

		if (readCookie != null)
		{
			logger.info("저장된 아이디 : " + userPrincipal.getName()); // 로그인한 아이디값을 로그에 찍어봄
			mv.setViewName("redirect:/main/protomain");
		} else
		{
			mv.setViewName("/main/protomain");
			mv.addObject("loginfail", session.getAttribute("loginfail")); // loginfail을 mv에 저장해주고
			session.removeAttribute("loginfail"); // 세션값은 삭제한다
		}

		return mv;
	}

	@ResponseBody // @ResponseBody : 각 메소드의 실행 결과를 JSON으로 변환하여 HTTP Response Body에 설정된다
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public int idcheck(@RequestParam("userId") String userId) {
		return Itda_UserService.isId(userId);
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}

	@PostMapping("/joinProcess")
	public String insert(@ModelAttribute Itda_User mem,
			@RequestParam(value = "profile", required = false) MultipartFile file,
			@RequestParam("userCategory") int userCategory, RedirectAttributes ra, Model model,
			HttpServletRequest request, HttpSession session, HttpServletResponse response) { // HttpServletResponse
																				// 객체를 파라미터로 추가합니다.
		String encPassword = passwordEncoder.encode(mem.getUserPw());
		logger.info(encPassword);
		mem.setUserPw(encPassword);

		// 사용자 ID별로 폴더를 생성하기 위해 경로에 사용자 ID를 추가합니다.
		String userFolder = imageUploadDir + File.separator + mem.getUserId();

		// FolderService.createFolder 메소드는 해당 경로에 폴더가 없으면 새 폴더를 생성합니다.
		FolderService.createFolder(userFolder);

		// 날짜별로 폴더를 생성하기 위해 오늘 날짜 정보가 포함된 문자열을 경로에 추가합니다.
		userFolder += File.separator + DateService.toDay();

		// 날짜별 폴더 생성
		FolderService.createFolder(userFolder);

		if (file != null && !file.isEmpty())
		{
			try
			{
				byte[] bytes = file.getBytes(); // 파일의 내용을 바이트 배열로 읽어옵니다.

				Path path = Paths.get(userFolder + File.separator + file.getOriginalFilename()); // 파일을 저장할 절대경로
																					// 객체(Path) 생성

				Files.write(path, bytes); // 해당 경로에 파일 쓰기

				String urlPath = "/" + mem.getUserId() + "/" + DateService.toDay() + "/"
						+ file.getOriginalFilename();

				mem.setUserProfile(urlPath); // 업로그한 이미지 URL set
				session.setAttribute("userProfilePath", urlPath); // 세션에 이미지 URL 저장

				// 쿠키 생성 및 설정
				Cookie profileCookie = new Cookie("userProfilePath", urlPath);
				profileCookie.setMaxAge(60 * 60 * 24 * 7); // 예: 7일 동안 유지되도록 설정 (초 단위)
				response.addCookie(profileCookie);

			} catch (IOException e)
			{
				e.printStackTrace();
			}
		} else
		{
			mem.setUserProfile("/static/image/main/login.png");
			session.setAttribute("userProfilePath", "/static/image/main/login.png");

			// 기본 이미지 경로를 쿠키에서 제거하기 위해 만료 시간을 설정합니다.
			Cookie profileCookie = new Cookie("userProfilePath", "");
			profileCookie.setMaxAge(0); // 즉시 만료되도록 설정
			response.addCookie(profileCookie);
		}

		int result = Itda_UserService.insert(mem);

		if (result == 1)
		{
			ra.addFlashAttribute("result", "joinSuccess");

			UserCategory usercategory = new UserCategory();
			usercategory.setUserId(mem.getUserId());
			usercategory.setCate_Id(userCategory);

			int categoryResult = userCategoryService.insert(usercategory);

			if (categoryResult == 1)
			{
				return "redirect:/";
			}
		}

		model.addAttribute("url", request.getRequestURI()).addAttribute("message", "회원 가입 실패");

		return "/main/protomain";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("userId") String id, @RequestParam("userPw") String password,
			HttpSession session, RedirectAttributes rattr) { // session 처리 보안
		// 아이디와 비밀번호를 사용하여 로그인 처리 로직을 구현합니다.
		// Itda_UserService.isId() 메소드로 아이디의 존재 여부 및 정보를 확인하고,
		// 해당 아이디의 사용자가 있다면 비밀번호 일치 여부도 검사합니다.
		// 성공 시 세션에 사용자 정보를 저장하고, 실패 시 에러 메시지 등을 설정합니다.

		int result = Itda_UserService.isId(id, password);
		logger.info("결과 : " + result);
		logger.info("get parameter : " + id + " " + password);

		if (result == 1)
		{
			session.setAttribute("id", id);
			return "redirect:/";
		} else
		{
			rattr.addFlashAttribute("result", result);
			return "/";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/messge", method = RequestMethod.GET)
	public String messge() {
		return "success";
	}

	@RequestMapping(value = "/FindIdPasswordForm", method = RequestMethod.GET)
	public String findIdPasswordForm() {
		return "member/FindIdPasswordForm";
	}

}