<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36">
<head>
	<title>콘텐츠 검색</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header/premium_service2.css">
	<link rel="stylesheet" href="https://static-nnews.pstatic.net/css/min/20230914a/premium_service.css">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/main/tv_icon.ico">
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20231019-231019-175617-678f7f4875-wvpvz";
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

		var isPremiumReferer = false;
		
		
		
		
	</script>
	<script src="https://static-nnews.pstatic.net/js/min/20231019a/premium_common.min.js"></script>
</head>
<body class="">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<hr>
<script>
	var svt = "20231024172557.310";
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
		<div class="container_main">
			<div class="container_sidebar _CONTAINER_SIDEBAR">
				<div class="container_sidebar_inner _GRID_TEMPLATE_COLUMN_SIDEBAR _CONTAINER_SIDEBAR_INNER"></div>
			</div>
			<div class="container_content _GRID_TEMPLATE_COLUMN _STICKY_CONTENT">
			<div class="premium_search_page">
	<div class="psp_main">
	
	
	<!--  -->
		 <div class="psp_head">
            <div class="psp_head_inner">
                <div class="psp_head_content">
                    <a href="#" class="psp_back_button _BACK" data-clk="pch_search.back"><span class="blind">뒤로가기</span></a>
                  <div class="psp_input_wrap _SEARCH_INPUT_WRAP non_searching">
				    <input id="_SEARCH_INPUT" type="text" class="psp_search_input" value="<%= request.getParameter("searchQuery") %>" data-url="/main/search" data-search-query="<%= request.getParameter("searchQuery") %>" autocomplete="off">
				    <button id="_SEARCH_RESET_BTN" type="button" class="psp_input_cancel_button" data-clk="pch_search.close">삭제</button>
				    
				</div>
                    <button type="button" class="psp_search_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.search" data-url="${pageContext.request.contextPath}/main/search/result" data-search-value="true"><span class="blind">검색</span></button>
                </div>
            </div>
        </div>
        
        
        
		<div class="psp_recent _SEARCH_HISTORY_AREA" style="display: none;">
			<strong class="psp_recent_title">최근 검색어</strong>
			<div class="psp_recent_list_area">
				<div id="_SEARCH_HISTORY_LIST_WRAP" data-nclk-prefix="pch_search"></div>
				<script type="x-tmpl-mustache" class="_SEARCH_HISTORY_LIST">
				{{#autoSave}}
				{{#hasKeywords}}
				<ul class="psp_recent_list">
					{{#keywords}}
					<li class="psp_recent_item">
						<a href="#" class="psp_recent_link _SEARCH_KEYWORD_LINK" data-keyword="{{keyword}}" data-clk="{{nclkPrefix}}.historylink">{{keyword}}</a>
						<button type="button" class="psp_recent_delete _DELETE_SEARCH_HISTORY_BTN" data-keyword="{{keyword}}" data-clk="{{nclkPrefix}}.historyremove"><span class="blind">삭제</span></button>
					</li>
					{{/keywords}}
				</ul>
				{{/hasKeywords}}
				{{^keywords}}
				<div class="psp_recent_text">검색 내역이 없습니다.</div>
				{{/keywords}}
				{{/autoSave}}
				{{^autoSave}}
				<div class="psp_recent_text">검색어 저장 기능이 꺼져 있습니다.</div>
				{{/autoSave}}
				</script>
			</div>
			<div class="psp_recent_option">
				<div class="psp_recent_option_button_wrap">
				
					<button type="button" class="psp_recent_option_button _CLEAR_SEARCH_HISTORY_BTN" data-clk="pch_search.historyclear">전체 삭제</button>
					<button type="button" class="psp_recent_option_button _AUTO_SAVE_BUTTON" data-enable="false" data-clk="pch_search.historyoff">자동저장 끄기</button>
					<button type="button" style="display: none;" class="psp_recent_option_button _AUTO_SAVE_BUTTON" data-enable="true" data-clk="pch_search.historyon">자동저장 켜기</button>
				</div>
				<div class="psp_recent_option_close_wrap">
					<button type="button" class="psp_recent_option_button _CLOSE_SEARCH_HISTORY_BTN" data-clk="pch_search.historyclose">닫기</button>
				</div>
			</div>
		</div>
		
		<div class="psp_nav _SEARCH_RESULT_AREA">
			<div class="psp_nav_inner">
				<ul class="psp_nav_list" role="tablist">
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.taball" data-url="${pageContext.request.contextPath}/main/search/result">전체</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabch" data-url="${pageContext.request.contextPath}/main/search/result/channel">채널</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="true">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabcont" data-url="${pageContext.request.contextPath}/main/search/result/content">콘텐츠</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="psp_body _SEARCH_RESULT_AREA">
			
			
			
			
			
			<div class="psp_result_area">
				<div class="psp_sort_area">
					<strong class="psp_category">콘텐츠 <em>${contentResults.size()}</em></strong>
				</div>
				<ul class="psp_content_list _CONTENT_LIST _SEARCH_RESULT_LIST" data-template="SCS_PREMIUM_CHANNEL_SEARCH_CONTENT" data-type="content" data-stype="" data-search-query="부동산" data-cursor-name="page" data-cursor="2" data-has-next="true" data-cp-name="" data-sub-id="" data-total-count="18960">
					
					<c:forEach var="content" items="${contentResults}">
					    <li class="psp_content_item">
					        <div class="psp_content_name">
					            <a href="${pageContext.request.contextPath}/contents/${content.chNum}/${content.boardNum}?userid=" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
					                <span class="psp_channel_thumb_small">
					                      <img src="${pageContext.request.contextPath}/image/contents/${content.chNum}${content.thumbNail}" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					                </span>
					                <span class="psp_channel_name">${content.chNum}</span>
					            </a>
					            <a href="" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">${content.chCate_Id}</a>
					        </div>
					        <div class="psp_content_inner">
					            <div class="psp_text">
					                <a href="${pageContext.request.contextPath}/contents/${content.chNum}/${content.boardNum}?userid=" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
					                    <strong class="psp_name">${content.boardTitle}</strong>
					                </a>
					                <a href="${pageContext.request.contextPath}/contents/${content.chNum}/${content.boardNum}?userid=" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
					                    <p class="psp_info">${content.intro}</p>
					                </a>
					                <a href="${pageContext.request.contextPath}/contents/${content.chNum}/${content.boardNum}?userid=" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
					                    <div class="psp_content_author">
					                        <em class="psp_content_author_by">by</em>
					                        <div class="psp_content_author_text">${content.writer}</div>
					                    </div>
					                </a> 
					                <div class="psp_content_info">
					                    <span class="psp_content_info_text">${content.boardDate}</span>
					                </div>
					            </div>
					            <a href="" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
					                 <img  src="${pageContext.request.contextPath}/image/MemberUpload/${channel.ownerId}${channel.chProfile}"
 								class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					            </a>
					        </div>
					    </li>
					</c:forEach>
				</ul>
				<div class="psp_dropdown">
					<button type="button" class="psp_button_more _SEARCH_SUBMIT_BTN" data-clk="pch_search.resultcontmore" data-url="${pageContext.request.contextPath}/main/search/result/content">콘텐츠 검색 결과 더보기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
window.__htExternalUrl = window.__htExternalUrl || {};
window.__htExternalUrl["like"] = "https://static-like.pstatic.net/js/reaction/dist/reaction.min.js";
window.__htLikeOption = {
	type: "basic",
	cssId: "scs",
	domain: "https://news.like.naver.com",
	staticDomain: "https://static-like.pstatic.net",
	isMobile: true,
	isHiddenLabel: false,
	isHiddenCount: false,
	isHiddenZeroCount: true,
	isUsedLabelAsZeroCount: false,
	isDebugMode: false,
	isDuplication: false,
	isHiddenLayerAfterSelection: true,
	clicklog: function(el, name) {
		nclkWrap.send({
			$this: $(el),
			sArea: name
		});
	}
};
</script>

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
	<script src="https://static-nnews.pstatic.net/js/min/20231019a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20231019a/premium_read.min.js"></script>
<script>
var isPublicAccess = true;
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

		if (isPublicAccess === true && !!!isPreview) {
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






//스크롤 다운 데이터 호출
$(document).ready(function () {
    const pageSize = 15; // 한 페이지에 표시할 항목 수
    let currentPage = 1; // 현재 페이지 번호
    let isFetching = false; // 데이터를 가져오는 중인지 여부
    const apiUrl = '/api/content-results/';

    function loadMoreData() {
        if (isFetching) {
            return;
        }

        isFetching = true;

        $.get(apiUrl + currentPage, { keyword: '검색어', pageSize: pageSize }, function (data) {
            if (data.length > 0) {
                data.forEach(function (item) {
                    // 데이터를 화면에 추가하는 로직을 구현
                    // 예: $('#contentList').append('<div>' + item.title + '</div>');
                });

                currentPage++;
            } else {
                // 더 이상 데이터가 없을 때 스크롤 이벤트 리스너 제거
                $(window).off('scroll', checkScroll);
            }

            isFetching = false;
        });
    }

    function checkScroll() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            loadMoreData();
        }
    }

    loadMoreData();

    // 스크롤 이벤트 리스너 추가
    $(window).on('scroll', checkScroll);
});


document.addEventListener("DOMContentLoaded", function() {
    const contentResultsSize = ${contentResults.size()}; // 콘텐츠 결과의 크기

    // "콘텐츠 검색 결과 더보기" 버튼을 삭제
    const contentMoreButton = document.querySelector('.psp_button_more._SEARCH_SUBMIT_BTN');
    if (contentMoreButton && contentResultsSize === 0) {
        contentMoreButton.remove(); // 콘텐츠 결과가 없으면 버튼을 삭제
    }
});





</script>
</html>
