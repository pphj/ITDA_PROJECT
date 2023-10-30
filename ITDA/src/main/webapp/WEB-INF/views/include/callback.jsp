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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header/login_modal.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>

<body>
<div class="modal-dialog ui-draggable">
    <div class="modal-content">
        <!-- 모달의 다른 내용 -->

        <article class="modal_article pop login p_lr_space no-padding bg-white" id="find_step_1">
            <div class="tit_wrap">
                <h2 class="find_tit _find_tit findId">네이버 아이디 로그인 성공!</h2>
            </div>
            <div class="force-padding">
                <!-- 네이버 ID 로그인 정보를 여기에 표시합니다 -->
                <div id="naverInfo">
                    <h6 id="email"></h6>
                    <h6 id="nickname"></h6>
                    <h6 id="name"></h6>
                    <h6 id="age"></h6>
                    <h6 id="gender"></h6>
                </div>
                <!-- 네이버 ID 로그인 정보 표시 끝 -->
                
                 <button id="saveNaverInfoButton" class="btn btn-primary _update_status findId">메인으로 이동</button>

                <!-- 모달의 다른 내용 -->
            </div>
        </article>
    </div>
</div>



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
		body.css('text-align', 'left'); // 출력 텍스트를 왼쪽 정렬
		
		// 이메일 값 보안 처리
		var secureEmail = email.substring(0, 3) + "****" + email.substring(9);
		
		$('#email').html('<span style="margin-right: 100px;">이메일:</span>' + secureEmail);
		$('#email').css('margin-bottom', '20px');

		$('#nickname').html('<span style="margin-right: 100px;">닉네임:</span>' + nickname);
		$('#nickname').css('margin-bottom', '20px');

		$('#name').html('<span style="margin-right: 110px;">이름:</span> ' + name);
		$('#name').css('margin-bottom', '20px');

		$('#age').html('<span style="margin-right: 100px;">나이대:</span> ' + age);
		$('#age').css('margin-bottom', '20px');

		$('#gender').html('<span style="margin-right: 110px;">성별:</span> ' + gender);
		$('#gender').css('margin-bottom', '20px');

		//body.append('<h4>생일:'+birthday+'</h4>');
		//body.append('<h4>전화번호:'+mobile+'</h4>');
		//location.href="naver/login_check?email="+email;
		
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
	                	window.location.href = ContextPath + "/";
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