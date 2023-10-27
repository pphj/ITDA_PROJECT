package com.itda.ITDA.naver;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/member") 
public class NaverController {
    private static final Logger logger = LoggerFactory.getLogger(NaverController.class);

    @RequestMapping(value = "/callback", method = RequestMethod.GET)
    public String naver_login() {
        // 콜백 처리에 필요한 어떤 로직을 여기에 추가하세요.

        // 메인 페이지로 리디렉션하려면:
        return "redirect:/";  // "/" 대신에 메인 페이지의 실제 URL을 사용하려면 이 부분을 수정하세요.
    }
}



    

 
