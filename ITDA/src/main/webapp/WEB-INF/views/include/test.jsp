<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.itda.ITDA.naver.MyInfo" %> 
<!doctype html>
<html lang="ko">
<head>
</head>
<body>
<ul>
      <!-- 아래와같이 아이디를 꼭 써준다. -->
     <a id="naverIdLogin_loginButton" href="javascript:void(0)" class="btn btn-naver !tw-block">
    네이버로 시작하기
	</a>

	<!-- <li onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
          <span style="color:black">네이버 로그아웃</span>
      </a>
	</li> -->
</ul>

<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "<%=MyInfo.clientId%>", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "<%=MyInfo.callbackUrl%>", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();





window.addEventListener('load', function () {
	  naverLogin.getLoginStatus(function (status) {
	    if (status) {
	      var email = naverLogin.user.getEmail(); // 필수로 설정할 것을 받아와 아래와 같이 조건문을 추가합니다.

	      console.log(naverLogin.user);

	      if (email == undefined || email == null) {
	        alert("이메일은 필수 정보입니다. 정보 제공에 동의하십시오.");
	        naverLogin.reprompt();
	        return;
	      }
	    } else {
	      console.log("콜백 처리에 실패했습니다.");
	    }
	  });
	});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", 
    		          "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		//closePopUp();
		}, 1000);
	
	
}
</script>
</body>
</html>