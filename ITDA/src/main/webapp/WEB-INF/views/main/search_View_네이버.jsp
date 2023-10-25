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

		var svr = "one-service-premium-r-20231019-231019-175630-5568bcbc75-krrcw";
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
	var svt = "20231025141221.025";
	var timestamp = svt.substr(0, 8);
	var isLogin = false;

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
				<input id="_SEARCH_INPUT" type="text" placeholder="프리미엄 채널, 콘텐츠를 검색해 보세요" class="psp_search_input" value="아" data-url="/ch/search" data-search-query="아" autocomplete="off">
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
						<a href="/ch/search?searchQuery&#x3D;%EC%A3%BC%EC%8B%9D" class="pk_link" data-clk="pch_search.hot">주식</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%9C%A0%EB%AA%A9%EB%AF%BC" class="pk_link" data-clk="pch_search.hot">유목민</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%B1%84%EC%83%81%EC%9A%B1" class="pk_link" data-clk="pch_search.hot">채상욱</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%82%AC%EC%9A%B0%EB%94%94" class="pk_link" data-clk="pch_search.hot">사우디</a>
					</li>
					<li class="pk_item">
						<a href="/ch/search?searchQuery&#x3D;%EC%B2%AD%EC%86%A1%EC%B4%8C%EB%86%88" class="pk_link" data-clk="pch_search.hot">청송촌놈</a>
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
					<strong class="psp_category">채널 <em>117</em></strong>
				</div>
				<ul class="psp_channel_list _CONTENT_LIST _SEARCH_RESULT_LIST" data-template="SCS_PREMIUM_CHANNEL_SEARCH_CHANNEL" data-type="channel" data-search-query="아" data-cursor-name="page" data-cursor="1" data-has-next="true" data-total-count="117">
					<li class="psp_channel_item">
						<a href="/hsacademy/hsacademy1" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMjA4MjJfMTQz/MDAxNjYxMTIxMDM5MjQw.ydhEAK3SIwMbiEKQrbzXsNUn5fYT5PlnNRAjZ9E0M0Eg._A7undf7ISm1LZdtqUExbxcU4VJh_agC_LdaAoywUusg.PNG/image%7Cpremium%7Cchannel%7Chsacademy%7C2022%7C08%7C22%7C1661121039204.png?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">경제/비즈니스</span>
								<strong class="psp_name">이효석<em>아</em>카데미</strong>
								<p class="psp_info">생존투자를 위해 꼭 알아야 하는 글로벌 경제 동향을 가장 쉽고 재미있게 설명해드립니다.</p>
								<p class="psp_date">
									<span class="update">6시간전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					<li class="psp_channel_item">
						<a href="/connectedground/aptresearch" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzAxMjFfMjAw/MDAxNjc0Mjg4MDU1ODEx.PqQu_HLTSxdmLPVoQaAh9URFHkJM7qEePC5GTvF0f8Ug.-LrrBTHqWmaPY7kt8MFJhDygrgESh5jFMLcnu8yTZuwg.JPEG/image%7Cpremium%7Cchannel%7Cconnectedground%7C2023%7C01%7C21%7C1674288055779.jpg?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">채상욱의 <em>아</em>파트 가치&amp;가격 연구소</strong>
								<p class="psp_info">부동산 애널 1등 출신인 채상욱의 한번 배워두면 평생 사용가능한 아파트 적정가 분석방법을 담은 채널. 어디서도 볼 수없는 아파트 적정가 계산 공식인 소름공식과, 합리적 시장 전망 기술을 배웁니다. 
			</p>
								<p class="psp_date">
									<span class="update">14시간전 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					<li class="psp_channel_item">
						<a href="/philokim/knowledge" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMTEyMDdfMjE0/MDAxNjM4ODA4OTU2MzEy.wozVhX0QvnSaOB4z6Iu1qD_x0OV4Eg4AkEaa9bybFWUg.X2MO2OW6TCBJNOLWsIv0Ic8F_jmfCwbCGXRnekZloc8g.JPEG/image%7Cpremium%7Cchannel%7Cphilokim%7C2021%7C12%7C07%7C1638808956263.jpg?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_partner"><span class="blind">파트너 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">인문/교양</span>
								<strong class="psp_name">김상환의 필로소피<em>아</em></strong>
								<p class="psp_info">현대프랑스철학이 생산한 독창적인 개념들을 알기 쉽게 소개합니다. 데리다, 푸코, 들뢰즈, 라캉, 랑시에르 등 20세기 다양한 파리 철학자들의 사상을 우리의 현실 속에 풀어내봅시다.</p>
								<p class="psp_date">
									<span class="update">10.10. 업데이트</span>
								</p>
							</div>
						</a>
					</li>
					<li class="psp_channel_item">
						<a href="/jejeguide/jeje" class="psp_channel_link" data-clk="pch_search.resultch" target="_blank">
							<div class="psp_channel_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzAxMjlfOTcg/MDAxNjc0OTg0NTU3MjE3.DAIqsI6HALeRV0FEwgCVLDTag4TjA_qDBJu2kyTlHZ4g.iqZvFWW5nCr8RhWCoXL7kiahwqTQf3BVbk8Owdymfxkg.JPEG/image%7Cpremium%7Cchannel%7Cjejeguide%7C2023%7C01%7C29%7C1674984557200.jpg?type&#x3D;nfs200_200" class="psp_channel_img" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								<i class="icon_premium"><span class="blind">프리미엄 채널</span></i>
							</div>
							<div class="psp_text">
								<span class="psp_tag">부동산</span>
								<strong class="psp_name">휴식이형의 <em>아</em>주 쉬운 재개발 재건축</strong>
								<p class="psp_info">국내 TOP 건설사 출신의 전문가가 
			아주 쉽게 재개발 재건축을 설명해드립니다.
			
			9,900원으로 9,900만원 버는 비법을 알려드립니다.</p>
								<p class="psp_date">
									<span class="update">1일전 업데이트</span>
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
					<strong class="psp_category">콘텐츠 <em>6,934</em></strong>
				</div>
				<ul class="psp_content_list _CONTENT_LIST _SEARCH_RESULT_LIST" data-template="SCS_PREMIUM_CHANNEL_SEARCH_CONTENT" data-type="content" data-stype="" data-search-query="아" data-cursor-name="page" data-cursor="2" data-has-next="true" data-cp-name="" data-sub-id="" data-total-count="6934">
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/dailyost/film" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/dailyost/film/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">영화와 음악이 만났을 때</span>
							</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/dailyost/film/contents/231014165731838sp" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">영화 열정을 노출 시켜 준 뮤직 비디오 10편, 마이클 잭슨+테일러 스위프트+콜드플레이+<em>아</em> 하 등-빌보드 추천</strong>
							</a>
							<a href="/dailyost/film/contents/231014165731838sp" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">영화와 음악은 서로 창의적 <em>아</em>이디어를 주고받는 특성을 갖고 있다. 특히 영화적 메시지를 담고 있는 뮤직... 곡이 <em>아</em>니다. 그들은 감동을 불러 일으키는 영화를 관람한 듯한 놀라운 느낌의 뮤직 비디오를 제공하고 있다.... 받<em>아</em> ‘All Too Well’을 발표한다. 무려 10여분에 달하는 뮤직 비디오는 유튜브를 통해 공개 되자 마자 ‘멋진 영화... </p>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2023.10.14.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EC%98%81%ED%99%94%EA%B0%99%EC%9D%80%EB%AE%A4%EC%A7%81%EB%B9%84%EB%94%94%EC%98%A4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">영화같은뮤직비디오</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;MusicVideo" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">MusicVideo</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EC%95%84%ED%95%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">아하</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%ED%85%8C%EC%9D%BC%EB%9F%AC%EC%8A%A4%EC%9C%84%ED%94%84%ED%8A%B8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">테일러스위프트</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EB%A7%88%EC%9D%B4%ED%81%B4%EC%9E%AD%EC%8A%A8" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">마이클잭슨</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EC%BD%9C%EB%93%9C%ED%94%8C%EB%A0%88%EC%9D%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">콜드플레이</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EB%A0%88%EC%9D%B4%EB%94%94%EA%B0%80%EA%B0%80" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">레이디가가</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EB%9D%BC%EB%94%94%EC%98%A4%ED%97%A4%EB%93%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">라디오헤드</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EB%B8%94%EB%9F%AC" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">블러</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/dailyost/film/contents?tag&#x3D;%EC%BC%84%EB%93%9C%EB%A6%AD%EB%9D%BC%EB%A7%88%EB%A5%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">켄드릭라마르</a>
								</li>
							</ul>
						</div>
						<a href="/dailyost/film/contents/231014165731838sp" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMzEwMTRfMzMg/MDAxNjk3MjY5NjYzNzAy.Z1-yoRb40G05HLuqkFL-qQD4s6djpmCkeFyR4QjUUI4g.xOLUfXmxwsrjjROnXWEwmreBYTMs0b6BJBG9rqwRQKYg.JPEG/%EC%82%AC%EC%A7%84_10_%EC%95%84-%ED%95%98.JPG?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/bphanja/bonesolvehanja" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/bphanja/bonesolvehanja/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">뼈로 풀이한 한자</span>
							</a>
							<a href="/bphanja/bonesolvehanja/contents?categoryId&#x3D;186d6a21a55000psc" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">부수 214자</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/bphanja/bonesolvehanja/contents/230401013708009tu" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">【부수 214자】 〈14강〉 4획 부수:  父(부) 爻(효) 爿(장) 片(편) 牙(<em>아</em>) 牛(우) 犬(견) 분석</strong>
							</a>
							<a href="/bphanja/bonesolvehanja/contents/230401013708009tu" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">단어나 한자성어를 제외한다면, 게재한 내용 외의 것을 구태여 찾<em>아</em>볼 필요가 없을 정도로 꼼꼼하고 촘촘하게 분석하였다. (휴대폰에서 깨지는 글자가 있으면 pc에서 확인바랍니다)... 뼈 알) 殳(몽둥이 수) 毋(없을 무) 比(견줄 비) 毛(털 모) 氏(씨 씨) 气(기운 기) 水(물 수) 火(불 화) 爪(손톱 조) 父(<em>아</em>비 부) 爻(사귈 효) 爿(조각 장) 片(조각 편) 牙(어금니 <em>아</em>) 牛(소 우) 犬... </p>
							</a>
							<a href="/bphanja/bonesolvehanja/contents/230401013708009tu" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">송재항</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2023.04.01.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%ED%95%9C%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">한자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EB%B6%80%EC%88%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부수</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%9E%90%EC%9B%90%ED%92%80%EC%9D%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">자원풀이</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B3%A0%EC%82%AC%EC%84%B1%EC%96%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">고사성어</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%84%A4%EB%AC%B8%ED%95%B4%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">설문해자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B0%91%EA%B3%A8%EB%AC%B8%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">갑골문자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B8%88%EC%84%9D%EB%AC%B8%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">금석문자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%86%8C%EC%A0%84" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">소전</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%B4%88%EC%84%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">초서</a>
								</li>
							</ul>
						</div>
						<a href="/bphanja/bonesolvehanja/contents/230401013708009tu" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<span class="no_image"></span>
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/bphanja/bonesolvehanja" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/bphanja/bonesolvehanja/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">뼈로 풀이한 한자</span>
							</a>
							<a href="/bphanja/bonesolvehanja/contents?categoryId&#x3D;18713bbca000005xp" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">설문해자 부수 540자</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/bphanja/bonesolvehanja/contents/230510084822235xb" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">【설문해자 부수 540자】 &lt;8강&gt; 第二(제이): 㢟(천) 行(행) 齒(치) 牙(<em>아</em>) 足(족) 분석</strong>
							</a>
							<a href="/bphanja/bonesolvehanja/contents/230510084822235xb" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">고안해냈다. 이 540개의 한자가 바로 부수의 효시이다. 이후 부수는 자전 편찬의 기준이 되었고, 당대의 저명한 자전들이... 유가(儒家)의 고전에 정통했다는 사실 외에 행적은 잘 알려져 있지 않다. 문자학(文字學)의 귀재이다. 후세 사람들은 그를... (어금니 <em>아</em>) 足(발 족) 疋(짝 필) 品(물건 품) 龠(피리 약) 𠕋(책 책)  ----------------------------------------------------   㢟 천천히... </p>
							</a>
							<a href="/bphanja/bonesolvehanja/contents/230510084822235xb" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">송재항</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2023.05.10.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%ED%95%9C%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">한자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EB%B6%80%EC%88%98" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">부수</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%9E%90%EC%9B%90%ED%92%80%EC%9D%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">자원풀이</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B3%A0%EC%82%AC%EC%84%B1%EC%96%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">고사성어</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%84%A4%EB%AC%B8%ED%95%B4%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">설문해자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B0%91%EA%B3%A8%EB%AC%B8%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">갑골문자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EA%B8%88%EC%84%9D%EB%AC%B8%EC%9E%90" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">금석문자</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%86%8C%EC%A0%84" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">소전</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%98%88%EC%84%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">예서</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/bphanja/bonesolvehanja/contents?tag&#x3D;%EC%B4%88%EC%84%9C" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">초서</a>
								</li>
							</ul>
						</div>
						<a href="/bphanja/bonesolvehanja/contents/230510084822235xb" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<span class="no_image"></span>
						</a>
						</div>
					</li>
					<li class="psp_content_item">
						<div class="psp_content_name">
							<a href="https://contents.premium.naver.com/professorjo/research" class="psp_channel_link" data-clk="pch_search.resultcontch" target="_blank">
								<span class="psp_channel_thumb_small">
									<img src="https://static-scs.pstatic.net/premium-service/v1/channel/Premium/professorjo/research/logo" class="psp_channel_img" width="18" height="18" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
								</span>
								<span class="psp_channel_name">디파이 농부 조선생 리서치</span>
							</a>
							<a href="/professorjo/research/contents?categoryId&#x3D;184c89c9b61000jwa" class="psp_category_name" data-clk="pch_search.resultcontcate" target="_blank">요즘 코인 트렌드는!?</a>
						</div>
						<div class="psp_content_inner">
						<div class="psp_text">
							<a href="/professorjo/research/contents/230407205812579ww" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<strong class="psp_name">LSD 머니레고의 중심, EigenLayer (<em>아</em>이건 레이어)</strong>
							</a>
							<a href="/professorjo/research/contents/230407205812579ww" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<p class="psp_info">오늘은 LSD 시장의 성장을 가속화 시킬 EigenLayer (<em>아</em>이건 레이어)에 대해 알<em>아</em>보고자 합니다. 1. LSD 탄생 배경 2020년 12월 비콘체인 발표 이후 1,700만개 이상의 이더리움이 예치되었습니다. 당시에는 이더리움이 언제 지분 증명 (PoS)으로 전환되어 출금 가능할지 알 수 없었기 때문에 예치자들은 자금을 효율적으로 운용할 수 없었습니다. 불편함을 해소하기... </p>
							</a>
							<a href="/professorjo/research/contents/230407205812579ww" class="psp_content_link" data-clk="pch_search.resultcont" target="_blank">
								<div class="psp_content_author">
									<em class="psp_content_author_by">by</em>
									<div class="psp_content_author_text">디파이 농부 조선생</div>
								</div>
							</a>
							<div class="psp_content_info">
								<span class="psp_content_info_text">2023.04.07.</span>
							</div>
							<ul class="psp_viewer_tag_list">
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;%EC%A1%B0%EC%84%A0%EC%83%9D" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">조선생</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;%EB%94%94%ED%8C%8C%EC%9D%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">디파이</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;NFT" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">NFT</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;%EC%95%84%EC%9D%B4%EA%B1%B4%EB%A0%88%EC%9D%B4%EC%96%B4" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">아이건레이어</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;LSD" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">LSD</a>
								</li>
								<li class="psp_viewer_tag_item">
									<a href="/professorjo/research/contents?tag&#x3D;%EC%9D%B4%EB%8D%94%EB%A6%AC%EC%9B%80" class="psp_viewer_tag_link" data-clk="pch_search.resultconttag" target="_blank">이더리움</a>
								</li>
							</ul>
						</div>
						<a href="/professorjo/research/contents/230407205812579ww" class="psp_content_thumb" data-clk="pch_search.resultcont" target="_blank">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA0MDdfNTUg/MDAxNjgwODY3Mzk3NzI0.3h71WapBqQpf8v5aqHXZPyunaDhmP6WIrxOVej4dCzIg.ZaakpWfFelcJlk2exYWveIHQ6w1h7d1qrSiLq64hHr8g.PNG/FtDepjNagAEJqxH.png?type&#x3D;nfs220_220" class="psp_content_img" width="50" height="50" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
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
