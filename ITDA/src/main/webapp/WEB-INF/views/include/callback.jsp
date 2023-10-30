<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.itda.ITDA.naver.MyInfo" %>    
<!doctype html>
<html lang="ko">
<script> var contextPath = "<%=request.getContextPath()%>";</script>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

<%-- <form action="../logout" method="post">
<input type="submit" value="로그아웃">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
 --%>

<script type="text/javascript">
  var naver_id_login = new naver_id_login('<%=MyInfo.clientId%>', '<%=MyInfo.callbackUrl%>');
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	    const email = naver_id_login.getProfileData('email');
	    const nickname = naver_id_login.getProfileData('nickname');
	    const name = naver_id_login.getProfileData('name');
	    const age = naver_id_login.getProfileData('age');
	    const gender = naver_id_login.getProfileData('gender');
	    //const birthday = naver_id_login.getProfileData('birthday');
	    //const mobile = naver_id_login.getProfileData('mobile');
	    
		let body = $('body');
		body.css('text-align', 'center'); // 출력 텍스트를 가운데 정렬
		
		body.append('<h4>네이버 아이디 로그인 성공하셨습니다.</h4>');
		body.append('<h4>이메일: ' + email + '</h4>');
		body.append('<h4>닉네임: ' + nickname + '</h4>');
		body.append('<h4>이름: ' + name + '</h4>');
		body.append('<h4>나이: ' + age + '</h4>');
		body.append('<h4>성별: ' + gender + '</h4>');

		//body.append('<h4>생일:'+birthday+'</h4>');
		//body.append('<h4>전화번호:'+mobile+'</h4>');
		//location.href="naver/login_check?email="+email;
		  // 버튼 추가
	    body.append('<button id="saveNaverInfoButton">메인으로 이동 </button>');
	    
	    // "사용자 정보 저장" 버튼 클릭 이벤트 처리
	    $('#saveNaverInfoButton').click(function() {
	        // jQuery AJAX를 사용하여 정보를 서버로 전달
	        $.ajax({
	            type: "GET",
	            url: "saveNaverUserInfo", 
	            data: {
	                email: email,
	                nickname: nickname,
	                name: name,
	                age: age,
	                gender: gender
	            },
	            success: function(response) {
	                // 서버에서의 응답에 따른 동작
	                console.log('서버 응답:', response);
	                if (response === 'success') {
	                    // 저장이 성공한 경우 메인 페이지로 리디렉션
	                	window.location.href = contextPath + "/";
	                }
	            },
	            error: function(xhr, status, error) {
	                // 오류 처리
	                console.error('오류:', error);
	            }
	        });
	    });
	  }
  
</script>
</body>
</html>