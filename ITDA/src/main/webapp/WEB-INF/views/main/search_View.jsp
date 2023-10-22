<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<title>채널 및 콘텐츠 검색</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/premium_service3.css">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/main/tv_icon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
	var g_ssc = nsc = "Mpremiumcontents.all";
	var g_default_area = "art";

	var svr = "one-service-premium-r-20230914-230914-164253-6d7db59565-l82xv";
	var nelo = {
		sampleNumber: 100,
		maxCount: 100,
		maxSendMessage: "로그 전송 최대치 도달"
	};

	var isGreendot = document.cookie.indexOf("MM_NEW=1") > -1;

	var domain = "https://contents.premium.naver.com";
	var ajaxDomain = "";
	var MEDIA_GW_DOMAIN = "https://media-gw.naver.com";
	var PREMIUM_GW_DOMAIN = "https://premium-gw.naver.com";
	var PREMIUM_LOG_DOMAIN = "https://l.premium.naver.com";
	var urlPrefix = "";
	var newsDomain = "";
	var layoutName = "channel_search";

	var unitIds = [];
	var divIds = [];
	var ArticleAd = {};

	var _paq = window._paq = window._paq || [];
	_paq.push(["setDocumentTitle", layoutName + " / " + document.title]);
	_paq.push(["trackPageView"]);
	_paq.push(["enableLinkTracking"]);
	_paq.push(["setTrackerUrl", PREMIUM_LOG_DOMAIN + "/matomo"]);
	_paq.push(["setSiteId", "1"]);

	var isPremiumReferer = true;
</script>

	<script src="${pageContext.request.contextPath}/resources/js/search/itda_common.js"></script>
</head>
<body class="">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<hr>
<script>
	var svt = "20230919175006.941";
	var timestamp = svt.substr(0, 8);
	var isLogin = false;

	var service = {
		premium: true
	};

	var analyticsNtmUrl = "https://ntm.pstatic.net/scripts/ntm_774a0c8e7c40.js";

	var envPhase = "production";
	var isProduction = true;
	
	
</script>
<div class="premium_search_page">
    <div class="psp_main">
        <div class="psp_head">
            <div class="psp_head_inner">
                <div class="psp_head_content">
                    <a href="#" class="psp_back_button _BACK" data-clk="pch_search.back"><span class="blind">뒤로가기</span></a>
                  <div class="psp_input_wrap _SEARCH_INPUT_WRAP non_searching">
				    <input id="_SEARCH_INPUT" type="text" class="psp_search_input" value="<%= request.getParameter("searchQuery") %>" data-url="/main/search" data-search-query="<%= request.getParameter("searchQuery") %>" autocomplete="off">
				    <button id="_SEARCH_RESET_BTN" type="button" class="psp_input_cancel_button" data-clk="pch_search.close">삭제</button>
				    
				</div>
                    <button type="button" class="psp_search_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.search" data-url="${pageContext.request.contextPath}/main/search" data-search-value="true"><span class="blind">검색</span></button>
                </div>
            </div>
        </div>
        <!-- 이 부분부터는 변경 없이 유지됩니다. -->
        <div class="psp_nav _SEARCH_RESULT_AREA">
	<div class="psp_nav_inner">
		<ul class="psp_nav_list" role="tablist">
			<li class="psp_nav_item" role="tab" aria-selected="true">
				<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.taball" data-url="/ch/search">전체</a>
			</li>
			<li class="psp_nav_item" role="tab" aria-selected="false">
				<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabch" data-url="/ch/search/channel">채널</a>
			</li>
			<li class="psp_nav_item" role="tab" aria-selected="false">
				<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabcont" data-url="/ch/search/content">콘텐츠</a>
			</li>
		</ul>
	</div>
</div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/search/itda_read.js"></script>
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







<!-- 이하의 코드는 변경 없이 유지됩니다. -->
</body>
</html>
