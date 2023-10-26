package com.itda.ITDA.controller;


import java.net.http.HttpHeaders;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.itda.ITDA.domain.ApiResponse;
import com.itda.ITDA.domain.Itda_User;
import com.itda.ITDA.domain.NaverDTO;
import com.itda.ITDA.domain.NaverOAuthToken;
import com.itda.ITDA.service.NaverService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("naver")
public class NaverController {

    private final NaverService naverService;
    private final Itda_User itda_User; // UserService는 사용자 정보를 데이터베이스에 저장하기 위한 서비스입니다.

    @GetMapping("/callback")
    public ResponseEntity<ApiResponse> callback(HttpServletRequest request) throws Exception {
        String code = request.getParameter("code"); // 'code' 파라미터를 추출

        if (code != null) {
            // 'code' 값을 사용하여 엑세스 토큰을 요청하고 사용자 정보를 가져오는 작업을 수행
            String naverInfo = naverService.getNaverInfo(code);

            // 응답을 생성하여 클라이언트에 반환
            ApiResponse response = new ApiResponse("Success", naverInfo);
            
            System.out.println("response 값"+response);

            // 네이버 정보를 NaverDTO 객체로 매핑
            NaverDTO naverDTO = mapNaverInfoToDTO(naverInfo);

            System.out.println("naverDTO 데이터 "+naverDTO);
            // 사용자 정보를 데이터베이스에 저장
            itda_User.saveNaverUserInfo(naverDTO);
            

            return ResponseEntity.ok().body(response);
        } else {
            // 'code' 파라미터가 없는 경우 예외 처리 또는 오류 메시지를 반환
            return ResponseEntity.badRequest().body(new ApiResponse("Error", "Missing 'code' parameter"));
        }
    }
    
    @RequestMapping("/auth/naver/login/callback")
    public ResponseEntity naverCallback(String code, String state) throws JsonProcessingException {

    	String naverToken = naverService.getNaverInfo(code);
    	
        HttpEntity<MultiValueMap<String, String>> naverProfileRequest = makeProfileRequest(naverToken);

        ResponseEntity<String> profileResponse = rt.exchange(
        PROFILE_REQUEST_URL,
        HttpMethod.POST,
        naverProfileRequest,
        String.class
        );

        NaverProfileResponse naverProfileResponse = objectMapper.readValue(profileResponse.getBody(), NaverProfileResponse.class);
    }
    private HttpEntity<MultiValueMap<String, String>> makeProfileRequest(NaverOAuthToken naverToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer "+ naverToken.getAccess_token());
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        HttpEntity<MultiValueMap<String, String>> naverProfileRequest = new HttpEntity<>(headers);
        return naverProfileRequest;
        }
    
    

    private NaverDTO mapNaverInfoToDTO(String naverInfo) throws JSONException {
        NaverDTO naverDTO = new NaverDTO();

        // 네이버 정보 파싱 및 매핑
        JSONObject jsonObject = new JSONObject(naverInfo);
        if (jsonObject.has("id")) {
            naverDTO.setId(jsonObject.getString("id"));
        }
        if (jsonObject.has("email")) {
            naverDTO.setEmail(jsonObject.getString("email"));
        }
        if (jsonObject.has("name")) {
            naverDTO.setName(jsonObject.getString("name"));
        }

        // 네이버의 추가적인 정보를 매핑할 수 있습니다.
        // naverDTO.setAccess_token(jsonObject.getString("access_token"));

        return naverDTO;
    }



}


    

 
