\
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
		<meta charset="UTF-8">
        <title>FAQ</title>
       <!--  <link rel="canonical" href="https://www.hankyung.com/help">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
        <meta name="robots" content="index,follow">

        <meta name="title" content="고객센터">
        <meta name="description" content="한경 고객센터, 성공을 부르는 습관 한국경제신문 한경닷컴">
        <meta name="author" content="한국경제">

        <meta property="og:title" content="고객센터 | 한국경제">
        <meta property="og:url" content="https://www.hankyung.com/help">
        <meta property="og:type" content="website">
        <meta property="og:description" content="한경 고객센터, 성공을 부르는 습관 한국경제신문 한경닷컴">
        <meta property="og:site_name" content="hankyung.com"/>
        <meta property="og:image" content="https://static.hankyung.com/img/logo/logo-news-sns.png">
        <meta property="og:image:width" content="200">
        <meta property="og:image:height" content="200">

        <meta name="twitter:card" content="summary_large_image">
        <meta name="twitter:title" content="고객센터 | 한국경제">
        <meta name="twitter:description" content="한경 고객센터, 성공을 부르는 습관 한국경제신문 한경닷컴">
        <meta name="twitter:image:src" content="https://static.hankyung.com/img/logo/logo-news-sns.png">

        <meta itemprop="name" content="고객센터 | 한국경제">
        <meta itemprop="description" content="한경 고객센터, 성공을 부르는 습관 한국경제신문 한경닷컴">
        <meta itemprop="image" content="https://static.hankyung.com/img/logo/logo-news-sns.png"> -->

        <link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
        <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png">
        <link rel="stylesheet" href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309221514">
        <link rel="stylesheet" href="https://static.hankyung.com/resource/www/help/css/help.css?v=202309221514">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info/info.css" rel="stylesheet" />

        <script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
		<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
		<script type="text/javascript" src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309221514" async="true"></script>
		<jsp:include page="../include/header.jsp"/>
		
		
    </head>
    <body>
        <div id="wrap" class="wrap sub">
            <!-- skip navi -->
            <div class="skip_navi">
                <a href="#contents">본문 바로가기</a>
            </div>
            <!-- header -->
            <!-- <header class="header">
                <div class="layout-inner">
                    <div class="header-top">
                        <div class="logo-section">
                            <a href="https://www.hankyung.com/" class="logo-hk"><span class="blind">한국경제</span></a>
                            <h1>
                                <a href="https://www.hankyung.com/help" class="section-title">고객센터</a>
                            </h1>
                        </div>
                        로그인 전
<div class="item login-area ms-3 login_link" style="display:none;">
	<a role="button" class="login-link btn-info">
		<svg width="12" height="12" viewBox="0 0 12 12">
			<path d="m9.5,3.5c0,1.9-1.6,3.5-3.5,3.5s-3.5-1.6-3.5-3.5S4.1,0,6,0s3.5,1.6,3.5,3.5Zm-.8,3.6c-.8.6-1.7.9-2.7.9s-1.9-.3-2.7-.9c-2,.9-3.3,3.7-3.3,4.9h12c0-1.2-1.3-4-3.3-4.9Z" class="svg-icon"></path>
		</svg>
		<span id="login_txt" class="txt">로그인</span>
	</a>
</div>

로그인 후
<div class="login-area ms-3 login-info" style="display:none;">
	<a role="button" class="login-link btn-info">
		<svg width="12" height="12" viewBox="0 0 12 12">
			<path d="m9.5,3.5c0,1.9-1.6,3.5-3.5,3.5s-3.5-1.6-3.5-3.5S4.1,0,6,0s3.5,1.6,3.5,3.5Zm-.8,3.6c-.8.6-1.7.9-2.7.9s-1.9-.3-2.7-.9c-2,.9-3.3,3.7-3.3,4.9h12c0-1.2-1.3-4-3.3-4.9Z" class="svg-icon"></path>
		</svg>
		<span id="login_txt" class="txt user-name">내정보</span>
	</a>
	<div class="layer-my">
		<div class="user-info">
			<div class="account-info">
				<p class="email">
					<span class="icon-mylogin"><span class="blind"></span></span>
					<span class="txt"></span>
				</p>
			</div>
			<div class="btns">
				<a href="https://id.hankyung.com/user/selectMyPage.do" class="btn-account">계정관리</a>
				<a role="button" class="btn-logout">로그아웃</a>
			</div>
		</div>

		<div class="subscription-info">
			<div class="mypages-area">
				<a href="https://www.hankyung.com/my-news">
					<span class="txt-en">My News</span>
				</a>
				<a href="https://markets.hankyung.com/my-stock">
					<span class="txt-en">My Stock</span>
				</a>
			</div>

			<dl class="details">
				<dt>구독내역</dt>
				<dd class="bioinsight">
					<a href="https://www.hankyung.com/bioinsight">한경 <span class="txt-en">BIO Insight</span></a>
					<a href="https://www.hankyung.com/bioinsight/guide" class="badge-subscribing">구독신청</a>
				</dd>
				<dd class="esg">
					<a href="https://www.hankyung.com/esg">한경 <span class="txt-en">ESG</span></a>
					<a href="https://www.hankyung.com/esg/guide" class="badge-subscribing">구독신청</a>
				</dd>
			</dl>
		</div>
	</div>
