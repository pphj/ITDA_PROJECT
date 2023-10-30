
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
		<meta charset="UTF-8">
        <title>FAQ</title>

        <link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
        <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png">
        <link rel="stylesheet" href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309221514">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/help.css">	
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info/faq.css" rel="stylesheet" />

        <script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
		<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
		<script type="text/javascript" src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309221514" async="true"></script>
		<jsp:include page="../include/header.jsp"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info/info.css" rel="stylesheet" />
		
		
    </head>
    <body>
    
<script>
	function handleQnABtnClick() {
	    // Spring Security의 인증 상태를 확인
	    var isAuthenticated = <c:out value="${pageContext.request.userPrincipal != null}" />;
	    if (isAuthenticated) {
	        // 로그인 상태인 경우 1:1문의 페이지로 이동
	        window.location.href = "${pageContext.request.contextPath}/info/qna";
	    } else {
	        // 로그아웃 상태인 경우
	        alert("로그인이 필요합니다.");
	    }
	}
</script>
    
        <div id="wrap" class="wrap sub">
            <!-- skip navi -->
            <div class="skip_navi">
                <a href="#contents">본문 바로가기</a>
            </div>

		<div id="contents" class="contents">
			<div class="layout-inner">
				<section class="faq-wrap">
					<strong class="cont-tit txt-en">FAQ</strong>
					<div class="faq-menu-area">
						<ul class="faq-menu-list">

							<li class="on"><a
								href="${pageContext.request.contextPath}/info/faq" target="">FAQ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
							<li>
								<a href="javascript:void(0);" id="qnaBtn" onclick="handleQnABtnClick()">
					            1:1문의<span class="icon-membersonly2">회원전용</span>
					        </a></li>
						</ul>

						<button type="button" class="btn-menu-more">
							<span class="blind">더보기</span>
						</button>
					</div>

					<div class="faq-menu-cont">
						<div class="contents-tit-wrap">
							<h1 class="contents-tit">회원가입·로그인</h1>
						</div>

						<div class="tab-wrap">
							<div class="inner-scroll">
								<ul class="tab tab-type1">
									<li class="on"><a role="tab" aria-selected="true"
										href="${pageContext.request.contextPath}/info/faq">전체</a></li>
									<li><a role="tab" aria-selected="false">회원가입</a></li>
									<li><a role="tab" aria-selected="false">로그인</a></li>
									<li><a role="tab" aria-selected="false">계정관리</a></li>
								</ul>
							</div>
						</div>
						</div>


						<div class="faq-list ">
							<div class="faq-item" data-no="1">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										회원가입은 어떻게 하나요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											웹사이트 우측 상단 로그인 옆 회원가입 버튼을 통해 회원가입을 할 수 있습니다.<br /> 1) 이메일로
											회원가입: 이메일주소를 아이디로 하며 이메일 소유 인증 후 가입됩니다.<br /> 2) 소셜로 회원가입:
											사용하는 SNS계정 정보를 이용하여 간편하게 회원가입이 진행됩니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="2">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										아이디가 유효하지 않는다고 뜹니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											[이메일로 회원가입]시 @를 포함한 이메일 형식으로 입력해야 합니다. 올바르게 입력했을 경우 "사용 가능한
											아이디 입니다"라는 안내 문구가 나타납니다. <br /> 예) itda@itda.com
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="3">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										이메일로 인증번호가 오지 않습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											인증번호가 오지 않을 경우 아래 내용을 확인해보세요.<br /> 1) 네트워크 상황에 따라 인증번호 발송이
											오래걸릴 수 있습니다. 계속 기다려도 인증번호가 수신되지 않으면 다시한번 인증번호발송을 진행해주세요.<br />
											2) 입력한 이메일주소가 올바른지 한번 확인해주세요. 오탈자나 대소문자가 바르게 입력되었는지 확인해주세요.<br />
											3) 사용하는 메일솔루션의 스팸메일함을 확인해주세요. 기업의 메일을 스팸으로 인식하는 경우가 있습니다.<br />
											4) 입력한 메일주소가 법인 이메일의 경우 회사 전산팀에서 차단하는 경우가 있습니다. 회사메일이라면 회사
											전산팀에 문의해주시거나 개인메일을 이용해주세요.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="4">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										인증번호를 입력했는데, 인증번호 인증이 되질 않습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											인증번호를 입력 후 [인증번호 확인]을 클릭해야 인증단계가 완료됩니다. <br /> 만약 [인증번호 확인]
											을 클릭 했을 때 "인증번호가 일치하지 않습니다"라는 알림이 뜬다면 아래 내용을 확인해보세요.<br />
											1) 인증번호는 숫자로만 이루어진 6자리 입니다. 공백 또는 문자를 오입력 했는지 확인 부탁드립니다.<br />
											2) 인증번호 유효시간은 메일이 발송된 시점부터 30분입니다. 인증번호 메일 회신 후 30분이 지났다면
											새로고침 후 인증단계를 다시 진행 부탁드립니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="5">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										이메일 인증이 완료됐는데 가입이 진행되지 않습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											이메일 인증이 완료됐는데도 가입이 진행되지 않는 경우는 다음과 같습니다.<br /> 1) 이미 가입된
											이메일인 경우 가입을 진행할 수 없습니다. 다른 이메일주소를 입력해주세요.<br /> 2) 소셜로 가입된
											이메일인 경우 가입을 진행할 수 없습니다. 소셜 로그인을 시도해보시거나 다른 이메일주소를 입력해주세요.<br />
											3) 탈퇴한지 30일이 지나지 않으면 가입할 수 없습니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="6">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										비밀번호가 유효하지 않다고 합니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											비밀번호 양식은 다음과 같습니다.<br /> 1) 10~30자의 영문, 숫자, 특수문자 중 2가지 이상의
											조합으로 입력해주세요.<br /> 2) 개인정보나 아이디와 비슷한 비밀번호는 사용하지 말아주세요.<br />
											3) 사용가능한 특수문자는 ~, !, @, #, $, %, ^, &, *, (, ), _, +, = 입니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="7">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										기존 이메일로 회원가입한 계정을 소셜과 연결하려면 어떻게 해야 하나요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">이메일 가입계정과 소셜 가입계정은 각각 분리된
											계정이라 연동이 불가능합니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							
							<div class="faq-item" data-no="9">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										외국인 회원가입이 별도로 제공되나요? Is the foreign sign-in provided form
										separately? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											한국경제는 내국인과 외국인 회원을 따로 분류하지 않습니다. 일반적인 회원가입 과정과 동일하게 이메일 회원가입
											또는 소셜 회원가입을 진행해주세요.<br /> Korean Economic Daily integration
											members do not classify Korean and foreign members
											separately. You can sign up after email authentication or
											SNS(Naver, Kakao, Google, Apple) like a regular membership in
											korean.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="10">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate2">회원가입</span> <em class="faq-q">
										만 14세 미만 사용자도 회원가입이 가능한가요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											만 14세 미만은 보호자 인증을 거친 후 회원가입이 가능합니다.<br /> 1) [이메일로 회원가입]을
											클릭합니다.<br /> 2) 회원약관에서 '만 14세 이상 가입자입니다' 항목을 선택해제한 후 다음단계로
											진행합니다.<br /> 3) 보호자의 휴대전화번호 인증이 확인되면 회원가입이 완료됩니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="18">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate3">로그인</span> <em class="faq-q">
										이메일로그인을 하려고 이메일과 비밀번호를 입력하였는데, 로그인이 되질 않습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											이메일 로그인 오류의 경우 다음과 같은 사항으로 로그인 실패 하실 수 있습니다.<br /> 1) 아이디
											입력란에 이메일형식으로 올바르게 입력하였는지 확인해주세요. 예) itda@itda.com<br />
											2) 이메일 또는 비밀번호를 기입해주실 때 복사&붙혀넣기를 할 경우 공백(띄어쓰기)이 포함될 수 있습니다.
											공백이 포함되어있을 경우 로그인 정보가 불일치로 될 수 있습니다.<br /> 3) 이메일주소로 회원가입이
											아니라 소셜 계정으로 회원가입을 했다면 로그인이 되지 않습니다. [계정찾기] 를 통해 가입수단을 확인해주세요.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="19">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate3">로그인</span> <em class="faq-q">
										소셜 계정으로 로그인을 하려고 이메일과 비밀번호를 입력하였는데, 로그인이 되질 않습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">소셜 가입자는 아이디와 비밀번호가 없습니다.
											이메일과 비밀번호 입력란 아래에 있는 소셜 버튼을 클릭해서 로그인해주세요.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="20">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate3">로그인</span> <em class="faq-q">
										로그인이 차단되었다고 나옵니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">한국경제 통합회원에서는 특정 IP 주소로
											로그인을 비정상적으로 반복하여 시도할 경우, 비정상적인 접속을 막고 회원정보를 보호하기 위해 로그인을 임시
											차단하고 있습니다. 자세한 내용은 고객센터로 문의주시기 바랍니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="21">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate3">로그인</span> <em class="faq-q">
										'로그인 상태 유지'가 무엇인가요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">'로그인 상태 유지'란 아이디와 이메일주소를
											매번 입력하지 않고, 로그인 상태를 유지하는 기능입니다. '로그인 상태 유지'에 체크한 후 로그인을 하면 직접
											[로그아웃]을 누르거나 브라우저의 쿠키를 삭제하기 전까지는 로그인된 상태로 유지됩니다. 다만 너무 오랜 시간이
											지나면 보안을 위해 자동으로 로그아웃됩니다. '로그인 상태 유지'는 개인정보 보호에 취약하니 공용 기기에서는
											이용을 삼가해주시고 개인 기기에서만 사용해주세요.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							
						
							<div class="faq-item" data-no="24">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										아이디를 변경하고 싶습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">아이디는 변경할 수 없습니다. 다른 아이디를
											만들고 싶다면 신규가입을 진행해주시기 바랍니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="25">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										비밀번호가 기억나지 않아요. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											비밀번호를 잊으셨다면 [계정찾기]에서 이메일주소 인증을 한 후 새 비밀번호를 입력해주세요.<br /> 연동한
											SNS의 비밀번호를 잊은 경우에는 해당 SNS의 홈페이지에서 비밀번호를 찾아주시기 바랍니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="26">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										회원 탈퇴를 하고 싶습니다. </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">

											로그인 후 웹페이지 우측 상단에 있는 [내 아이디]를 클릭> [계정관리] > [회원탈퇴] 의 순서로 탈퇴할 수
											있습니다.<br /> 1) 회원 탈퇴가 진행되면 데이터를 복구할 수 없으므로 신중히 진행해 주시기 바랍니다.<br />
											2) 게시글 및 댓글 등의 커뮤니티 게시물은 탈퇴 후에도 남아있게 됩니다. 원치 않으신다면 삭제 후
											탈퇴해주세요.<br /> 3) 이용중인 구독서비스가 있다면 구독중지를 먼저 진행해주세요. 탈퇴 시 자동으로
											구독 중지가 이루어지지 않습니다.
										</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="27">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										회원 탈퇴 후 동일한 계정으로 회원가입을 할 수 있나요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">회원 탈퇴 후 30일이 지나면 동일한 계정으로
											재가입이 가능합니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="28">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										회원 탈퇴를 하면 구독중인 상품은 자동으로 중지 또는 환불이 되나요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">회원 탈퇴 후 구독중인 상품은 자동으로
											중지되지 않습니다. 회원 탈퇴 전에 구독중인 상품을 해지한 후 탈퇴하시기 바랍니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
							<div class="faq-item" data-no="29">
								<!-- 활성화 .on -->
								<a role="button" class="faq-item-tit"> <span
									class="faq-category faq-cate4">계정관리</span> <em class="faq-q">
										회원 탈퇴 후 동일한 계정으로 재가입하면 작성했던 댓글들을 삭제할 수 있나요? </em>
								</a>

								<div class="faq-item-cont">
									<div class="faq-cont-area">
										<div class="faq-a editor-area">탈퇴 후 30일이 지나 동일한 계정으로
											재가입을 해도 탈퇴 이전의 댓글은 삭제할 수 없습니다. 댓글 삭제를 원하신다면 반드시 탈퇴 전에 해주시기
											바랍니다.</div>
									</div>
									<ul class="down-list">
									</ul>
								</div>
							</div>
						</div>
				</section>
			</div>
		</div>



		<script>


