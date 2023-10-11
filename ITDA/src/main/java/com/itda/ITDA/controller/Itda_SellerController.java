package com.itda.ITDA.controller;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.SellerService;

import java.security.Principal;

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
        System.out.println("userId" + userId);
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
    public String processSellerJoin(@ModelAttribute("seller") Seller seller) {
        // 판매회원 가입 처리 로직 작성

        // 판매회원 저장
        sellerService.saveSeller(seller);

        return "redirect:/main";
    }


    @PostMapping("/sellerCheck")
    @ResponseBody
    public String checkSellerRegistration(@RequestParam("userId") String userId, 
    		HttpSession session) {
        Itda_User user = (Itda_User) session.getAttribute("user");
        
        System.out.println("request userId : " + userId);

        if (user == null) {
            return "false"; // 로그인되지 않은 경우 false 반환
        }

        boolean isRegistered = sellerService.isSeller(userId);

		if (isRegistered = true) {
			return "true"; // 이미 등록된 경우 true 반환
		} else {
			return "false"; // 등록되지 않은 경우 false 반환
		}
    }
}