</div>

<script>
var url = escape(document.location.href);

// 회원가입 url 설정
$(".login_link .join-link").attr('href', 'https://id.hankyung.com/login/joinPage.do?url=' + url);

// 로그인 url 설정
$(".login_link .login-link").attr('href', 'https://member.hankyung.com/apps.frame/login?url=' + url);

// 로그아웃 url 설정
$(".login-area .btn-logout").attr('href', 'https://member.hankyung.com/apps.frame/login.work.logout?url=' + url);

// 개인정보 url 설정
$(".login-area .btn-account").attr('href', 'https://member.hankyung.com/apps.frame/member.main?url=' + url);



/**************************************************************************************************************/
// [로그인 유지 기능 도입] 시작
// by 현상은 on 2022-07-06
/**************************************************************************************************************/

// 통합회원 아이디
const user_id = $.cookie('UserId');
// 토큰 쿠키
const tokenCookie = $.cookie('ssoToken');

// 세션 체크 필요 여부
let checkFlag = false;


// 쿠키에 회원 아이디가 있는 경우
if( user_id )
{
	// 마지막 세션 체크 시간 쿠키
	const checkTimeCookie = $.cookie('ssoTokenCheckTime');

	if( checkTimeCookie )
	{
		const checkTime = new Date(checkTimeCookie);

		const today = new Date();

		// 오늘 날짜와 마지막 세션 체크일의 차이를 구한다.
		const betweenTimeDay = Math.floor((today.getTime() - checkTime.getTime()) / 1000 / 60 / 60 / 24);

		// 세션을 체크한지 1일이 경과한 경우 세션 체크 API를 호출한다.
		if( betweenTimeDay > 0 )
		{
			checkFlag = true;
		}
		else
		{
			setLogin(true);
		}
	}
	else
	{
		// 세션 체크 기록이 없으면 세션 체크 API를 호출한다.
		checkFlag = true;
	}
}
else
{
	// 토큰 쿠키가 있는 경우
	if( tokenCookie )
	{
		checkFlag = true;
	}
	// 토큰 쿠키가 없는 경우
	else
	{
		setLogin(false);
	}
}


// 세션 체크가 필요한 경우에만 API를 호출한다.
if( checkFlag == true )
{
	$.ajax({
		type : "POST",
		url : "https://member.hankyung.com/apps.frame/sso.check.token",
		crossDomain: true,
		dataType: 'jsonp',
		jsonp: 'jsonp_callback',
		data : {'token' : tokenCookie,
				'key' : "a8bdf898783883b64503b8915deeb57767f935a24daf44150723299c01c8898a",
				'fn' : "setLogin"
		}
	});
}



