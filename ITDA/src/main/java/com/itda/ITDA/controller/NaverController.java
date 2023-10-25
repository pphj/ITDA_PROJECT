package com.itda.ITDA.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itda.ITDA.domain.ApiResponse;
import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.service.NaverService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("naver")
public class NaverController {

    private final NaverService naverService;

    @GetMapping("/callback")
    public ResponseEntity<ApiResponse> callback(HttpServletRequest request) throws Exception {
        NaverDTO naverInfo = naverService.getNaverInfo(request.getParameter("code"));

        return ResponseEntity.ok()
                .body(new ApiResponse("Success", naverInfo));
    }
 
}