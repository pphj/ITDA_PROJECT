<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36">
<head>
	<title>채널 및 콘텐츠 검색</title>
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
                    <button type="button" class="psp_search_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.search" data-url="${pageContext.request.contextPath}/main/search" data-search-value="true"><span class="blind">검색</span></button>
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
					<li class="psp_nav_item" role="tab" aria-selected="true">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.taball" data-url="">전체</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabch" data-url="">채널</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabcont" data-url="">콘텐츠</a>
					</li>
				</ul>
			</div>
		</div>
		
					
					
					
					 
			<div style="text-align: center; margin-top: 80px;">
			    <div style="font-size: 20px;">검색된 채널, 콘텐츠가 없습니다.</div>
			    <div style="font-size: 20px;">다른 검색어로 시도해 보세요.</div>
			</div>

					
					
					
			
				
				
			</div>
		</div>
	</div>
</div>


			</div>
		</div>
	<script src="https://static-nnews.pstatic.net/js/min/20231019a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20231019a/premium_read.min.js"></script>

</body>
</html>
