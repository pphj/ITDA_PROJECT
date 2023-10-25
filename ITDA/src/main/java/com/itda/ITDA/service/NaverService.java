package com.itda.ITDA.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.itda.ITDA.domain.NaverDTO;

@Service
public class NaverService {

    @Value("${naver.client.id}")
    private String NAVER_CLIENT_ID;

    @Value("${naver.client.secret}")
    private String NAVER_CLIENT_SECRET;

    @Value("${naver.redirect.url}")
    private String NAVER_REDIRECT_URL;

    private final static String NAVER_AUTH_URI = "https://nid.naver.com";
    private final static String NAVER_API_URI = "https://openapi.naver.com";

    public String getNaverLogin() {
        return NAVER_AUTH_URI + "/oauth2.0/authorize"
                + "?client_id=" + NAVER_CLIENT_ID + "&redirect_uri=" + NAVER_REDIRECT_URL + "&response_type=code";
    }

    public NaverDTO getNaverInfo(String code) throws Exception {
        if (code == null) {
            throw new Exception("Failed to get authorization code");
        }

        String accessToken = "";
        String refreshToken = "";

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("grant_type", "authorization_code");
            params.add("client_id", NAVER_CLIENT_ID);
            params.add("client_secret", NAVER_CLIENT_SECRET);
            params.add("code", code);
            params.add("redirect_uri", NAVER_REDIRECT_URL);

            HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
            ResponseEntity<String> responseEntity = new RestTemplate().exchange(
                    NAVER_AUTH_URI + "/oauth2.0/token", HttpMethod.POST, requestEntity, String.class);

            if (responseEntity.getStatusCode().is2xxSuccessful()) {
                String responseBody = responseEntity.getBody();
                JSONObject jsonObject = new JSONObject(responseBody);

                accessToken = jsonObject.getString("access_token");
                refreshToken = jsonObject.getString("refresh_token");
            } else {
                throw new Exception("Failed to get access token");
            }
        } catch (Exception e) {
            throw new Exception("API call failed: " + e.getMessage());
        }

        return getUserInfoWithToken(accessToken);
    }

    private NaverDTO getUserInfoWithToken(String accessToken) throws Exception {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<?> requestEntity = new HttpEntity<>(headers);
        ResponseEntity<String> responseEntity = new RestTemplate().exchange(
                NAVER_API_URI + "/v1/nid/me", HttpMethod.GET, requestEntity, String.class);

        if (responseEntity.getStatusCode().is2xxSuccessful()) {
            String responseBody = responseEntity.getBody();
            JSONObject jsonObject = new JSONObject(responseBody).getJSONObject("response");

            String id = jsonObject.getString("id");
            String email = jsonObject.getString("email");
            String name = jsonObject.getString("name");

            return NaverDTO.builder()
                    .id(id)
                    .email(email)
                    .name(name)
                    .build();
        } else {
            throw new Exception("Failed to get user info");
        }
    }
}
