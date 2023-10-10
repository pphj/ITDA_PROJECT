package com.itda.ITDA.controller;

import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.Seller;
import com.itda.ITDA.service.SellerService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/seller")
public class Itda_SellerController {

    @Autowired
    private SellerService sellerService;  // SellerService를 주입합니다. (SellerService는 실제로 구현해야 합니다)

    @GetMapping("/join")
    public String showSellerJoinForm(Model model, HttpSession session) {
        // 세션에서 로그인 상태 체크
        if (session.getAttribute("user") == null) {
            // 비로그인 상태일 때
            model.addAttribute("message", "로그인이 필요합니다.");
            return "login_form";  // 로그인 페이지로 리다이렉트 (경로는 실제 프로젝트에 맞게 수정)
        } else {
        	Itda_User user = (Itda_User) session.getAttribute("user");  // 현재 로그인한 사용자 정보 가져오기

            if(sellerService.isSeller(user.getUserId())) {  // 이미 판매회원으로 등록된 경우
                model.addAttribute("message", "이미 판매회원으로 등록된 아이디입니다.");
                return "main";  // 메인 페이지로 리다이렉트 (경로는 실제 프로젝트에 맞게 수정)
            } else {
                // 판매회원이 아닌 경우, 셀러 회원가입 페이지로 이동할 때 필요한 데이터 설정
                Seller seller = new Seller();
                model.addAttribute("seller", seller);
                return "seller_join_form";  // JSP 파일명 반환
            }
        }
    }

    @PostMapping("/join")
    public String processSellerJoin(Seller seller) {
        // 셀러 회원가입 처리 로직 구현

        // 예시: 셀러 정보 저장 및 추가 처리
        // sellerService.saveSeller(seller);

        return "redirect:/main";  // 회원가입 후 메인 페이지로 리다이렉트
    }
}
