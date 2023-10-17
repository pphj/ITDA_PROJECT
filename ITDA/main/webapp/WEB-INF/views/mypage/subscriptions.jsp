<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>MY : 잇다</title>
<!-- 		<link rel="stylesheet" href="re/css/premium_service2.css"> -->
<!-- 		<link rel="shortcut icon" type="image/x-icon" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/favicon_M.ico" />	
 -->	
	<!--헤더 로고 이미지 사이즈 별로 설정하기-->
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164253-6d7db59565-l82xv";
		var nelo = {
			sampleNumber : 100,
			maxCount : 100,
			maxSendMessage : "로그 전송 최대치 도달"
		};

		var isGreendot = document.cookie.indexOf("MM_NEW=1") > -1;

		var domain = "https://contents.premium.naver.com";
		var ajaxDomain = "";
		var MEDIA_GW_DOMAIN = "https://media-gw.naver.com";
		var PREMIUM_GW_DOMAIN = "https://premium-gw.naver.com";
		var PREMIUM_LOG_DOMAIN = "https://l.premium.naver.com";
		var urlPrefix = "";
		var newsDomain = "";
		var layoutName = "my_subscriptions";

		var unitIds = [];
		var divIds = [];
		var ArticleAd = {};

		var _paq = window._paq = window._paq || [];
		_paq.push(["setDocumentTitle", layoutName + " / " + document.title]);
		_paq.push(["trackPageView"]);
		_paq.push(["enableLinkTracking"]);
		_paq.push(["setTrackerUrl", PREMIUM_LOG_DOMAIN + "/matomo"]);
		_paq.push(["setSiteId", "1"]);

		var isPremiumReferer = false;
	</script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_common.min.js"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body class="as_my_home body_mp as_my_home">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>

<!-- <header class="flat_header_wrap as_my_home">
	<div class="flat_header">
	<h1 class="flat_header_logo">
	헤더 로고 (클릭 시 메인으로 이동)
	<a href="/" class="link_premium" data-clk="my_lnb.pclogo"><span class="blind">Premium Contents</span></a>
	</h1>
	<a href="#" class="button_close _BACK_ELSE_CLOSE" data-clk="my_lnb.close">
		<span class="blind">이전으로</span>
	</a>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner as_pc">
			MY
		</span>
	</h2>
	</div>
</header>
<hr> -->
<script>
	var svt = "20230917171820.949";
	var timestamp = svt.substr(0, 8);
	var isLogin = true;

	var service = {
		premium: true
	};

	var analyticsNtmUrl = "https://ntm.pstatic.net/scripts/ntm_774a0c8e7c40.js";

	var envPhase = "production";
	var isProduction = true;
</script>
<div id="ct_wrap" class="container">
	<div id="ct" class="container_inner">
			    <div class="flat_header">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_premium" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			MY
		</span>
	</h2>
	</div>
		<div class="container_main">
			<div class="container_sidebar _CONTAINER_SIDEBAR">
				<div class="container_sidebar_inner _GRID_TEMPLATE_COLUMN_SIDEBAR _CONTAINER_SIDEBAR_INNER"></div>
			</div>
			<div class="container_content _GRID_TEMPLATE_COLUMN _STICKY_CONTENT">
			<div class="_TEMPLATE _LAZY_LOADING_WRAP is_hidden" data-template-id="SCS_PREMIUM_SIDEBAR_MY" data-grid-template-column-sidebar="true">
			<jsp:include page="../mypage/sidebar.jsp"></jsp:include>
<%-- 	<div class="my_sidebar_box">
		<div class="my_user">
			<a href="${pageContext.request.contextPath}/user/myInfo" class="my_user_modify_link">
				<div class="my_user_img_wrap">
				</div>
				<strong class="my_user_name">
					${user.userName} 
				</strong>
			</a>
			<div class="my_user_link_wrap">
				<a href="${pageContext.request.contextPath}/my/payment/subscriptions" class="my_user_link is_payment" data-clk="my_lnb.paydet">결제내역</a>
				<a href="${pageContext.request.contextPath}/my/coupons" class="my_user_link is_coupon" data-clk="my_lnb.coupon">쿠폰</a>
				<a href="${pageContext.request.contextPath}/my/notification" class="my_user_link is_setting" data-clk="my_lnb.set">설정</a>
			</div>
		</div>
		<div class="my_tab_wrap">
			<ul class="my_tab">
				<li class="my_tab_item is_active">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_lnb.substab"><span class="my_tab_text">구독 채널</span></a>
				</li>
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/contents" data-clk="my_lnb.constab"><span class="my_tab_text">관심 콘텐츠</span></a>
				</li>
			</ul>
		</div>
	</div> --%>
	<div class="sidebar_banner _LAZY_LOADING_ERROR_HIDE">
		<a href="https://blog.naver.com/premiumcontents/223186087023" data-clk="my_lnb.banner">
		<!--프리미엄 콘텐츠 소개페이지로 넘어감-->
			<img class="_LAZY_LOADING" data-src="https://ssl.pstatic.net/static.news/image/news/m/2023/08/18/sidebar_banner.jpg" width="315" height="110" alt="">
		</a>
	</div>
