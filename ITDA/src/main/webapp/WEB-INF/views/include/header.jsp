<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_modal.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/premium_service2.css">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/main/tv_icon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<script> var contextPath = "<%=request.getContextPath()%>";
</script>
<script>
	const result = "${result}";

	if (result == "joinSuccess") {
		alert("회원가입을 축하합니다");
	} else if ("${loginfail}" == "loginFailMsg") {
		alert("아이디나 비밀번호가 일치하지 않습니다");
	}

	$(function() {
		$("#joinForm").click(function() {
			location.href = "${pageContext.request.contextPath}/member/join";
		})
	})
	
var _jn='';
var _jid='';
var m_jn='';
var m_jid='';
var m_id='';
var _id='';
var SITE_MEMBER = function(){
	var member_profile_id = 'member_profile';
	var $member_profile, $join_form;
	var address_format;

	var terms_agree = false;
	var _third_party, _marketing_sms_agree, _marketing_email_agree;

	var policyConfirm = function(){
	};

	var openFindPassword = function(){
		$.cocoaDialog.close();
		$.ajax({
			type: 'POST',
			data: {d: 'd'},
			url: ('/dialog/find_password.cm'),
			dataType: 'html',
			async: true,
			cache: false,
			success: function(html){
				var $html = $(html);
				$.cocoaDialog.open({type: 'site_find_password', custom_popup: $html, hide_event:function(){
						$(window).unbind('keydown');
					}});
			}
		});
	};

	
	
</script>
</head>
<header class="header_wrap as_home">
	<div class="header">
		<div class="header_inner">
			<div class="header_content">
				<div class="header_service">
		<!-- 왼쪽 상단 로고 링크 -->
					<h1 class="header_logo">
						<a href="${pageContext.request.contextPath}/main" class="header_logo" ><img class="header_logo_img" alt="" src="${pageContext.request.contextPath}/resources/image/common/itda_logo4.png" ><span class="blind">잇:다</span></a>
					</h1>
				</div>
			<div class="header_menu">   <!-- header_menu2 -->
				<a class="header_search"
				onclick="location.href='${pageContext.request.contextPath}/main/search'"><span class="blind">검색</span></a>
			
				
		<ul id="right_btns">
	<%-- 		<li id="search" style="margin-bottom: 24px;"><a id="search_btn"
				onclick="location.href='${pageContext.request.contextPath}/main/search'">
					<img
					src="${pageContext.request.contextPath}/resources/image/common/search.png"
					style="width: 30px; height: auto;">
			</a></li>
	 --%>		<%
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
					<a href="${pageContext.request.contextPath}/myPage">마이 페이지</a> <a
						href="#" id="logoutLink">로그아웃</a>
				</div>
			</div>

			<%
			} else {
			%>
			
			<div class="header_user">
				<div class="user_sign_in">
				<button type="button" class="user_sign_in" data-toggle="modal"
					data-target="#myModal">로그인</button>
				</div>

							<!-- 헤더의 로그인 버튼 -->

								<!-- Modal -->
				<form id="modalForm"
					action="${pageContext.request.contextPath}/member/loginProcess"
					method="post">

					<div class="modal fade" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
									<div class="modal-content"> 
									<!-- 병합 -->
										<div class="modal-header2"> <!-- modal-header2 -->
											<h2>로그인</h2>
										</div>
										<article class="modal_article2 login p_lr_space pb24"> <!-- modal_article2  -->
											<button class="close" data-dismiss="modal" aria-label="Close"
												data-toggle="tooltip" data-placement="bottom"
												data-original-title="닫기">
												<i class="btl bt-times"></i>
											</button>



											<form action="/backpg/login.cm" method="post"
												target="hidden_frame">
												<input type="hidden" name="back_url" value="Lw%3D%3D">
												<input type="hidden" name="back_url_auth" value="">
												<input type="hidden" name="used_login_btn" value="Y">

														<div class="input_block">
															<div class="input_form">
											<!-- input_form -->	<input class="input_form2"			 
																	title="아이디" type="text" name="uid" value=""
																	placeholder="아이디"> <i aria-hidden="true"
																	class="zmdi zmdi-check"></i>

															</div>
															<div class="input_form brt">
											<!-- input_form -->	<input class="input_form2" 
																title="비밀번호" name="passwd" type="password"
																	value="" placeholder="비밀번호" autocomplete="off"
																><i aria-hidden="true"
																	class="zmdi zmdi-check"></i>
															</div>
														</div>
														<!--input_form에 active클래스명이 붙으면 (인풋에 글자가 입력된 상태) 체크표시 활성화 -->

												<div class="cheak_article">
													<div class="checkbox checkbox-styled">
														<label class="form-label"><div class="logincheckbox"> <input type="checkbox" 
															class="ie" name="auto_login" data-type="use" value="ok"
															> </div> <div class="loginkeep"><span class="agree_tit">로그인상태유지</span></div>
														</label>
													</div>
												</div>

												<p>
													<button class="btn btn-primary btn-block"
														style="font-size: 14px;">로그인</button>
												</p>
											</form>

											<div class="over_h">
												<div style="float:left;"> <a href="${pageContext.request.contextPath}/member/joinForm"
													class="float_l">회원가입</a></div> <div style="text-align:right"> 
													<a href="${pageContext.request.contextPath}/member/FindIdPasswordForm"
													class="float_r">아이디 · 비밀번호 찾기</a></div>
											</div>


											<div class="divider txt_c">
												<div class="border"></div>
												<p style="text-align:center; margin-bottom:2px;" >또는</p>
												<div class="border right"></div>
											</div>
											<div class="sns_login_form">
												<p class="txt_c mb10">
													<div><a  class="btn btn-naver !tw-block"
														href="https://nid.naver.com/oauth2.0/authorize?response_type=code&amp;svctype=0&amp;redirect_uri=https%3A%2F%2Fthepicq.com%2Foauth&amp;client_id=54P4N7kqyLdRMnKcnht5&amp;state=Lw%253D%253D%7Cnaver%7CY%7C%7C">네이버로
														시작하기</a></div>
												</p>
												<p class="txt_c mb10">
													<a class="btn btn-kakao !tw-block" id="custom-login-btn"
														href="https://kauth.kakao.com/oauth/authorize?response_type=code&amp;redirect_uri=https%3A%2F%2Fthepicq.com%2Foauth&amp;client_id=414c871f5c6b89877050158f15e84de1&amp;state=Lw%253D%253D%7Ckakao_sync%7CY%7C%7C">카카오로
														시작하기</a>
												</p>
												<p class="txt_c mb10">
													<a class="btn btn-google !tw-block holder"
														href="https://accounts.google.com/o/oauth2/auth?approval_prompt=auto&amp;response_type=code&amp;scope=email+profile&amp;redirect_uri=https%3A%2F%2Fthepicq.com%2Foauth&amp;client_id=89407851314-7i2mdvacndsltvd9279uqqlo0pgr4rsm.apps.googleusercontent.com&amp;state=Lw%253D%253D%7Cgoogle%7CY%7C%7C"><i
														aria-hidden="true" class="social-icon fa fa-google-plus"></i>
														Google로 시작하기</a>
												</p>
											</div>

										
											<script type="text/javascript">
												if (typeof window.sessionStorage !== "undefined") {
													if (typeof SITE_SHOP_DETAIL != "undefined") {
														if (SITE_SHOP_DETAIL
																.getCurrentProdNo()) {
															SITE_SHOP_DETAIL
																	.saveSelectedProd();
														} else {
															const itemsToKeep = [
																	'history_reset',
																	'undoList',
																	'redoList' ];
															for ( let key in sessionStorage) {
																if (!itemsToKeep
																		.includes(key)) {
																	sessionStorage
																			.removeItem(key);
																}
															}
														}
													} else {
														const itemsToKeep = [
																'history_reset',
																'undoList',
																'redoList' ];
														for ( let key in sessionStorage) {
															if (!itemsToKeep
																	.includes(key)) {
																sessionStorage
																		.removeItem(key);
															}
														}
													}

													IMWEB_SESSIONSTORAGE
															.clear('PROD_REVIEW_.*');
													IMWEB_SESSIONSTORAGE
															.clear('PROD_QNA_.*');
												}
												
											</script>
											
										</article>
										<!-- 병합-end -->
									</div>
									

								<!-- modal-content end -->
							</div>
							<!-- modal-dialog end -->
						</div>
						</div>
						<!-- Modal end -->
						
						
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
				</form>
							<!-- login_modal end -->
			<%
			}
			%>
			</div>
		</ul>
							</div>
				</div>
			</div>
		</div>
		<hr>
</header>