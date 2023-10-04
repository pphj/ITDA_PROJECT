//package com.itda.ITDA.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.itda.ITDA.security.JwtUtil;
//
//@RestController
//@RequestMapping("/api")
//public class AuthController {
//    @Autowired
//    private JwtUtil jwtUtil;
//
//    @PostMapping("/login")
//    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
//        // 사용자 인증 (자격 증명 확인 등)
//        // 인증이 성공하면 JWT 토큰을 생성
//        String token = jwtUtil.generateToken(username);
//        return ResponseEntity.ok(new JwtAuthenticationResponse(token));
//    }
//
//    // 다른 보호된 엔드포인트에서 JWT를 사용한 인증 가능
//}