function setLogin(result)
{
	if(result == true || result.result_code == "0000")
	{
		// 세션 체크 API 결과가 정상인 경우 현재 날짜를 세션 체크 쿠키에 셋팅한다.
		if( result.result_code == "0000" )
		{
			// 현재 날짜를 가져온다.
			const now = new Date();
			const year	= now.getFullYear();
			const month	= ('0' + (now.getMonth() + 1)).slice(-2);
			const day	= ('0' + now.getDate()).slice(-2);
			const dateString = year + '-' + month  + '-' + day;

			// 브라우저 종료시 만료되는 쿠키를 셋팅한다.
			$.cookie('ssoTokenCheckTime', dateString, { expires: null, path: '/', domain: 'hankyung.com'});
		}




		// 이름대신 통합회원ID 입력
		// $(".login-info .user-name").text($.cookie("SSOid").split('@')[0]+'님');
		// $(".login-info .user-info .account-info .email").text($.cookie("SSOid"));

		// $(".login_link").hide();
		// $(".login-info").show();


		// 이름대신 통합회원ID 입력
		var iconLoginType = 'icon-mylogin-hk';
		if($.cookie("login_type")){
			iconLoginType = 'icon-mylogin-'+$.cookie("login_type");
		}
		var textLoingTypes = {
			'icon-mylogin-hk':'한경으로 로그인',
			'icon-mylogin-email':'한경으로 로그인',
			'icon-mylogin-kakao':'카카오로 로그인',
			'icon-mylogin-naver':'네이버로 로그인',
			'icon-mylogin-google':'구글로 로그인',
			'icon-mylogin-apple':'애플로 로그인'
		}

		var textLoingType = textLoingTypes[iconLoginType];

		$(".login-info .user-info .account-info .email span.icon-mylogin").addClass(iconLoginType).removeClass('icon-mylogin');
		$(".login-info .user-info .account-info .email span.blind").text(textLoingType);

		$(".login-info .user-info .account-info .email .txt").text($.cookie("SSOid"));

		$(".login_link").remove();
		$(".login-info").show();

	}
	else
	{
		// $(".login_link").show();
		// $(".login-info").hide();

		$(".login-info").remove();
		$(".login_link").show();
	}
}

/**************************************************************************************************************/
// [로그인 유지 기능 도입] 종료
/**************************************************************************************************************/

function getPaymentCheck(){
	$.ajax({
		url: 'https://www.hankyung.com/action/checkPayment'
		, async: false
		, type: 'POST'
		, data:{
			userId: $.cookie('SSOid')
			, PayNews: $.cookie('PayNews')
			, PayNews_esg: $.cookie('PayNews_esg')
		}
		, success: function(result){
			$.each(result, function(idx, val){
				if(val == 'Y'){
					$(".login-info .subscription-info dd."+idx+" .badge-subscribing").text("구독내역");
					$(".login-info .subscription-info dd."+idx+" .badge-subscribing").attr("href", "https://www.hankyung.com/"+idx+"/mypage/pay");
				}else{
					$(".login-info .subscription-info dd."+idx+" .badge-subscribing").text("구독신청");
					$(".login-info .subscription-info dd."+idx+" .badge-subscribing").attr("href", "https://www.hankyung.com/"+idx+"/guide");
				}
			});
		}
		, error: function(xhr, status, responseTxt){
			console.log(xhr);
		}
	});
}

// 사용자명 클릭
$('.user-name').on("click", function(e){
	e.preventDefault();
	getPaymentCheck();
	$('.layer-my').toggleClass('active');
});

$(document).on('mouseup',function(e){
	// 사용자 정보 off
	if (!$(e.target).is('.layer-my') && !$(e.target).parents().is('.layer-my') && !$(e.target).is('.login-link') && !$(e.target).is('.icon-myinfo') && !$(e.target).is('.tool-user *')){
		$('.layer-my').removeClass('active');
	};

	// 전체메뉴창 off
	if (!$(e.target).hasClass('layer-allmenu') && !$(e.target).parents().hasClass('layer-allmenu') && !$(e.target).hasClass('btn-allmenu') && !$(e.target).parents().hasClass('btn-allmenu')) {
		$('.layer-allmenu').removeClass('active');
		$('body').removeClass("open-allmenu");
	};

	// 검색창 off
	if (!$(e.target).is('.layer-search') && !$(e.target).parents().is('.layer-search')){
		$('.search-area').removeClass('active');
	};

	// 하위 서브메뉴 off(탑헤더, 메인 gnb)
	if (!$(e.target).is('.gnb-dropdown-menu') && !$(e.target).parents().is('.gnb-dropdown-menu') && !$(e.target).parents().is('.gnb-dropdown-menu, .gnb-dropdown-toggle')){
		$('.gnb-dropdown').removeClass('focus');
		$('.gnb-dropdown.type-click').removeClass('active');
		$('.gnb-dropdown.type-click .gnb-dropdown-menu').slideUp();
	};
});

// 스크롤 이동 시 내정보 레이어 삭제
$(window).scroll(function(){
	$('.layer-my').removeClass('active');
})

// 오늘날짜 구하기
const weekDay = ['일', '월', '화', '수', '목', '금', '토'];
let topToday = new Date();

let topYear = topToday.getFullYear()
, topMonth = topToday.getMonth() + 1
, topDay = topToday.getDate();

if(topMonth < 10) topMonth = '0'+topMonth;
if(topDay < 10) topDay = '0'+topDay;

$(".today-info").html('<span class="txt-date">'+topYear+'.'+topMonth+'.'+topDay+'</span> '+weekDay[topToday.getDay()]+'요일');

