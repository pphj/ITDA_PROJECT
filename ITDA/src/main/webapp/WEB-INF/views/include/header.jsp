<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script> var contextPath = "<%=request.getContextPath()%>"; </script>
<script>
	const result="${result}";
	
	if(result == "joinSuccess") {
		alert("회원가입을 축하합니다");
	}else if("${loginfail}" == "loginFailMsg") {
		alert("아이디나 비밀번호가 일치하지 않습니다");
	}
	
	$(function(){
		$("#joinForm").click(function(){
			location.href = "${pageContext.request.contextPath}/member/join";
		})
	})
</script>
<div class="backyard">
	<nav id="navbody">
		<!-- 왼쪽 상단 로고 링크 -->
		<a id="logo-brand" href="${pageContext.request.contextPath}/main">
			<img
			src="${pageContext.request.contextPath}/resources/image/common/itda_logo.png"
			style="width: 100px; height: auto;">
		</a>
		<ul id="right_btns">
			<li id="search" style="margin-bottom: 24px;"><a id="search_btn"
				onclick="location.href='${pageContext.request.contextPath}/search'">
					<img
					src="${pageContext.request.contextPath}/resources/image/common/search.png"
					style="width: 30px; height: auto;">
			</a></li>
			<%
			String userId = (String) session.getAttribute("userId");
			String userProfilePath = (String) session.getAttribute("userProfilePath"); // 프로필 사진 경로 가져오기

			if (userId != null && !userId.equals("")) {
			%>

			<!-- 로그인한 경우 프로필 사진을 표시합니다. -->
			<div class="dropdown">
				<button class="dropbtn">
					<img id="profile_img" src="${userProfilePath}"
						style="width: 30px; height: auto;" />
				</button>
				<div class="dropdown-content">
					<a href="${pageContext.request.contextPath}/myPage">마이 페이지</a>
					<a href="#" id="logoutLink">로그아웃</a>
				</div>
			</div>

			<%
			} else {
			%>

			<li id="login_modal">
				<!-- 헤더의 로그인 버튼 -->
				<button type="button" class="login_btn" data-toggle="modal"
					data-target="#myModal"
					style="color: #FBD1A7; background: rgb(1, 39, 60); border: none;">로그인</button>

				<!-- Modal -->
				<form id="modalForm" action="${pageContext.request.contextPath}/member/loginProcess"
					method="post">
					<div class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header"
									style="text-align: center; border: none;">
									<h3 class="modal-title"
										style="border: none; text-align: center; margin: 20px auto auto auto;">SIGN
										IN</h3>
								</div>

								<div class="modal-body">
									<p>
										<br> <input type="text" name="userId" id="userId"
											style="width: 100%; height: 40px; border: none; background: white; border-bottom: 1px solid rgb(1, 39, 60) !important; outline: none;"
											placeholder="아이디"><br>
									</p>
									<p>
										<br> <input type="password" name="userPw" id="userPw"
											style="width: 100%; height: 40px; border: none; background: white; border-bottom: 1px solid rgb(1, 39, 60) !important; outline: none;"
											placeholder="비밀번호" autocomplete="on">
									</p>
									<label>
										<input type="checkbox" name="remember-me" style="margin-bottom: 15px;"> 로그인 유지하기
									</label>
									<div style="float: right">
										<a class="find_account" href="account.jsp"
											style="font-size: 8px; color: #1479a7 !important;">아이디·비밀번호
											찾기</a>
									</div>
									<br>
									<br>
									<div style="text-align: center; margin: auto;">
										<button type="submit" class="real_login_btn"
											style="color: white; background: rgb(1, 39, 60); text-align: center; width: 100%; height: auto; margin: auto;">로그인</button>
									</div>
								</div>

								<div class="modal-footer"
									style="text-align: center; border: none;">
									<a class="modal_join" style="text-align: center;
									margin: auto 0px auto auto; color: #1479a7 !important;"
									disabled>아이디가 없으신가요?</a>&nbsp;
									<a class="modal_join" id="joinForm" style="color: #1479a7 !important; text-decoration: underline;
									text-align: center; margin: auto auto auto 0px;">회원가입</a>
								</div>
							</div>
							<!-- modal-content end -->
						</div>
						<!-- modal-dialog end -->
					</div>
					<!-- Modal end -->
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</li>
			<!-- login_modal end -->
			<%
			}
			%>
		</ul>
	</nav>
</div>