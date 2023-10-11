package com.itda.ITDA.controller;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.SellerService;

import java.security.Principal;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/seller")
public class Itda_SellerController {

    @Autowired
    private SellerService sellerService;

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
    public String processSellerJoin(@RequestParam("userid") String userId,
                                    @RequestParam("phone") String sellerPhone,
                                    @RequestParam("email") String sellerEmail,
                                    HttpSession session) {
        
        // 세션에서 사용자 ID 가져오기
        String sessionUserId = (String) session.getAttribute("userId");
       
        if (sessionUserId == null || !sessionUserId.equals(userId)) {
            return "redirect:/login";
        }

        // 이미 판매회원으로 등록된 경우
        if (sellerService.isSeller(sessionUserId)) {
            return "redirect:/";  // 이미 판매회원인 경우 리다이렉트할 페이지
        }
       
        Seller seller = new Seller();
        
        seller.setUserId(sessionUserId);
        seller.setSellerPhone(sellerPhone);
        seller.setSellerEmail(sellerEmail);
        
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        seller.setSellerJoinDate(currentTimestamp);  // 현재 시간으로 가입 날짜 설정
        
       // waitState 컬럼 값 설정 ('W'로 설정)
       seller.setWaitState("W");
       
       // 판매회원 저장
       sellerService.saveSeller(seller);
       
       return "redirect:/";  // 가입 완료 후 리다이렉트할 페이지.
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