// family site 클릭
$('.gnb-section:not(.type-hover) .gnb-dropdown-toggle, .gnb-dropdown.type-click .gnb-dropdown-toggle').on("click", function(e){
	e.preventDefault();
	var gnbDropdown = $(this).parents('.gnb-dropdown');
	if (gnbDropdown.hasClass('active')) {
		gnbDropdown.removeClass('active');
		gnbDropdown.find('.gnb-dropdown-menu').slideUp();
	}else {
		$('.gnb-dropdown.type-click').removeClass('active');
		$('.gnb-dropdown.type-click .gnb-dropdown-menu').slideUp();
		gnbDropdown.addClass('active');
		gnbDropdown.find('.gnb-dropdown-menu').slideDown();
	}
	return false;
});
</script>                    </div>
                    <ul class="gnb-section">
                        [D] 활성화 클래스 on
                        <li ><a href="https://www.hankyung.com/help/notice" target="">공지사항</a></li>
                        <li class="on"><a href="https://www.hankyung.com/help/faq" target=""><span class="txt-en">FAQ</span></a></li>
                        <li ><a href="https://www.hankyung.com/help/qna" target="">1:1문의<span class="icon-membersonly2">회원전용</span></a></li>
						<li ><a href="https://www.hankyung.com/help/policy" target="">운영정책</a></li>
                    </ul>
                </div>
            </header> -->
            <!-- // header -->

            <!-- contents -->
<!-- contents -->
 <div id="contents" class="contents">
	<div class="layout-inner">
		<section class="faq-wrap">
			<strong class="cont-tit txt-en">FAQ</strong>
			<div class="faq-menu-area">
				<ul class="faq-menu-list">

					<li class="on"><a href="${pageContext.request.contextPath}/info/faq" target="">FAQ</a></li>
					<li ><a href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
					<li ><a href="${pageContext.request.contextPath}/info/qna" target="">1:1문의<span class="icon-membersonly2">회원전용</span></a></li>
				</ul>

				<button type="button" class="btn-menu-more"><span class="blind">더보기</span></button>
			</div>

			<div class="faq-menu-cont">
				<div class="contents-tit-wrap">
					<h1 class="contents-tit">회원가입·로그인</h1>
				</div>

				<div class="tab-wrap">
					<div class="inner-scroll">
						<ul class="tab tab-type1">
							<li class="on">
								<a role="tab" aria-selected="true" href="${pageContext.request.contextPath}/info/faq">전체</a>
							</li>
							<li >
								<a role="tab" aria-selected="false" href="https://www.hankyung.com/help/faq/account?cate=15">소셜</a>
							</li>
							<li >
								<a role="tab" aria-selected="false" href="https://www.hankyung.com/help/faq/account?cate=14">회원가입</a>
							</li>
							<li >
								<a role="tab" aria-selected="false" href="https://www.hankyung.com/help/faq/account?cate=46">로그인</a>
							</li>
							<li >
								<a role="tab" aria-selected="false" href="https://www.hankyung.com/help/faq/account?cate=47">계정관리</a>
							</li>
						</ul>
					</div>
				</div>


				<div class="faq-list ">
					<div class="faq-item" data-no="11"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								소셜 회원가입은 어떻게 하나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									소셜 회원가입은 별도의 회원가입 단계를 거치지 않고 사용중인 SNS의 계정을 이용해서 필수 약관만 동의하여 회원이 되는 방법입니다. 로그인 수단으로 사용하고자 하는 SNS에 로그인 한 후 연동약관에 동의하고 한국경제 회원약관에 동의하면 간편히 회원가입이 완료됩니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="12"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								기존에 이메일로 가입한 사용자는 소셜가입을 할 수 없나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									소셜 가입은 신규회원부터 가능합니다. 이전에 가입한 사용자는 가입된 이메일주소와 다른 SNS서비스로 다시 가입하거나 탈퇴 후 가입하셔야 합니다. 단, 탈퇴후 30일이 지나야 재가입이 가능하며 사용중인 유료상품이 있을 경우 새 아이디로 이전은 불가능하니 유의하시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="13"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								네이버 소셜 가입을 하려고 하는데 이미 네이버 소셜로 가입된 계정이라고 합니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									한국경제 회원은 가입수단과 관계없이 이메일주소로 회원을 식별합니다. 소셜가입 하려는 네이버 계정의 연락처이메일이 이미 가입된 네이버계정의 이메일로 설정되어있을 경우 이미 가입된 계정으로 인식합니다. 네이버 뿐 아니라 카카오나 애플에서도 대표이메일을 다르게 설정했을 경우 이미 가입된 계정이라고 안내될 수 있습니다.<br />