</div>
<div class="my_section">
	<h2 class="my_section_title">구독 채널</h2>
	<div class="my_subscriptions_tab">
		<ul class="my_subscriptions_tab_list" role="tablist">
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="true">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_subs.chl">채널<em>2</em></button>
			</li>
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="false">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions/contents" data-clk="my_subs.cont">최신 콘텐츠</button>
			</li>
		</ul>
	</div>
	<ul class="my_channel_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_SUBSCRIPTION_LIST" data-cursor-name="next" data-cursor="" data-has-next="">
		<li class="my_channel_item">
			<a href="${pageContext.request.contextPath}/bangkuseok/bangkuseok1" class="my_channel_thumb" data-clk="my_subs.list">
				<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="48" height="48" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
				<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
			</a>
			<div class="my_channel_text">
				<a href="${pageContext.request.contextPath}/bangkuseok/bangkuseok1" class="my_channel_link" data-clk="my_subs.list">
					<div class="my_channel_name">
						<strong class="my_channel_name_text">방구석 어학연수</strong>
					</div>
					<div class="my_subscribe_date">
						<em class="my_channel_date_title">구독일</em>
						<div class="my_channel_date_text">2023.09.08.</div>
					</div>
				</a>
				<div class="my_channel_manage">
					<a href="${pageContext.request.contextPath}/my/subscriptions/uUtQWjKKnwYRanZ" class="my_channel_manage_link" data-clk="my_subs.manage">구독관리</a>
				</div>
			</div>
		</li>
		<li class="my_channel_item">
			<a href="/chemistryeverywhere/knowledge" class="my_channel_thumb" data-clk="my_subs.list">
				<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="48" height="48" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
				<i class="icon_partner"><span class="blind">파트너 채널</span></i>
			</a>
			<div class="my_channel_text">
				<a href="/chemistryeverywhere/knowledge" class="my_channel_link" data-clk="my_subs.list">
					<div class="my_channel_name">
						<strong class="my_channel_name_text">이광렬의 &quot;모두를 위한 화학&quot;</strong>
					</div>
					<div class="my_subscribe_date">
						<em class="my_channel_date_title">구독일</em>
						<div class="my_channel_date_text">2023.09.04.</div>
					</div>
				</a>
				<div class="my_channel_manage as_partner">
					<a href="${pageContext.request.contextPath}/my/subscriptions/partner/chemistryeverywhere/knowledge" class="my_channel_manage_link" data-clk="my_subs.manage">구독관리</a>
				</div>
			</div>
		</li>
	</ul>
	<div class="loading _CONTENT_LIST_LOADING" style="display:none;">
		<div class="loader">
			<div class="dot dot1"></div>
			<div class="dot dot2"></div>
			<div class="dot dot3"></div>
			<div class="dot dot4"></div>
			<div class="dot dot5"></div>
			<div class="dot dot6"></div>
		</div>
	</div>
</div>

			</div>
			<div class="container_aside _CONTAINER_ASIDE">
				<div class="container_aside_inner _GRID_TEMPLATE_COLUMN_ASIDE _CONTAINER_ASIDE_INNER"></div>
			</div>
		</div>
		<div class="_GRID_TEMPLATE_COLUMN_OUTSIDE"></div>
	</div>
