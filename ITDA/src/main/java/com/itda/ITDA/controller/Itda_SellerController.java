package com.itda.ITDA.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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
    public ModelAndView showSellerJoinForm(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        String userId = (String) session.getAttribute("userId");
        
        if (userId == null) {
            // 세션에 "userId" 속성이 없는 경우, 로그인 페이지로 리다이렉트하거나 적절한 처리를 수행할 수 있습니다.
            // 여기서는 임시로 로그인 페이지로 리다이렉트합니다.
            mv.setViewName("redirect:/login");
            return mv;
        }

        Seller seller = new Seller();
        mv.addObject("seller", seller);
        mv.addObject("userId", userId); // userId 값을 모델에 추가
        mv.setViewName("member/Seller_Form");

       return mv;
    }


    

    @PostMapping("/sellerjoinprocess")
    @Transactional
    public String processSellerJoin(@RequestParam("userid") String userId,
                                    @RequestParam("phone") String sellerPhone,
                                    @RequestParam("email") String sellerEmail,
                                    @RequestParam("profile") MultipartFile profile,
                                    HttpSession session) {

        // 세션에서 사용자 아이디 가져오기
        String sessionUserId = (String) session.getAttribute("userId");

        if (sessionUserId == null || !sessionUserId.equals(userId)) {
            return "redirect:/login";
        }

        // 이미 판매회원으로 등록되어 있는 경우
        if (sellerService.isSeller(sessionUserId)) {
            // 이미 판매회원인 경우 프로필 사진 업로드만 처리하고 리다이렉트할 페이지
            // 프로필 사진 업로드 및 파일 경로 설정
            String saveFolder = imageUploadDir2; // 프로퍼티 값을 사용
            String uploadedFileName = profile.getOriginalFilename();
            String userFolder = saveFolder + File.separator + sessionUserId;

            // 폴더 생성
            try {
                FolderService.createFolder(userFolder);
            } catch (Exception e) {
                e.printStackTrace();
                return "redirect:/error?message=폴더 생성 실패"; // 폴더 생성 실패 시 에러 페이지로 리다이렉트
            }

            System.out.println("profileImagePath 경로: " + userFolder);
            
             try {
                byte[] bytes = profile.getBytes();  // 파일의 내용을 바이트 배열로 읽어옵니다.

                Path path = Paths.get(userFolder + File.separator + uploadedFileName);  // 파일을 저장할 절대 경로 객체(Path) 생성

                Files.write(path, bytes);  // 해당 경로에 파일 쓰기
                
                 return "redirect:/";
             } catch (IOException e) {
                 e.printStackTrace();
                 return "redirect:/error?message=프로필 사진 업로드 실패"; 
             }
            
           
        }

        Seller seller = new Seller();
        seller.setUserId(sessionUserId);
        seller.setSellerPhone(sellerPhone);
        seller.setSellerEmail(sellerEmail);

         Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
         seller.setSellerJoinDate(currentTimestamp); 
         seller.setWaitState("W"); 


    // 데이터베이스에 셀러 정보 저장 또는 수정
    try {
    	sellerService.saveOrUpdateSeller(seller);
    } catch (Exception e) {
    	e.printStackTrace();
    	return "redirect:/error?message=셀러 정보 저장 또는 수정 실패"; 
    }

    ChannelList channelList = new ChannelList();

    channelList.setOwnerId(sessionUserId); 
    channelList.setChName(userId); 
    channelList.setChProfile(imageUploadDir2); 
    channelList.setChInfo("판매회원 정보"); 
    channelList.setCate_Id(1); 
    channelList.setChFollow(0); 
    channelList.setChVisit(0);

    try {
    	sellerService.saveOrUpdateSeller(seller);
    	channelList_Service.saveChannelList(channelList);
    } catch (Exception e) {
    	TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    	e.printStackTrace();
    	return "redirect:/error?message=회원 가입 처리 실패";  
    }

    return "redirect:/";
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