1) 네이버PC: 네이버 홈페이지에서 로그인 > 닉네임 클릭 > 내프로필 > 연락처이메일 변경<br />
2) 카카오톡앱: 카카오톡 실행 > 더보기 > 설정 > 카카오계정 > 대표이메일 변경<br />
3) 애플:애플 홈페이지에서 로그인 > https://appleid.apple.com/account/manage 접속 > 로그인 및 보안 > Apple ID > Apple ID 변경
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="14"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								네이버로 소셜가입한 한국경제계정을 탈퇴한 후 다른 네이버 계정으로 다시 소셜 가입하려고 했더니 탈퇴계정이라고 안내가 되고 회원가입이 진행이 되지 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									브라우저를 사용할 때 일부 웹사이트 정보는 캐시 및 쿠키 형태로 저장됩니다. 브라우저에 남아있는 탈퇴한 계정정보의 캐시 및 쿠키를 삭제해주세요.<br />
<br />
* 캐시 삭제 안내<br />
1. PC<br />
- 크롬 브라우저<br />
1) 오른쪽 상단에서 더보기(...)를 클릭합니다.<br />
2) [도구 더보기] > [인터넷 사용 기록 삭제]를 클릭합니다.<br />
3) 상단에서 기간을 선택합니다. 모든 항목을 삭제하려면 [전체]를 선택합니다.<br />
4) '캐시된 이미지 또는 파일'과 '쿠키 및 기타 사이트 및 프러그인 데이터' 옆의 체크박스를 선택합니다.<br />
<br />
- 엣지(Edge) 브라우저<br />
1) 오른쪽 상단에서 더보기(...)를 클릭합니다.<br />
2) [설정] > [개인 정보 및 서비스]를 클릭합니다.<br />
3) [검색 데이터 지우기 항목]에서 [지울 항목 선택] 버튼을 클릭합니다.<br />
4) 상단에서 시간 범위를 선택합니다. 모든 항목을 삭제하려면 [모든시간]을 선택합니다.<br />
5) '쿠키 및 기타 사이트 데이터'와 '캐시된 이미지 및 파일'을 선택합니다. <br />
6) [지금 지우기] 버튼을 클릭합니다.<br />
<br />
2. 안드로이드(갤럭시)<br />
- 크롬 브라우저<br />
1) 오른쪽 상단의 더보기 > 방문기록을 클릭합니다.<br />
2) 인터넷 사용 기록 삭제...을 클릭합니다.<br />
3) 상단에서 기간을 선택합니다. 모든 항목을 삭제하려면 '전체기간'을 선택합니다.<br />
4) 인터넷 사용 기록 삭제를 클릭합니다.<br />
<br />
- 삼성 브라우저<br />
1) 오른쪽 하단에서 메뉴바 > 설정을 클릭합니다.<br />
2) 인터넷 사용 기록을 클릭합니다.<br />
3) 인터넷 사용 기록 삭제를 클릭합니다.<br />
4) 사용기록, 쿠키 및 사이트 데이터, 캐시 이미지와 파일을 체크한 후 삭제 버튼을 클릭합니다.<br />
<br />
3. iOS(아이폰)<br />
- 크롬 브라우저<br />
1) 오른쪽 하단의 더보기(...) > 방문기록을 클릭합니다.<br />
2) 인터넷 사용 기록 삭제를 클릭합니다.<br />
3) 상단에서 기간을 선택합니다. 모든 항목을 삭제하려면 '전체기간'을 선택합니다.<br />
4) 인터넷 사용 기록 삭제를 클릭합니다.<br />
<br />
- 사파리(Safari)<br />
1) 홈 화면에서 설정 앱을 실행 후 사파리 앱을 선택합니다.<br />
2) 방문 기록 및 웹 사이트 데이터 지우기를 클릭합니다.<br />
3) 방문 기록 및 데이터 지우기를 클릭합니다.<br />
<br />
캐시 및 쿠키를 삭제하면 다음과 같은 결과가 나타나오니 유의하시기바랍니다.<br />
- 사이트의 일부 설정이 삭제됩니다. 예를 들어, 로그인한 상태라면 다시 로그인해야합니다.<br />
- 이미지 등 일부 콘텐츠를 다시 로드해야 하기 때문에 일부 사이트가 느려질 수 있습니다. 다음 방문 시에는 이미지 등 페이지의 일부를 기억하고 있기 때문에 더 빠르게 열 수 있습니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="15"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								카카오톡 인앱 브라우저로 구글로 소셜 로그인을 시도하였으나, "액세스 차단됨: 승인 오류" 라는 메시지가 뜹니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									구글은 카카오톡 내앱 브라우저에서의 접속 시도를 정상적이지 않은 접근(웹뷰)으로 판단하며 차단합니다. 구글 소셜 로그인을 하려면 카카오톡이 아닌, 다른 브라우저(삼성, 사파리, 크롬 등)에서 진행해주시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="16"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								계정관리에서 보이는 이름과 휴대전화번호 정보를 수정하고 싶습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									현재 계정관리에서 이름과 휴대전화번호를 수정하는 기능은 제공되지 않습니다. 이메일문의 또는 유선으로 문의주시면 도와드리겠습니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="17"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate1">소셜</span>
							<em class="faq-q">
								소셜 로그인으로 꾸준히 사용중이었는데, 어느날 접속했더니 회원가입으로 연결됩니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									접속한 기기의 브라우저에 로그인된 계정이 평소 로그인할 때 사용하던 계정이 맞는지 확인해주세요. 구글이나 네이버는 하나의 기기에 여러개의 아이디가 로그인되어있을 수 있습니다. 모두 로그아웃한 후 한국경제에 소셜 가입했던 계정으로 로그인 후 다시 시도해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="1"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								회원가입은 어떻게 하나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									웹사이트 우측 상단 로그인 옆 회원가입 버튼을 통해 회원가입을 할 수 있습니다.<br />
