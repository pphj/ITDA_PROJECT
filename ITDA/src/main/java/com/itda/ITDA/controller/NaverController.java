package com.itda.ITDA.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/naver")
public class NaverController {
    private String CLIENT_ID = "rcyeX4m7t_YVfke5Wd6Y"; // 애플리케이션 클라이언트 아이디값
    private String CLI_SECRET = "q9GUDfMVhT"; // 애플리케이션 클라이언트 시크릿값

    @RequestMapping("/naver")
    public String testNaver(HttpSession session, Model model) throws UnsupportedEncodingException, UnknownHostException {
        String redirectURI = URLEncoder.encode("http://localhost:8080/naver/callback", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += String.format("&client_id=%s&redirect_uri=%s&state=%s", CLIENT_ID, redirectURI, state);
        session.setAttribute("state", state);
        model.addAttribute("apiURL", apiURL);
        return "test-naver";
    }

    @RequestMapping("/callback")
    public String naverCallback(HttpServletRequest request, HttpSession session) throws IOException {
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        
        session.setAttribute("state", state);
        

        if (session.getAttribute("state").equals(state)) {
            // 토큰 요청 URL 생성
            String redirectURI = URLEncoder.encode("http://localhost:9400/itda/naver/callback", "UTF-8");
            StringBuilder tokenRequestUrlBuilder =
                    new StringBuilder()
                            .append("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code")
                            .append("&client_id=").append(CLIENT_ID)
                            .append("&client_secret=").append(CLI_SECRET)
                            .append("&redirect_uri=").append(redirectURI)
                            .append("&code=").append(code);

            URL tokenRequestUrl = new URL(tokenRequestUrlBuilder.toString());
            HttpURLConnection connectionTokenRequestUrl =
                    (HttpURLConnection) tokenRequestUrl.openConnection();

            connectionTokenRequestUrl.setRequestMethod("GET");

            int responseCodeTokenRequestUrl =
                    connectionTokenRequestUrl.getResponseCode();

            BufferedReader brTokenRequest =
                    new BufferedReader(new InputStreamReader(connectionTokenRequestUrl.getInputStream()));

            StringBuilder responseBodyTokenRequestBuilder =
                    new StringBuilder();

            while (true) {
                final int responseLineByteLength =
                        brTokenRequest.read();

                if (responseLineByteLength == -1) break; // 읽을 내용 없음

                responseBodyTokenRequestBuilder.append((char) responseLineByteLength);
            }

            
           // 이후 처리 로직 작성...
           
           // 예시: 토큰 요청 결과를 출력해보기
           System.out.println(responseBodyTokenRequestBuilder.toString());

           brTokenRequest.close();
       } else {
           System.out.println("[ERROR] 잘못된 접근입니다.");
       }

       return "test-naver-callback";  // 적절한 반환 값으로 변경해주세요.
    }

        

    @RequestMapping("/naver/refreshToken")
    public String refreshToken(HttpSession session, HttpServletRequest request, Model model, String refreshToken) throws IOException, ParseException {
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token&";
        apiURL += "client_id=" + CLIENT_ID;
        apiURL += "&client_secret=" + CLI_SECRET;
        apiURL += "&refresh_token=" + refreshToken;
        System.out.println("apiURL=" + apiURL);
        String res = requestToServer(apiURL, null); // 두 번째 매개변수는 headerStr로 null로 수정
        model.addAttribute("res", res);
        session.invalidate();
        return "test-naver-callback";
    }

    @ResponseBody
    @RequestMapping("/naver/getProfile")
    public String getProfileFromNaver(String accessToken) throws IOException {
        String apiURL = "https://openapi.naver.com/v1/nid/me";
        String headerStr = "Bearer " + accessToken;
        String res = requestToServer(apiURL, headerStr);
        return res;
    }

    @RequestMapping("/naver/invalidate")
    public String invalidateSession(HttpSession session) {
        session.invalidate();
        return "redirect:/naver";
    }

    private String requestToServer(String apiURL, String headerStr) {
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            System.out.println("header Str: " + headerStr);
            if (headerStr != null && !headerStr.equals("")) {
                con.setRequestProperty("Authorization", headerStr);
            }
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode=" + responseCode);
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if (responseCode == 200) {
                return res.toString();
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
