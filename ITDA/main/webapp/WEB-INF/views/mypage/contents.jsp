<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
		<title>네이버 프리미엄콘텐츠</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/favicon_M.ico" />
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164253-6d7db59565-dhjhw";
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
		var layoutName = "my_visited_contents";

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
<!--<header class="flat_header_wrap as_my_home">
	<div class="flat_header">
	<h1 class="flat_header_logo">
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
<hr>-->
<script>
	var svt = "20230918010858.272";
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
		<a href="#" class="button_back _BACK"><img class="link_errow" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
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
			<a href="https://nid.naver.com/user2/help${pageContext.request.contextPath}/myInfo?lang=ko_KR" class="my_user_modify_link" data-clk="my_lnb.myinfo">
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
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_lnb.substab"><span class="my_tab_text">구독 채널</span></a>
				</li>
				<li class="my_tab_item is_active">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/contents" data-clk="my_lnb.constab"><span class="my_tab_text">관심 콘텐츠</span></a>
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
<div id="likeItCountViewDiv" class="my_section">
	<h2 class="my_section_title">좋아요 콘텐츠 <em>8</em><span class="blind">개</span></h2>
	<div class="my_section_info_wrap">
		<button id="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" type="button" class="my_section_info_button _TOGGLE" data-target="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" data-classValue="is_expanded" data-clk="my_conts.tooltip"><span class="blind">안내</span></button>
		<div class="my_section_info_layer">
			<p>최근 30일간 확인한 콘텐츠를 조회할 수 있습니다.</p>
			<button type="button" class="my_section_info_layer_close _TOGGLE" data-target="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" data-classValue="is_expanded" data-clk="my_conts.tooltip"><span class="blind">닫기</span></button>
		</div>
	</div>
	<div class="my_attention_wrap">
		<div class="my_attention">
			<ul class="my_attention_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_VISITED_CONTENT_LIST" data-cursor-name="next" data-cursor="2023-09-04T11:31:58.439" data-has-next="false" data-total-count="8">
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.17." style="display:none;">2023.09.17.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914181035921tg" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTRfMTUg/MDAxNjk0NjgyNTk4OTAw.oO8vmg8KeZxwD1RsJraljBspCSfeMUoLyXw8MZMxAw0g.etYHgCFOOIKzcLaT94re4kuqAJgiu8VXsQ1Huzp0nXIg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914181035921tg" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">방구석 어학연수</div>
								<strong class="my_attention_title">생활영어회화 - 패션, 동사편 표현 41개 총정리(복습용)</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.17.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_bangkuseok_bangkuseok1_230914181035921tg">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230914181035921tg" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.08." style="display:none;">2023.09.08.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/lovelab/love/contents/230906224626503lq" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDVfMjY4/MDAxNjkzODU0MjE5NTUz.Kf9vEwzS5bGEz918CRW9CErFIt59KbsyYiXm_OP6Mygg.wyVACyWbQIVeabn6_UKwM4Nzq4ayS3vFBObYLWcFDBYg.JPEG/NPC_%EC%83%81%EC%9C%84_%EC%8A%A4%ED%82%A8.jpg?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/lovelab/love/contents/230906224626503lq" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">연애연구소</div>
								<strong class="my_attention_title">[회피형이 왜 그럴까? ⑤] 화해</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.08.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_lovelab_love_230906224626503lq">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230906224626503lq" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.07." style="display:none;">2023.09.07.</strong>
					<div class="my_attention_inside">
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/slowpianist/pandapiano/contents/230901042757896rf" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">노애리의 피아노 이야기</div>
								<strong class="my_attention_title">헝가리 현대 음악</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.07.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_slowpianist_pandapiano_230901042757896rf">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230901042757896rf" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.07." style="display:none;">2023.09.07.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230830092737636du" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA4MzBfNCAg/MDAxNjkzMzU0NzYyODUz.rqNPFijj2JBcZ1g8Q9hP3MHm5bRHmSxwmKDHYCeD4fIg.vO0Bo0x2VvFRZpNhMCJyLDXEqea3kDOcD_mu8Qb_Izwg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230830092737636du" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">이광렬의 &quot;모두를 위한 화학&quot;</div>
								<strong class="my_attention_title">생활의 지혜 64. 영하 20도의 극강의 &#x27;시원함&#x27;을 자랑하는 (얼음주머니가 아니고) 물주머니: 뒤늦은 여름 선물</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.07.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_chemistryeverywhere_knowledge_230830092737636du">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230830092737636du" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.06." style="display:none;">2023.09.06.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/hsacademy/hsacademy1/contents/230906080347308ep" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDZfMjUw/MDAxNjkzOTUzMDQxNzc2.QPmndncrwoO19cF7_oFTVQLErmuomAawy7kFXRnteM0g.UKb-tU2d9mdcW52AuamKZxW-77ClmA0HzAL0X71AYFAg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/hsacademy/hsacademy1/contents/230906080347308ep" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">이효석아카데미</div>
								<strong class="my_attention_title">사우디 감산 연장 소식에 유가 상승 | 김정은 푸틴 만난다? | 시장은 조정을 받았지만, 개별종목 이슈는 많았습니다 | 세금에 대한 고민을 시작해야겠습니다.</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.06.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_hsacademy_hsacademy1_230906080347308ep">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230906080347308ep" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.06." style="display:none;">2023.09.06.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/hsacademy/hsacademy1/contents/230905070527341qm" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDVfMTQ3/MDAxNjkzODYzMDM5MDM4.JjsjVRZ-qYByWU6ZwPZGktvtgFZBHGwwyMco9KBdhxEg.vRFujdMdbNWe-jAin3VMnDIhme1pcPoZdL4Lugrmo8Mg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/hsacademy/hsacademy1/contents/230905070527341qm" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">이효석아카데미</div>
								<strong class="my_attention_title">[강추] 레이달리오가 말하는 &quot;부의 대이동(Great Wealth Transfer)&quot;의 내용을 정리하면서 머리가 맑아졌습니다! 정말 깔끔하고, 인사이트풀하네요~</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.06.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_hsacademy_hsacademy1_230905070527341qm">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230905070527341qm" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.04." style="display:none;">2023.09.04.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/seosweet2020/seosweet/contents/230821215523297rl" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA4MjFfMjI3/MDAxNjkyNjIxNjIwMzMz.RfIwgNRUzdlvMMGZJcFvgAMfzl_XckgUOdn140ZvpnMg.EIs2rRjwYnP_D_5vRao-h0bzfQr-e6PZOB9zYqx859Mg.JPEG/%EC%84%AC%EB%84%A4%EC%9D%BC.jpg?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/seosweet2020/seosweet/contents/230821215523297rl" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">서스윗 SEOSWEET</div>
								<strong class="my_attention_title">[교통기관] 항공 교통기관 모빌 도안 / 미술 / 활동지 / 자료</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.04.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_seosweet2020_seosweet_230821215523297rl">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230821215523297rl" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" data-processed="false" data-group-title="2023.09.04." style="display:none;">2023.09.04.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230902173109716nu" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDJfMTg3/MDAxNjkzNjQxMzU3MzU5.Utrd63anLd7goC-zE4jCdwvDm62-WN_6peXD3CTNnXUg.qL3QypeTxA7EwJpuDrUqjj5bgHjAjvVn-8mhqfm727gg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230902173109716nu" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">이광렬의 &quot;모두를 위한 화학&quot;</div>
								<strong class="my_attention_title">90. 아주 깔끔한 당신을 위한 변기 청결유지법 [화학 고급 응용 편]</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">2023.09.04.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_chemistryeverywhere_knowledge_230902173109716nu">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="my_attention_remove _DELETE_VISITED_CONTENT" data-content-id="230902173109716nu" data-clk="my_conts.del"><span class="blind">삭제</span></button>
					</div>
				</li>
			</ul>
		</div>
	</div>
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