1) 이메일로 회원가입: 이메일주소를 아이디로 하며 이메일 소유 인증 후 가입됩니다.<br />
2) 소셜로 회원가입: 사용하는 SNS계정 정보를 이용하여 간편하게 회원가입이 진행됩니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="2"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								아이디가 유효하지 않는다고 뜹니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									[이메일로 회원가입]시 @를 포함한 이메일 형식으로 입력해야 합니다. 올바르게 입력했을 경우 "사용 가능한 아이디 입니다"라는 안내 문구가 나타납니다. <br />
예) hkinfo@hankyung.com
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="3"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								이메일로 인증번호가 오지 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									인증번호가 오지 않을 경우 아래 내용을 확인해보세요.<br />
1) 네트워크 상황에 따라 인증번호 발송이 오래걸릴 수 있습니다. 계속 기다려도 인증번호가 수신되지 않으면 다시한번 인증번호발송을 진행해주세요.<br />
2) 입력한 이메일주소가 올바른지 한번 확인해주세요. 오탈자나 대소문자가 바르게 입력되었는지 확인해주세요.<br />
3) 사용하는 메일솔루션의 스팸메일함을 확인해주세요. 기업의 메일을 스팸으로 인식하는 경우가 있습니다.<br />
4) 입력한 메일주소가 법인 이메일의 경우 회사 전산팀에서 차단하는 경우가 있습니다. 회사메일이라면 회사 전산팀에 문의해주시거나 개인메일을 이용해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="4"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								인증번호를 입력했는데, 인증번호 인증이 되질 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									인증번호를 입력 후 [인증번호 확인]을 클릭해야 인증단계가 완료됩니다. <br />
만약 [인증번호 확인] 을 클릭 했을 때 "인증번호가 일치하지 않습니다"라는 알림이 뜬다면 아래 내용을 확인해보세요.<br />
1) 인증번호는 숫자로만 이루어진 6자리 입니다. 공백 또는 문자를 오입력 했는지 확인 부탁드립니다.<br />
2) 인증번호 유효시간은 메일이 발송된 시점부터 30분입니다. 인증번호 메일 회신 후 30분이 지났다면 새로고침 후 인증단계를 다시 진행 부탁드립니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="5"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								이메일 인증이 완료됐는데 가입이 진행되지 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									이메일 인증이 완료됐는데도 가입이 진행되지 않는 경우는 다음과 같습니다.<br />
1) 이미 가입된 이메일인 경우 가입을 진행할 수 없습니다. 다른 이메일주소를 입력해주세요.<br />
2) 소셜로 가입된 이메일인 경우 가입을 진행할 수 없습니다. 소셜 로그인을 시도해보시거나 다른 이메일주소를 입력해주세요.<br />
3) 탈퇴한지 30일이 지나지 않으면 가입할 수 없습니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="6"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								비밀번호가 유효하지 않다고 합니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									비밀번호 양식은 다음과 같습니다.<br />
1) 10~30자의 영문, 숫자, 특수문자 중 2가지 이상의 조합으로 입력해주세요.<br />
2) 개인정보나 아이디와 비슷한 비밀번호는 사용하지 말아주세요.<br />
3) 사용가능한 특수문자는 ~, !, @, #, $, %, ^, &, *, (, ), _, +, = 입니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="7"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								기존 이메일로 회원가입한 계정을 소셜과 연결하려면 어떻게 해야 하나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									이메일 가입계정과 소셜 가입계정은 각각 분리된 계정이라 연동이 불가능합니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="8"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								네이버 소셜 회원가입을 클릭했는데 “네이버 소셜가입이 아니라 카카오 소셜로 가입된 계정"이라고 나옵니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									카카오 소셜 계정의 이메일주소가 네이버 이메일 주소로 되어있을 수 있습니다. 한국경제 회원은 이메일주소로 식별하고 있습니다. 고객님의 카카오톡 앱을 실행해서 더보기 > 설정(톱니바퀴 아이콘) > 카카오계정 클릭 > 계정정보의 이메일 클릭 > 대표 이메일을 확인해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="9"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								외국인 회원가입이 별도로 제공되나요? 
Is the foreign sign-in provided form separately?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									한국경제는 내국인과 외국인 회원을 따로 분류하지 않습니다. 일반적인 회원가입 과정과 동일하게 이메일 회원가입 또는 소셜 회원가입을 진행해주세요.<br />
Korean Economic Daily integration members do not classify Korean and foreign members separately. You can sign up after email authentication or SNS(Naver, Kakao, Google, Apple) like a regular membership in korean.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="10"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate2">회원가입</span>
							<em class="faq-q">
								만 14세 미만 사용자도 회원가입이 가능한가요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									만 14세 미만은 보호자 인증을 거친 후 회원가입이 가능합니다.<br />
