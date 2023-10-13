package com.itda.ITDA.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itda.ITDA.domain.ChannelList;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.ChannelList_Service;
import com.itda.ITDA.service.DateService;
import com.itda.ITDA.service.FolderService;
import com.itda.ITDA.service.SellerService;

@Controller
@RequestMapping("/seller")
public class Itda_SellerController {
	@Value("${app.image-upload-dir2}")
	private String imageUploadDir2;

	@Autowired
	private SellerService sellerService;
	@Autowired
	private ChannelList_Service channelList_Service;

	@GetMapping("/join")
	public ModelAndView showSellerJoinForm(ModelAndView mv, Principal principal) {


		if (principal.getName() == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}

		mv.addObject("userId", principal.getName()); // userId 값을 모델에 추가
		mv.setViewName("member/Seller_Form");

		return mv;
	}

	@PostMapping("/sellerjoinprocess")
	public String processSellerJoin(Itda_User itda_User, Principal principal) {
		if (principal == null)
			return "redirect:/login";

		// 프로필 사진 업로드 및 파일 경로 설정
		String saveFolder = imageUploadDir2; // 프로퍼티 값을 사용
		MultipartFile profile = itda_User.getProfile();

		String userFolder = saveFolder + File.separator + principal.getName();

		// 폴더 생성
		try {
			FolderService.createFolder(userFolder);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error?message=폴더 생성 실패"; // 폴더 생성 실패 시 에러 페이지로 리다이렉트
		}

		System.out.println("profileImagePath 경로: " + userFolder);
		// 파일 업로드
		try {
			byte[] bytes = profile.getBytes(); // 파일의 내용을 바이트 배열로 읽어옵니다.

			Path path = Paths.get(userFolder + File.separator + profile.getOriginalFilename()); // 파일을 저장할 절대 경로
																								// 객체(Path) 생성
			FolderService.createFolder(userFolder);

			String urlPath = "/" + itda_User.getUserId() + "/" + DateService.toDay() + "/"
					+ profile.getOriginalFilename();

			itda_User.setUserProfile(urlPath); // 업로그한 이미지 URL set

			Files.write(path, bytes); // 해당 경로에 파일 쓰기
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/error?message=프로필 사진 업로드 실패"; // 업로드 실패 시 에러 페이지로 리다이렉트
		}

		// 판매회원 정보 저장
		try {
			sellerService.saveSeller(itda_User);
			System.out.println("saveSeller");
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error?message=셀러 정보 저장 실패"; // 셀러 정보 저장 실패 시 에러 페이지로 리다이렉트
		}

		// 데이터베이스에 채널 목록 정보 저장
		try {
			channelList_Service.saveChannelList(itda_User);
			System.out.println("saveChannelList");
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error?message=채널 목록 정보 저장 실패";
		}

		return "redirect:/"; // 모든 작업이 완료된 후 리다이렉트될 페이지
	}

	@PostMapping("/sellerCheck")
	@ResponseBody
	public String checkSellerRegistration(@RequestParam("userId") String userId, HttpSession session) {
		Itda_User user = (Itda_User) session.getAttribute("user");

		if (user != null) { // 로그인된 경우
			boolean isRegistered = sellerService.isSeller(userId);

			if (isRegistered) {
				return "true"; // 이미 등록된 경우 true 반환
			}
		}

		return "false"; // 로그인되지 않거나 등록되지 않은 경우 false 반환
	}

}
