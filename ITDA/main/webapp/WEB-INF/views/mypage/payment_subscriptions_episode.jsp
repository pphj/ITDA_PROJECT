<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>MY : 잇다</title>
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-9fftb";
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
		var layoutName = "my_payment_subscription";

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
<body class=" body_mp">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<script>
	var svt = "20230917181250.936";
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
			<a href="https://nid.naver.com/user2/help/myInfo?lang=ko_KR" class="my_user_modify_link" data-clk="my_lnb.myinfo">
				<div class="my_user_img_wrap">
				</div>
				<strong class="my_user_name">
					${user.userName}
				</strong>
			</a>
			<div class="my_user_link_wrap">
				<a href="${pageContext.request.contextPath}/my/payment/subscriptions" class="my_user_link is_payment is_active" data-clk="my_lnb.paydet">결제내역</a>
				<a href="${pageContext.request.contextPath}/my/coupons" class="my_user_link is_coupon" data-clk="my_lnb.coupon">쿠폰</a>
				<a href="${pageContext.request.contextPath}/my/notification" class="my_user_link is_setting" data-clk="my_lnb.set">설정</a>
			</div>
		</div>
		<div class="my_tab_wrap">
			<ul class="my_tab">
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="/my/subscriptions" data-clk="my_lnb.substab"><span class="my_tab_text">구독 채널</span></a>
				</li>
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="/my/contents" data-clk="my_lnb.constab"><span class="my_tab_text">관심 콘텐츠</span></a>
				</li>
			</ul>
		</div>
	</div> --%>
	<div class="sidebar_banner _LAZY_LOADING_ERROR_HIDE">
		<a href="https://blog.naver.com/premiumcontents/223186087023" data-clk="my_lnb.banner">
			<img class="_LAZY_LOADING" data-src="https://ssl.pstatic.net/static.news/image/news/m/2023/08/18/sidebar_banner.jpg" width="315" height="110" alt="">
		</a>
	</div>
</div>
<div class="my_detail_head">
	<a href="/bangkuseok/bangkuseok1" class="my_detail_head_thumb" data-clk="my_order.chlgo">
<%-- 		<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="46" height="46" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
 --%>		<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
	</a>
	<a href="/bangkuseok/bangkuseok1" class="my_detail_head_name" data-clk="my_order.chlgo">방구석 어학연수</a>
</div>
<div class="my_detail_card">
	<div class="membership_card">
		<div class="mc_content">
			<div class="mc_text">
				<span class="mct_sub">
					<span class="mct_sub_text">개인</span>
					<span class="mct_sub_text">월간이용권</span>
				</span>
				<strong class="mct_name">방구석 어학연수</strong>
			</div>
			<div class="mc_price_info">
				<span class="mcp_price"><em class="mcp_number">4,900</em><span class="mcp_text">원/월</span></span>
			</div>
		</div>
	</div>
</div>
<div class="my_detail_talk">
	<a href="#" class="my_detail_talk_link _TALKTALK_INQUIRY" data-clk="my_order.talk" data-talktalk-url="talk.naver.com/w45kvq" data-purchase-no="2960786403">톡톡 문의하기</a>
</div>
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">구매 상품 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>상품명</dt>
			<dd><div class="my_detail_info_name">방구석 어학연수</div></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>채널명</dt>
			<dd>방구석 어학연수</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>이용회차</dt>
			<dd><span class="num">1</span>회차</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>이용기간</dt>
			<dd><span class="num">2023.09.08. ~ 2023.10.08.</span></dd>
		</div>
	</dl>
</div>
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">판매자 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>대표자</dt>
			<dd>잇다(주)</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>주소</dt>
			<dd>(우:<span class="num">12345</span>)<br>
				서울특별시 종로구 종로0길 </dd>
		</div>
		<div class="my_detail_info_item">
			<dt>이메일</dt>
			<dd><span class="num">itda@otda.com</span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>전화번호</dt>
			<dd><span class="num">1588-1588</span></dd>
		</div>
	</dl>
</div>
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">구매 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>구매상태</dt>
			<dd><em>결제 완료</em></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>구매번호</dt>
			<dd><span class="num">2960786403</span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제일</dt>
			<dd><span class="num">2023.09.08. 14:57</span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제수단</dt>
			<dd>쿠폰</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>상품금액</dt>
			<dd>
				<span class="num">4,900</span>원
			</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>할인금액</dt>
			<dd>
				<span class="num">-4,900</span>원
				<span class="my_detail_info_item_sub">(쿠폰: 무료 쿠폰)</span>
			</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제금액</dt>
			<dd><em><span class="num">0</span>원</em></dd>
		</div>
	</dl>
</div>
<div class="my_detail_button_wrap">
	<a href="#" class="my_detail_button _BACK" data-clk="my_order.back">이전</a>
</div>
<div class="my_detail_guide">
	<strong class="my_detail_guide_title">구매 취소 안내</strong>
	<ul class="my_detail_guide_list">
		<li class="my_detail_guide_item">결제일 기준 7일 이내 콘텐츠 이용 이력이 없는 경우 청약철회등이 가능하며 전액 환불됩니다.</li>
		<li class="my_detail_guide_item"><strong>구독 상품은 구독 해지 후 환불 신청이 가능합니다.</strong><br>구독 해지는 'MY > 구독 채널  탭 > 해당 구독 채널 상세페이지'에서 확인 가능합니다. <a href="/my/subscriptions" class="my_detail_guide_item_link" data-clk="my_order.">[구독채널 보기]</a></li>
		<li class="my_detail_guide_item">상품의 콘텐츠 이용이 개시된 경우 또는 구매 후 이용가능한 날로부터 7일이 경과된 경우 청약철회가 제한될 수 있습니다.</li>
		<li class="my_detail_guide_item">단건 상품 중 라이브 유형의 상품은 상품 특성상 라이브 제공 개시 전까지만 청약철회등 가능하며, 일단 라이브가 시작되면 이용하지 않았더라도 청약철회등이 불가능할 수 있습니다.</li>
		<li class="my_detail_guide_item">청약철회등 및 결제 취소/환불 관련 자세한 사항은 이용 중이신 프리미엄콘텐츠 채널 하단 푸터에 노출된 판매자의 연락처로 문의해 주시기 바랍니다.</li>
	</ul>
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
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