1) [이메일로 회원가입]을 클릭합니다.<br />
2) 회원약관에서 '만 14세 이상 가입자입니다' 항목을 선택해제한 후 다음단계로 진행합니다.<br />
3) 보호자의 휴대전화번호 인증이 확인되면 회원가입이 완료됩니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="18"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								이메일로그인을 하려고 이메일과 비밀번호를 입력하였는데, 로그인이 되질 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									이메일 로그인 오류의 경우 다음과 같은 사항으로 로그인 실패 하실 수 있습니다.<br />
1) 아이디 입력란에 이메일형식으로 올바르게 입력하였는지 확인해주세요. 예) hkinfo@hankyung.com<br />
2) 이메일 또는 비밀번호를 기입해주실 때 복사&붙혀넣기를 할 경우 공백(띄어쓰기)이 포함될 수 있습니다. 공백이 포함되어있을 경우 로그인 정보가 불일치로 될 수 있습니다.<br />
3) 이메일주소로 회원가입이 아니라 소셜 계정으로 회원가입을 했다면 로그인이 되지 않습니다. [계정찾기] 를 통해 가입수단을 확인해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="19"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								소셜 계정으로 로그인을 하려고 이메일과 비밀번호를 입력하였는데, 로그인이 되질 않습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									소셜 가입자는 아이디와 비밀번호가 없습니다. 이메일과 비밀번호 입력란 아래에 있는 소셜 버튼을 클릭해서 로그인해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="20"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								로그인이 차단되었다고 나옵니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									한국경제 통합회원에서는 특정 IP 주소로 로그인을 비정상적으로 반복하여 시도할 경우, 비정상적인 접속을 막고 회원정보를 보호하기 위해 로그인을 임시 차단하고 있습니다. 자세한 내용은 고객센터로 문의주시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="21"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								'로그인 상태 유지'가 무엇인가요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									'로그인 상태 유지'란 아이디와 이메일주소를 매번 입력하지 않고, 로그인 상태를 유지하는 기능입니다. '로그인 상태 유지'에 체크한 후 로그인을 하면 직접 [로그아웃]을 누르거나 브라우저의 쿠키를 삭제하기 전까지는 로그인된 상태로 유지됩니다. 다만 너무 오랜 시간이 지나면 보안을 위해 자동으로 로그아웃됩니다. '로그인 상태 유지'는 개인정보 보호에 취약하니 공용 기기에서는 이용을 삼가해주시고 개인 기기에서만 사용해주세요.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="22"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								휴면계정 안내메일을 받았습니다. 휴면계정이 무엇인가요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									한국경제에서는 고객님의 개인정보보호를 위해 최근 1년간 로그인하지 않은 계정은 휴면상태로 전환하고 개인정보보호법에 따라 회원정보에서 분리해서 보관하고 있습니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="23"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate3">로그인</span>
							<em class="faq-q">
								휴면계정을 해제하려면 어떻게 해야 하나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									휴면으로 전환된 계정은 로그인 후 간단한 승인절차를 거쳐 바로 해제가 가능합니다. 사용하던 계정으로 로그인한 후 휴면계정 해제안내 페이지로 이동합니다. [휴면해제] 버튼을 클릭하면 휴면처리가 해제되고 서비스 이용이 가능합니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="24"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								아이디를 변경하고 싶습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									아이디는 변경할 수 없습니다. 다른 아이디를 만들고 싶다면 신규가입을 진행해주시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="25"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								비밀번호가 기억나지 않아요.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									비밀번호를 잊으셨다면 [계정찾기]에서 이메일주소 인증을 한 후 새 비밀번호를 입력해주세요.<br />
