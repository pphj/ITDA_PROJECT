<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>



<!-- 로그인 상태일 때 -->
<sec:authorize access="isAuthenticated()">
	<script>
		var token = '${_csrf.token}'; // CSRF 토큰 변수 선언

		$(document)
				.ready(
						function() {
							$("#join_seller")
									.click(
											function(e) {
												e.preventDefault();

												var contextPath = '${pageContext.request.contextPath}';
												var id = '<sec:authentication property="principal.username"/>';

												$
														.ajax({
															url : contextPath
																	+ '/seller/sellerCheck',
															type : 'POST',
															data : {
																"userId" : id,
																"_csrf" : token
															}, // 변수 'token'을 사용
															success : function(
																	data) {
																console
																		.log(data);
																if (data === 'true') {
																	alert("이미 판매회원으로 등록된 아이디입니다.");
																} else {
																	location.href = contextPath
																			+ "/seller/join";
																}
															},
															error : function(
																	request,
																	status,
																	error) {
																alert("code: "
																		+ request.status
																		+ "\n message: "
																		+ request.responseText
																		+ "\n error: "
																		+ error);

															}

														});
											});
						});
	</script>
</sec:authorize>

<!-- 비로그인 상태일 때 -->
<sec:authorize access="!isAuthenticated()">
	<script>
		$(document).ready(function() {
			$("#join_seller").click(function(e) {
				e.preventDefault();
				alert("로그인이 필요합니다.");
			});
		});
	</script>
</sec:authorize>


</head>

<body>
	<div class="titleback">
		<div class="inner">
			<div class="banner" style="position: relative;">
				<img class="baimg"
					src="${pageContext.request.contextPath}/resources/image/common/mainbanner2.png"
					style="width: 1280px; height: 400px;">
				<!--   <a href="#" id="join_seller" style="position:absolute; top: calc(50% + 1cm); left: 50%; transform: translate(-50%, -50%); 
               padding: 10px 25px; width: 3.5cm; height: 1cm; white-space: nowrap; color:#00c6be;">판매회원 가입하기</a> -->
				<a href="#" id="join_seller"
					style="position: absolute; top: calc(80% + 1cm); left: 75.5%; transform: translate(-100%, -50%); padding: 10px 25px; white-space: nowrap;">
					<img src="/itda/resources/image/common/sell.png" alt="판매회원 가입하기"
					style="width: 189px; height: 85px;">
				</a>
			</div>
		</div>
	</div>
</body>