$(function() {
	  const urlParams = new URL(location.href).searchParams;
	  const no = urlParams.get('no');

	  // 검색페이지에서 진입 시 해당 컨텐츠 활성화
	  if (no) {
	    $('.faq-item[data-no=' + no + ']').toggleClass('on');
	    $('html, body').animate({ scrollTop: $('.faq-item[data-no=' + no + ']').offset().top }, 300);
	  }

	  function toggleFaqItem() {
	    $(this).parents('.faq-item').toggleClass('on');
	    $(this).siblings('.faq-answer').slideToggle();
	  }

	  $('.faq-item-tit').click(toggleFaqItem);

	   // 탭 클릭 이벤트 핸들러
	   $('.tab-type1 li').click(function() {
	     // 모든 탭에서 on 클래스 제거
	     $('.tab-type1 li').removeClass('on');

	     // 클릭된 탭에 on 클래스 추가
	     $(this).addClass('on');
	   });

	   // 전체 탭 클릭 시
	   $('.tab-type1 li:first-child').click(function() {
	     // 모든 FAQ 아이템 비활성화 및 답변 숨김
	     $('.faq-item').removeClass('on');
	     $('.faq-answer').slideUp();
	     
	     // 모든 FAQ 아이템 활성화 및 답변 노출
	     $('span.faq-category.faq-cate2')
	       .closest('.faq-item')
	       .addClass('on')
	       .find('.faq-answer')
	       .slideDown();

	     $('html, body').animate({ scrollTop: $('.tab-wrap').offset().top - 60 }, 300);

	   });

	   // 회원가입 탭 클릭 시
	   $('.tab-type1 li:nth-child(2)').click(function() {
		// 모든 FAQ 항목 보여주기 
		$('.faq-item') 
		   .show(); 

		// 로그인과 계정관리에 대한 질문과 답변을 히든으로 가려줌 
		$('span.faq-category.faq-cate4, span.faq-category.faq-cate3') 
		   .closest('.faq-item') 
		   .hide(); 

		$('html, body').animate({ scrollTop: $('.tab-wrap').offset().top - 60 }, 300);

		});
		
		// 로그인 탭 클릭 시
		$('.tab-type1 li:nth-child(3)').click(function() {
		  // 모든 FAQ 항목 보여주기 
		  $('.faq-item') 
		     .show(); 

		  // 회원가입과 계정관리에 대한 질문과 답변을 히든으로 가려줌 
		  $('span.faq-category.faq-cate2, span.faq-category.faq-cate4') 
		     .closest('.faq-item') 
		     .hide(); 

		  $('html, body').animate({ scrollTop: $('.tab-wrap').offset().top - 60 }, 300);

		});
		
		// 계정관리 탭 클릭 시
		$('.tab-type1 li:nth-child(4)').click(function() {
		  // 모든 FAQ 항목 보여주기 
		  $('.faq-item') 
		     .show(); 

		    // 회원가입과 로그인에 대한 질문과 답변을 히든으로 가려줌 
		    $('span.faq-category.faq-cate2, span.faq-category.faq-cate3') 
		      .closest('.faq-item') 
		      .hide(); 

		    $('html, body').animate({ scrollTop: $('.tab-wrap').offset().top - 60 }, 300);

		});
	});


</script>
            <!-- // contents -->

	<!-- footer -->
           <jsp:include page="../include/footer.jsp"/>
	<!-- /footer -->
	
        </div>
    </body>
</html>