연동한 SNS의 비밀번호를 잊은 경우에는 해당 SNS의 홈페이지에서 비밀번호를 찾아주시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="26"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								회원 탈퇴를 하고 싶습니다.

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									로그인 후 웹페이지 우측 상단에 있는 [내 아이디]를 클릭> [계정관리] > [회원탈퇴] 의 순서로 탈퇴할 수 있습니다.<br />
1) 회원 탈퇴가 진행되면 데이터를 복구할 수 없으므로 신중히 진행해 주시기 바랍니다.<br />
2) 게시글 및 댓글 등의 커뮤니티 게시물은 탈퇴 후에도 남아있게 됩니다. 원치 않으신다면 삭제 후 탈퇴해주세요.<br />
3) 이용중인 구독서비스가 있다면 구독중지를 먼저 진행해주세요. 탈퇴 시 자동으로 구독 중지가 이루어지지 않습니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="27"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								회원 탈퇴 후 동일한 계정으로 회원가입을 할 수 있나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									회원 탈퇴 후 30일이 지나면 동일한 계정으로 재가입이 가능합니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="28"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								회원 탈퇴를 하면 구독중인 상품은 자동으로 중지 또는 환불이 되나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									회원 탈퇴 후 구독중인 상품은 자동으로 중지되지 않습니다. 회원 탈퇴 전에 구독중인 상품을 해지한 후 탈퇴하시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
					<div class="faq-item" data-no="29"> <!-- 활성화 .on -->
						<a role="button" class="faq-item-tit">
							<span class="faq-category faq-cate4">계정관리</span>
							<em class="faq-q">
								회원 탈퇴 후 동일한 계정으로 재가입하면 작성했던 댓글들을 삭제할 수 있나요?

							</em>
						</a>

						<div class="faq-item-cont">
							<div class="faq-cont-area">
								<div class="faq-a editor-area">

									탈퇴 후 30일이 지나 동일한 계정으로 재가입을 해도 탈퇴 이전의 댓글은 삭제할 수 없습니다. 댓글 삭제를 원하신다면 반드시 탈퇴 전에 해주시기 바랍니다.
								</div>
							</div>
							<ul class="down-list">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>



<script>

	$(function (){
		const urlParams = new URL(location.href).searchParams;

		const no = urlParams.get('no');
		// 검색페이지에서 진입 시 해당 컨텐츠 활성화
		if(no){
			$('.faq-item[data-no='+no+']').toggleClass('on');
			$('html, body').animate( { scrollTop : $('.faq-item[data-no='+no+']').offset().top }, 300 );
		}


		$('.faq-item-tit').click(function() {
			$(this).parents('.faq-item').toggleClass('on');
		});


		$('.btn-menu-more').click(function() {
			$(this).toggleClass('active');
			$(this).parents('.faq-menu-area').toggleClass('on');
		});


		function menuResize() {
			var faqHeight = $('.faq-menu-list').outerHeight();

			if(faqHeight > 86 && window.outerWidth < 1180) {
				$('.faq-menu-area').addClass('unfold');
			} else {
				$('.faq-menu-area').removeClass('unfold');
			};
		}
		menuResize();
		$(window).resize(function(){
			if (window.outerWidth < 1180) {
				menuResize();
			}
		});
	});
</script>
            <!-- // contents -->

	<!-- footer -->
           <jsp:include page="../include/footer.jsp"/>
	<!-- /footer -->
	
            <div class="btn-top-wrap">
                <div class="btn-position">
                    <a href="#wrap" class="btn-top"><span class="blind">상단 바로가기</span></a>
                </div>
            </div>
        </div>
    </body>
</html>