</div>
<div id="frontDetect"></div>
<div id="_LAYER_DIMMED" class="layer_dimmed" style="display:none;"></div>
<div id="_MODAL_WRAP"></div>
<script type="x-tmpl-mustache" class="_MODAL_TEMPLATE">
<div class="popup_layer{{#isClose}} as_close_button{{/isClose}}{{#popupClass}} {{popupClass}}{{/popupClass}} _MODAL">
	{{#description}}
	<strong class="popup_tit">{{{title}}}</strong>
	<p class="popup_sub_desc">{{{description}}}</p>
	{{/description}}
	{{^description}}
	{{#itemList.length}}
	<strong class="popup_tit">{{{title}}}</strong>
	<dl class="popup_dl">
		{{#itemList}}
		<div class="popup_description_wrap">
			<dt class="popup_dt">{{{key}}}</dt>
			<dd class="popup_dd">{{{value}}}</dd>
		</div>
		{{/itemList}}
	</dl>
	{{/itemList.length}}
	{{^itemList.length}}
	<p class="popup_desc">{{{title}}}</p>
	{{/itemList.length}}
	{{/description}}
	{{#linkButtonList.length}}
	<div class="popup_link_wrap">
		{{#linkButtonList}}
		<a href="{{url}}" class="popup_link">
			<div class="popup_link_text">{{{title}}}</div>
			{{#description}}
			<div class="popup_link_desc">{{{description}}}</div>
			{{/description}}
		</a>
		{{/linkButtonList}}
	</div>
	{{/linkButtonList.length}}
	{{#isClose}}
	<button type="button" class="popup_close_button _MODAL_CANCEL"><i class="icon_close">닫기</i></button>
	{{/isClose}}
	{{^isHiddenConfirm}}
	<div class="popup_button_wrap">
		{{#isCancel}}
		<button type="button" class="button_layer _MODAL_CANCEL">
			{{cancelMessage}}
		</button>
		{{/isCancel}}
		<button type="button" class="button_layer type_confirm _MODAL_CONFIRM">
			{{confirmMessage}}
		</button>
	</div>
	{{/isHiddenConfirm}}
</div>
</script>
<div id="_TOAST_WRAP"></div>
<script type="x-tmpl-mustache" class="_TOAST_TEMPLATE">
<div class="toast_popup_layer">
	<p class="toast_popup_desc">{{{text}}}</p>
</div>
</script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>
<script>
$(window).on("load", function() {
	var $content = $("#_SE_VIEWER_CONTENT, ._VOD_PLAYER_WRAP");

	if ($content.length > 0 && $content.hasClass("_NIL_SEND") === true) {
		window.ntm = window.ntm || [];

		var ntmOption = {};


		var cpName = $content.data("cp-name");
		var subId = $content.data("sub-id");
		var contentId = $content.data("content-id");
		var contentAuth = $content.data("content-auth");
		var isMembership = $content.data("is-membership");
		var isPromotion = $content.data("is-promotion");
		var isPreview = $content.data("is-preview");
		var partnerChannel = $content.data("partner-channel");
		var partnerType = $content.data("partner-type");
		var type = $content.data("type");
		var subType = $content.data("sub-type");
		var userType = 0;

		if (contentAuth === true) {
			userType = 1;
		}

		var source = "";
		var sourceId = "";

		ntmOption["hitType"] = "cv";
		ntmOption["eventCategory"] = "post_view";

		ntmOption["channelId"] = cpName + "_" + subId;
		ntmOption["uri"] = "https://contents.premium.naver.com/" + cpName + "/" + subId + "/contents/" + contentId;
		ntmOption["userType"] = userType;
		ntmOption["dimension1"] = cpName;
		ntmOption["dimension2"] = isMembership == true ? "original" : "preview";
		if (isPromotion == true) {
			ntmOption["dimension3"] = "free";
		}

		if (source) {
			ntmOption["dimension4"] = source;

			if (sourceId) {
				ntmOption["dimension5"] = sourceId;
			}
		}

		if (partnerChannel) {
			ntmOption["dimension6"] = partnerChannel === "Y" ? "partner" : "premium";
		}

		if (partnerType) {
			ntmOption["dimension7"] = partnerType.toLowerCase();
		}

		if ("VIDEO" === subType) {
			ntmOption["dimension8"] = "video";
		}

		if (!!!isPreview) {
			ntm.push({
				event: "nilSend",
				ni: ntmOption
			});

			var eventType = "onpagehide" in window ? "pagehide" : "beforeunload";
			$(window).on(eventType, function() {
				ntmOption["hitType"] = "event";
				ntmOption["eventCategory"] = "action";
				ntmOption["eventAction"] = "leave";

				ntm.push({
					event: "nilSend",
					ni: ntmOption
				});
			});

		}
	}
});
</script>

</body>
<script>
var eventType = "onpageshow" in window ? "pageshow" : "load";
$(window).on(eventType, function() {
	var additionalInfo = {};

	var sti = "";
	if (sti) {
		additionalInfo["sti"] = sti;
	}

	var $content = $("#_SE_VIEWER_CONTENT, ._VOD_PLAYER_WRAP");

	var gdid = $content.data("gdid");
	if (gdid) {
		window.lcsResult = lcs_do_gdid(gdid, additionalInfo);
	} else {
		window.lcsResult = lcs_do(additionalInfo);
	}
});
</script>
</html>
