package com.itda.ITDA.controller;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.SellerService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

        Itda_User user = (Itda_User) session.getAttribute("user");

        Seller seller = new Seller();
        mv.addObject("seller", seller);
        mv.addObject("userId", user.getUserId()); // userId 값을 모델에 추가
        mv.setViewName("member/Seller_Form");

        return mv;
    }

    @PostMapping("/join")
    public String processSellerJoin(Seller seller) {
        // 판매회원 가입 처리 로직 작성

        // 예시:
        // sellerService.saveSeller(seller);

        return "redirect:/main";
    }

    @PostMapping("/sellerCheck")
    @ResponseBody
    public String checkSellerRegistration(@RequestParam("userId") String userId, HttpSession session) {
        Itda_User user = (Itda_User) session.getAttribute("user");

        if (user == null) {
            return "false"; // 로그인되지 않은 경우 false 반환
        }

        boolean isRegistered = sellerService.isSeller(userId);

		if (isRegistered) {
			return "true"; // 이미 등록된 경우 true 반환
		} else {
			return "false"; // 등록되지 않은 경우 false 반환
		}
    }
}
