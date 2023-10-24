<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<meta name="description" content="네이버 프리미엄 콘텐츠의 채널 및 콘텐츠 검색 결과를 확인할 수 있습니다.">
	<meta property="og:title" content="채널 및 콘텐츠 검색 : 네이버 프리미엄 콘텐츠">
	<meta property="og:image" content="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2022/12/08/og.jpg">
	<meta property="og:description" content="네이버 프리미엄 콘텐츠의 채널 및 콘텐츠 검색 결과를 확인할 수 있습니다.">
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="채널 및 콘텐츠 검색 : 네이버 프리미엄 콘텐츠">
	<meta name="twitter:site" content="프리미엄콘텐츠">
	<meta name="twitter:image" content="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2022/12/08/og.jpg">
	<meta name="twitter:description" content="네이버 프리미엄 콘텐츠의 채널 및 콘텐츠 검색 결과를 확인할 수 있습니다.">
	<title>채널 및 콘텐츠 검색 : 네이버 프리미엄 콘텐츠</title>
		<link rel="stylesheet" href="https://static-nnews.pstatic.net/css/min/20231019/premium_service.css">
	<link rel="shortcut icon" type="image/x-icon" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/favicon_M.ico" />
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
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
		<div class="psp_head">
			<div class="psp_head_inner">
				<div class="psp_head_content">
			<a href="#" class="psp_back_button _BACK" data-clk="pch_search.back"><span class="blind">뒤로가기</span></a>
			<div class="psp_input_wrap _SEARCH_INPUT_WRAP">
				<input id="_SEARCH_INPUT" type="text" placeholder="프리미엄 채널, 콘텐츠를 검색해 보세요" class="psp_search_input" value="부동산" data-url="/ch/search" data-search-query="부동산" autocomplete="off">
				<button id="_SEARCH_RESET_BTN" type="button" class="psp_input_cancel_button" data-clk="pch_search.close">삭제</button>
			</div>
			<button type="button" class="psp_search_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.search" data-url="/ch/search" data-search-value="true"><span class="blind">검색</span></button>
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
		<div class="_TOP_SEARCH_KEYWORD" style="display:none;">
			<div class="premiumhome_keyword _TEMPLATE" data-template-id="SCS_PREMIUM_HOME_TOP_SEARCH_KEYWORD">
				<h2 class="pk_h">인기검색어</h2>
				<ul class="pk_list">
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EB%B9%84%ED%8A%B8%EC%BD%94%EC%9D%B8" class="pk_link" data-clk="pch_search.hot">비트코인</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EB%84%A4%EC%98%B4%EC%8B%9C%ED%8B%B0" class="pk_link" data-clk="pch_search.hot">네옴시티</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%B1%84%EA%B6%8C" class="pk_link" data-clk="pch_search.hot">채권</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EB%AF%B8%EA%B5%AD%EC%A3%BC%EC%8B%9D" class="pk_link" data-clk="pch_search.hot">미국주식</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%98%81%EC%96%B4" class="pk_link" data-clk="pch_search.hot">영어</a>
					</li>
				</ul>
			</div>
		</div>
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
		<div class="psp_body _SEARCH_RESULT_AREA">
			<div class="psp_result_area">
				<div class="psp_sort_area">
					<strong class="psp_category">채널 <em>25</em></strong>
				</div>
				<ul class="psp_channel_list _CONTENT_LIST _SEARCH_RESULT_LIST" data-template="SCS_PREMIUM_CHANNEL_SEARCH_CHANNEL" data-type="channel" data-search-query="부동산" data-cursor-name="page" data-cursor="1" data-has-next="true" data-total-count="25">
				
				
				<c:forEach var="content" items="${contentResults}">
				      <li>${content.boardTitle}</li> <%-- 원하는 방식으로 컨텐츠 정보 표시 --%>
				  </c:forEach>
				  
				  
					<li class="psp_channel_item">
						<a href="/genesispark/taxnote" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMTA5MTVfODcg/MDAxNjMxNzEzMzc0ODU2.R3m_hUy1MDjocMy0NHyB98TP1VHhlCP_PSLDlDXCnb0g.mivpsrFPB-mQGuDPRNbr5PvRsK09YY4Vrl49XV8qPUMg.PNG/image%7Cpremium%7Cchannel%7Cgenesispark%7C2021%7C09%7C15%7C1631713374832.png?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">제네시스박의 <em>부동산</em> 절세노트</strong>
								<p class="psp_info">커피 한 잔 값으로 즐기는 부동산 절세의 모든 것! </p>
								<p class="psp_date">
									<span class="update">5일전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					
					
					
					
					<li class="psp_channel_item">
						<a href="/smarttube/ppassong" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMTA3MjNfMTU2/MDAxNjI3MDI4NDMxMzI1.ZVDCBhZsgJZav-akTOIVDxzIKlq0RTyYHZ_TpNrueNAg.BygH3Ifq7dD2EdyZWMVFBQjQIHct95OWAF8shSAdxV8g.PNG/image%7Cpremium%7Cchannel%7Csmarttube%7Cppassong%7C2021%7C07%7C23%7C1627028431292.png?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">스마트튜브 <em>부동산</em>조사연구소</strong>
								<p class="psp_info">대한민국 넘버원 부동산 플랫폼
			스마트튜브 부동산조사연구소
			빠숑 김학렬 소장이 
			직접 제공해 드리는
			대한민국 부동산 정보의 모든 것!</p>
								<p class="psp_date">
									<span class="update">7시간전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					<li class="psp_channel_item">
						<a href="/highprotein/protein" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA4MTlfMjk0/MDAxNjkyMzkzNjY3MjE2.pjgLweSgfuYufQkPZA-jY68f2RJO87NniwNIe-SQRCkg.iszZvRbaAWMDn4UuOlZi8FWgYXRKOdk6hU1G7GWzbWYg.PNG/image%7Cpremium%7Cchannel%7Chighprotein%7C2023%7C08%7C19%7C1692393667184.png?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">고단백의 너무 쉬운 돈버는 <em>부동산</em></strong>
								<p class="psp_info">유튜브 10만 구독자가 선택한 고단백의 너무 쉬운 돈버는 부동산!
			1,900원으로 1,900만원 벌 수 있는 부동산 분석
			 
			(1) 매주 실제 현장 답사를 기반으로 파악한 가장 정확한 실시간 부동산 흐름을 알려드립니다
			(2) 안전한 내 집 마련을 위해 모르면 큰 손해보는, 가장 좋은 입지를 제안합니다.
			(3) 적극적인 투자층을 위한 올바른 진입 시점과 좋은 입지를 말씀드립니다.
			
			10만명의 &#x27;고단백부동산&#x27; 유튜브 채널 운영자 고단백이 서울 수도권의 거의 모든 곳을 임장하면서, 더운날씨, 추운날씨 겪으며 쌓아온 입지 분석을 실전 사례를 통해 풀어드립니다. 
			
			내 집 마련, 부동산 투자에 필요한 어려운 용어들을 쉽게 풀어서 설명해주고, 모두 다른 개개인의 상황에 공통적으로 적용할 수 있는 입지 센스를 전달합니다. 무주택, 내집 마련, 다주택까지 고단백 실전 컨텐츠 하나로 너무 쉬운 부동산 투자를 마스터 하실 수 있습니다.</p>
								<p class="psp_date">
									<span class="update">4일전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					<li class="psp_channel_item">
						<a href="/homesrealestate/homesbudongsan" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMjEyMjJfMjA2/MDAxNjcxNzE4NzEzMjg0.z8DeknfUnp-WenkbtLmNpju_XDocCWDbGJ61oAyn5bog.DNKy6-Diq0XP8ik-bQ-tu9sD9ysDqlZCXDTDt3X43dYg.PNG/image%7Cpremium%7Cchannel%7Chomesrealestate%7C2022%7C12%7C22%7C1671718713268.png?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">홈즈<em>부동산</em> 이슈픽</strong>
								<p class="psp_info">온 국민이 올바른 &#x27;부동산 의사결정&#x27;을 내릴 수 있을 때까지 </p>
								<p class="psp_date">
									<span class="update">2일전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
				</ul>
				<div class="psp_dropdown">
					<button type="button" class="psp_button_more _SEARCH_SUBMIT_BTN" data-clk="pch_search.resultchmore" data-url="/ch/search/channel">채널 검색 결과 더보기</button>
				</div>
			</div>
			<div class="psp_result_area">
				<div class="psp_sort_area">
					<strong class="psp_category">콘텐츠 <em>18,960</em></strong>
				</div>
				<ul class="psp_content_list _CONTENT_LIST _SEARCH_RESULT_LIST" data-template="SCS_PREMIUM_CHANNEL_SEARCH_CONTENT" data-type="content" data-stype="" data-search-query="부동산" data-cursor-name="page" data-cursor="2" data-has-next="true" data-cp-name="" data-sub-id="" data-total-count="18960">
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/homesrealestate/homesbudongsan" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/homesrealestate/homesbudongsan/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">홈즈부동산 이슈픽</span>
							</a>
							<a href="/homesrealestate/homesbudongsan/contents?categoryId&#x3D;182387b8a6e000mcq" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">부동산 이슈</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/homesrealestate/homesbudongsan/contents/221208200922543ap" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">부린이를 위한 기초 특강! <em>부동산</em> 차트 보는법(KB<em>부동산</em> 통계, 호갱노노, 아실, 네이버<em>부동산</em>)</strong>
							</a>
							<a href="/homesrealestate/homesbudongsan/contents/221208200922543ap" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">홈즈<em>부동산</em> 이종호 공인중개사입니다.  여러분 주식 차트에 대해서 공부를 하신 적 있으실까요? 저도 주식 투자를 처음 입문할 때 주식 차트를 공부하기 위해서 캔들차트 보는 법... 다만 여러분이 주식투자를 안할 거면 <em>부동산</em> 시장에서 필요한 것만 공부를 하면 되겠죠.  그래서 오늘은 <em>부동산</em> 투자계의 '주식 차트'라고 할 수 있는 KB <em>부동산</em> 통계와 <em>부동산</em> 실거래가... </p>
							</a>
							<a href="/homesrealestate/homesbudongsan/contents/221208200922543ap" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">이종호</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2022.12.11.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;%ED%98%B8%EA%B0%B1%EB%85%B8%EB%85%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">호갱노노</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;%EC%95%84%EC%8B%A4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">아실</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;%EB%84%A4%EC%9D%B4%EB%B2%84%EB%B6%80%EB%8F%99%EC%82%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">네이버부동산</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;KB%EB%B6%80%EB%8F%99%EC%82%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">KB부동산</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;KB%EB%B6%80%EB%8F%99%EC%82%B0%EC%8B%9C%EC%84%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">KB부동산시세</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;%EB%B6%80%EB%8F%99%EC%82%B0%EC%B0%A8%ED%8A%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부동산차트</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/homesrealestate/homesbudongsan/contents?tag&#x3D;%EC%B0%A8%ED%8A%B8%EB%B6%84%EC%84%9D" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">차트분석</a>
								</li>
							</ul>
						</div>
						<a href="/homesrealestate/homesbudongsan/contents/221208200922543ap" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMjEyMDhfMjQz/MDAxNjcwNDg3Njk2MzY1.FVZQNw6CF-2F33K0dv6kj7MEHnEEl7lkHsydywoAtUYg.eC4CDi4w6j1f1ki4qeKJjS3rdoACINimPFgy_ldWCDwg.PNG/%EC%A0%9C%EB%AA%A9%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-001.png?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/gam/money" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/gam/money/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">해외주식투자 感(GAM)</span>
							</a>
							<a href="/gam/money/contents?categoryId&#x3D;17f61beab98000aiz" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">중국</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/gam/money/contents/221103163820389xl" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">['시황제' 시대 A주 새전략] 계륵 투자처 '<em>부동산</em>'...침체기 탈출시점은 '이때'</strong>
							</a>
							<a href="/gam/money/contents/221103163820389xl" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">배상희 기자 = 시진핑(習近平) 집권 3기가 도래하면서 중국 경제 성장을 지탱하는 '<em>부동산</em>' 시장의 회복 여부와 그 가능성을 높여줄 당국의 정책 방향성에 대한 관심이 높아지고 있다.  지난해부터 이어지고 있는 <em>부동산</em> 침체기 장기화로 주식시장에서도 <em>부동산</em> 종목은 딱히 먹을 것은 없지만 버리기는 아까운 계륵(鷄肋)과 같은 신세가 됐다. 그럼에도 적지 않은... </p>
							</a>
							<a href="/gam/money/contents/221103163820389xl" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">배상희 기자</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2022.11.03.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%A4%91%EA%B5%AD%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">중국증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;A%EC%A3%BC" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">A주</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%ED%99%8D%EC%BD%A9%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">홍콩증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EB%B6%80%EB%8F%99%EC%82%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부동산</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EB%94%94%ED%8F%B4%ED%8A%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">디폴트</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%8B%9C%EC%A7%84%ED%95%91" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">시진핑</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;4%EB%B6%84%EA%B8%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">4분기</a>
								</li>
							</ul>
						</div>
						<a href="/gam/money/contents/221103163820389xl" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTc5/MDAxNjY3NDYwNzAwNjM4.HaMaqj5Sw_xV7v-zsuM_CCCeId21yNMYfU7gF2nZmSQg.ATf7gkf4BhxWDmcs5NZHmxTXh8h-UR_kprsZIv7TRnwg.JPEG/shutterstock_198470849.jpg?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/gam/money" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/gam/money/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">해외주식투자 感(GAM)</span>
							</a>
							<a href="/gam/money/contents?categoryId&#x3D;17f61beab98000aiz" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">중국</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/gam/money/contents/221115170219959sg" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">'문건 254호' 효과 지속될까...초대형 구제책에 입질 온 <em>부동산</em>株</strong>
							</a>
							<a href="/gam/money/contents/221115170219959sg" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">오랜 기간 지지부진한 흐름을 지속하던 <em>부동산</em>주가 최근 A주(중국 본토증시에 상장된 주식) 시장과 홍콩증시에서 수거래일 눈에 띄는 상승랠리를 연출, <em>부동산</em> 섹터를 둘러싼 반등 기대감이 확대되고 있다. 꿈적도 않던 <em>부동산</em>주의 주가를 끌어올린 원동력은 결국 초대형 정책 호재였다. 최근 중국 당국이 역대 최고로 강력한 수준의 <em>부동산</em> 구제책을 마련한... </p>
							</a>
							<a href="/gam/money/contents/221115170219959sg" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">배상희 기자</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2022.11.15.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%A4%91%EA%B5%AD%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">중국증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;A%EC%A3%BC" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">A주</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%ED%99%8D%EC%BD%A9%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">홍콩증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EB%B6%80%EB%8F%99%EC%82%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부동산</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EA%B7%9C%EC%A0%9C%EC%99%84%ED%99%94" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">규제완화</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%8B%9C%EC%A7%84%ED%95%91" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">시진핑</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EB%94%94%ED%8F%B4%ED%8A%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">디폴트</a>
								</li>
							</ul>
						</div>
						<a href="/gam/money/contents/221115170219959sg" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMjExMTVfMjE0/MDAxNjY4NDk5MTU1NTY3.dDMa2UlBxtYHZKVBbgpXC7wT9raTMUFs397QIamjLcQg.RtWO2mfnL98_IISkp0EqpyiXv0mpZR8_q3E40usivosg.JPEG/shutterstock_2153914985.jpg?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/gam/money" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/gam/money/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">해외주식투자 感(GAM)</span>
							</a>
							<a href="/gam/money/contents?categoryId&#x3D;17f61beab98000aiz" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">중국</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/gam/money/contents/230106165925186wn" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">3년 암흑기 탈출할까...2023년 中 <em>부동산</em>을 둘러싼 현실적 진단</strong>
							</a>
							<a href="/gam/money/contents/230106165925186wn" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">&quot;<em>부동산</em>이 20년만에 중국 경제의 근간 산업으로 다시금 주목을 받고 있고, <em>부동산</em> 시장 활성화를 위한 당국의 정책도 시장의 예상을 뛰어넘는 수준으로 개선되고 있다. 최근 몇 개월 사이에 희미했던 빛이 서광으로 변화하는 분위기다&quot; 지난해 12월 16일 개최된 중국 대형 <em>부동산</em> 개발업체 완커(萬科∙Vanke)의 주주총회에서 위량(郁亮) 회장은 최근... </p>
							</a>
							<a href="/gam/money/contents/230106165925186wn" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">배상희 기자</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2023.01.06.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%A4%91%EA%B5%AD%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">중국증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;A%EC%A3%BC" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">A주</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%ED%99%8D%EC%BD%A9%EC%A6%9D%EC%8B%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">홍콩증시</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EB%B6%80%EB%8F%99%EC%82%B0" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부동산</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;2023%EB%85%84" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">2023년</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EA%B8%88%EB%A6%AC%EC%9D%B8%EC%83%81" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">금리인상</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%86%8C%EB%B9%84" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">소비</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%9C%84%EB%93%9C%EC%BD%94%EB%A1%9C%EB%82%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">위드코로나</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%BD%94%EB%A1%9C%EB%82%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">코로나</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/gam/money/contents?tag&#x3D;%EC%A0%9C%EB%A1%9C%EC%BD%94%EB%A1%9C%EB%82%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">제로코로나</a>
								</li>
							</ul>
						</div>
						<a href="/gam/money/contents/230106165925186wn" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMzAxMDZfMTgw/MDAxNjcyOTkxNzQyNjc3.owmTlxtzRTV7OU9WBgXfhMyvBewJbpl7n5qs4CdecbUg.1aVWZsCNCXG17fj4u_W-Q63-_VPVY9QPxohZrKJ4Lxwg.JPEG/1.JPG?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</a>
						</div>
					</li>
				</ul>
				<div class="psp_dropdown">
					<button type="button" class="psp_button_more _SEARCH_SUBMIT_BTN" data-clk="pch_search.resultcontmore" data-url="/ch/search/content">콘텐츠 검색 결과 더보기</button>
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
</script>
</html>
