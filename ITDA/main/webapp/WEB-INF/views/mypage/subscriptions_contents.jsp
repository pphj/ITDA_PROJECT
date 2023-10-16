<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>


<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>MY : 잇다</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/favicon_M.ico" />
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-76qkw";
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
		var layoutName = "my_subscriptions_contents";

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
<script>
	var svt = "20230917180054.709";
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
			<a href="${pageContext.request.contextPath}/my/myInfo" class="my_user_modify_link">
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
			<img class="_LAZY_LOADING" data-src="https://ssl.pstatic.net/static.news/image/news/m/2023/08/18/sidebar_banner.jpg" width="315" height="110" alt="">
		</a>
	</div>
</div>
<div class="my_section">
	<h2 class="my_section_title">구독 채널</h2>
	<div class="my_subscriptions_tab">
		<ul class="my_subscriptions_tab_list" role="tablist">
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="false">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_subs.chl">채널<em>2</em></button>
			</li>
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="true">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions/contents" data-clk="my_subs.cont">최신 콘텐츠</button>
			</li>
		</ul>
		<div class="my_section_info_wrap">
			<button id="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" type="button" class="my_section_info_button _TOGGLE" data-target="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" data-classValue="is_expanded"><span class="blind">안내</span></button>
			<div class="my_section_info_layer">
				<p>구독 채널에서 최근 15일 이내 발행한<br>콘텐츠를 모아서 보여 드립니다.</p>
				<button type="button" class="my_section_info_layer_close _TOGGLE" data-target="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" data-classValue="is_expanded"><span class="blind">닫기</span></button>
			</div>
		</div>
	</div>
	<ul class="my_subscriptions_content_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_SUBSCRIPTION_CONTENT_LIST" data-cursor-name="next" data-cursor="1699693987230649345" data-has-next="true">
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230916134538665wh" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTZfMjcy/MDAxNjk0ODM5NDkxMzU3.Q32rJfLKP8OxRF1WJCOca54E7QK5CJv9NW5f1l3XvmEg.inaqa_6go5SObCV7PONAkswjAPgtgKLcvr9Vslc-w5og.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">93. 소주는 세균을 죽일 수 있을까? 없을까?</strong>
							<p class="my_subscriptions_content_desc">많은 분들이 식탁의 세균을 잡는다고 (특히 음식점에서) 소주를 스프레이 통에 넣고 뿌립니다. 또 살균한다고 소주를 손에 비비는 분도 있습니다. 과연 소주는 세균의 수를 줄일 수 있을까요? 답은 &#x27;아닙니다. 소주는 세균을 죽일 수 없습니다&#x27;입니다. 소주는 사람은 잡을 수 있지만 세균은 못 잡습니다. 소주 스프레이로 닦은 음식점의 식탁은 살균이 된  식탁이 아닙니다. 그 위에 수저를 턱 얹어두면 앞의 손님의 입이나 손에서 나온 세균을 그대로 집어먹는 것입니다.  소주의 알코올 함량은 20~25% 정도 됩니다. 이 정도의 알코올 함량으로는 세균을 전혀 죽이지 못한다는 연구 결과가 있습니다. 소개해 드립니다. 자세한 내용은 아래를 보시고* 결론만 말씀드리면 물, 40% 알코올, 알코올 함량 40% 젤은 세균을 죽이는 효과가 전혀 없습니다. 알코올 함량 62%</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.16.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914181035921tg" class="my_subscriptions_content_link as_visited" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTRfMTUg/MDAxNjk0NjgyNTk4OTAw.oO8vmg8KeZxwD1RsJraljBspCSfeMUoLyXw8MZMxAw0g.etYHgCFOOIKzcLaT94re4kuqAJgiu8VXsQ1Huzp0nXIg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활영어회화 - 패션, 동사편 표현 41개 총정리(복습용)</strong>
							<p class="my_subscriptions_content_desc">생활영어회화 - 패션, 동사편 표현 41개를 총 정리해드리겠습니다. 본 글은 1편부터 3편까지 표현과 예문을 익힌다음에 복습용으로 활용하시면 더 도움이 됩니다.</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.15.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914174935696ww" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTRfMjQ1/MDAxNjk0NjgxMzQ5Mjc5.u7fP9tpKOHbwAWXdtWsSoglq7hX5tez0vhQmgbSaZtwg.ll2IStfKFKEeksXGW9yEL7107lcpvrGyDUVVYzKMBRMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">[Day 23] 장난감 가게에서 쇼핑 - 대화문</strong>
							<p class="my_subscriptions_content_desc">아이 생일선물을 위해 장난감 가게에서 부부끼리 쇼핑하는 상황의 대화문입니다. 먼저 음성파일을 들어본다음에 스크립트를 활용해주시기 바랍니다. 참고로, 원어민 성우는 영국인과 호주인이기 때문에 발음이 조금 어려울 수 있습니다. *빨간 표시된 표현은 아래에서 따로 정리해드리도록 하겠습니다. 👩 Honey, our daughter birthday is just around the corner. We need to find a gift for her. (자기야, 우리 아이 생일이 얼마 남지 않았어. 아이에게 줄 선물을 찾아야 해.) 👨 Yes, let&#x27;s go to the toy shop and see what we can get. (그래. 장난감 가게에 가서 무엇이 있는지 한번 보자.) 👩 I think she likes playing with dolls. Maybe we can find a nice one for her? (우리 딸은 인형 놀이를 좋아하는 것 같아. 좋은 인형을 찾아보는게 어떨까?) 👨 That&#x27;s a good idea! Let&#x27;s look for a doll that our daughter would enjoy playing with. (</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.14.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230903140357647if" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDJfMjY0/MDAxNjkzNjUxNTMzMzI0.gmI5uPnKFb5k26dMkq_Tx-OCI_AZrPyS98rJyp-0GQkg.ufsICyTTmkByZHFMEDsjSc1gXjzb8DB5A2GcrINK2hkg.JPEG/KakaoTalk_20230902_163055055.jpg?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">92. 수세미에 있는 세균은 어떻게 할 것인가?</strong>
							<p class="my_subscriptions_content_desc">집에 있는 화합물 중에 염소계 표백제 락스, 산소계 표백제 과탄산소다와 과산화수소는 세균도 잡습니다.* 표백제는 라디칼이라는 화학종(chemical species)을 만드는데 이 라디칼들은 세균을 만나면 세균의 세포 안에 있는 효소와 DNA 등을 가리지 않고 파괴하여 세균을 죽입니다. 그런데 염소계 표백제 락스는 스테인리스도 녹슬게 할 정도로 강력하니 부엌의 싱크대 근처에서 자주 만나면 안 되겠지요? 과산화수소는 약국에서 소독용으로 판매를 합니다. 그러나 과산화수소는 산소와 물로 빨리 분해하기 때문에 장시간 소독력을 지속하고 싶을 때는 사용하기 적절하지 않습니다. 그러면 남는 것은? 그렇지요. 과탄산소다. 과탄산소다는 물에서 서서히 녹으며 과산화수소를 만들어 내고 물속에서 과산화수소의 농도를 비교적 일정하게 유지될 수 있으니 소독</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.14.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230914011115366na" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA4MTlfMjY1/MDAxNjkyNDA4NTY0Nzc5.ZsOkNyUfjyh7AftVCfZeuR0DbjTCHUKl5_CKDGZjHhEg.BqaQOGoTQBEBck8W0rEMTLNALBvEpOljeWwTzzvH0qYg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활의 지혜 61[재발행]. 식초와 베이킹소다의 조합이 의미 있을 때와 없을 때를 구분한다. [식초와 베이킹소다를 섞어서 세제를 만든다고요? 의미 없는 행동!]</strong>
							<p class="my_subscriptions_content_desc">인터넷에서 무작정 퍼나르기의 폐해는 참 여러 곳에서 발견할 수 있습니다. 엉터리 정보도 많은 사람들이 말하면 진실로 둔갑합니다.  식초는 산성 물질이니 식초 혼자서도 세면대나 화장실에 생기는 하얀 물 때 탄산칼슘 침전물을 녹일 수 있습니다. 베이킹소다는 염기성 물질이니까 기름이나 단백질로 인한 때를 부수고 냄새를 제거할 수 있습니다. 워싱 소다만큼 강력한 효과는 없지만 말입니다.  이와 같이 혼자서도 잘하는 아이들을 같이 섞어 버리면 무슨 일이 벌어지나요? 학교 선생님들은 잘 아실 것 같은데요? 아주 개성이 강한 독불장군 두 명을 한 조로 만들어 과제를 시키면 어떤 일이 벌어지는지. 이미 여러 번 보여드린 반응식입니다만 아직도 안 보신 분들을 위하여 다시 씁니다, 식초의 주성분인 아세트산과 베이킹소다 (탄산수소나트륨)가</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.14.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230914010435957ux" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzAxMjRfMTI0/MDAxNjc0NTIyNzQzOTk0.oomH0i7DI27ZxpKsEUBkV1sJQNmvwAhZ-iOS0FdfT3og.eGGRTG2Gz6Mwuo-7DqxKE-ZiDz3Tcbylhrw98eW6G98g.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">독자의 질문 63. 새로 산 스테인리스 스틸 제품 표면의 시커먼 탄화규소 가루는 어떻게 제거해야 할까요? [연마제 제거에 대해 질문이 많아서 재발행합니다]</strong>
							<p class="my_subscriptions_content_desc">탄화규소 SiC 가루는 아주 단단하여 금속 제품 표면을 연마하여 반짝거리게 만들 수 있습니다. 문제는 이런 탄화규소 가루가 제품에 묻어 있는 채로 출시된다는 것입니다. 탄화규소의 성질에 대해 알아봅시다. 탄화규소는 물에도 기름에도 녹지 않습니다. 또한 산성 용액에도 염기성 용액에도 녹지 않습니다. 그러니 인터넷에 떠도는 &#x27;식초를 이용하여 녹여라, 베이킹소다를 이용하여 녹여라&#x27;라는 정보는 잘못된 것입니다. 이 탄화규소를 떼어내는 방법은 오로지 물리적인 방법을 이용하는 것 밖에 없습니다. 몇 가지를 생각해 볼 수 있겠네요. 식용유를 스테인리스 표면에 바르고 페이퍼 타월로 닦아 냅니다. 이후 세제를 이용하여 식용유를 제거합니다. 이 원리를 알려드릴게요. 식용유를 바르는 이유는 탄화규소 가루가 식용유와 혼합물이 되라고 바르는</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.14.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230913183040351ae" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTNfMTEz/MDAxNjk0NTk3NDA3MDc0.nhTau1b-XwCNf_g50nJu89T_XiTkKOMvbaNoQJYGZB4g.aH51n-U-0sdQChNQL52QGL90ESJ8lEW8nxskDvpmPrgg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활영어회화 - 패션, 형용사편 표현 30개 총정리(복습용)</strong>
							<p class="my_subscriptions_content_desc">생활영어회화 - 패션, 형용사편에 등장한 모든 표현들을 정리해드리겠습니다. 본 글은 아래 링크에서 각각의 표현과 예문들을 먼저 익힌 다음에 복습용으로 활용하시면 더 도움이 됩니다.</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.13.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230913181623227dr" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTNfMTk5/MDAxNjk0NTk2NTE0NTk4.HGhJa_s5u4gOwEWSlyC6DSfGpatPIXYy78ot7ldhSe4g.WmUFXkhqtHbIX6hOfQGdNu0TpYZKiZ2LgNEm5U7fcQMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">[Day 22] 고객사 미팅에 참석하기 위해 패스권 받기 - 대화문</strong>
							<p class="my_subscriptions_content_desc">미팅을 위해 고객사에 직접 방문하여 검문을 받는 형태의 대화문입니다. 먼저 음성파일을 들어본다음에 아래에 있는 스크립트를 활용해주시기 바랍니다! *빨간 표시된 표현은 아래에서 따로 정리해드리도록 하겠습니다. 😎 Good morning, sir. May I help you? (안녕하세요. 도움이 필요하신가요?) 👨 Good morning. I&#x27;m Edwin Chung, and I&#x27;m here to visit Mr. Smith. (안녕하세요. 저는 에드윈 청이라고 합니다. 스미스씨를 만나려고 왔습니다.) 😎 Alright, Mr. Chung. Could you please provide me with your identification and purpose of visit? (알겠습니다, 청님. 신분증과 방문 목적을 알려주시겠어요?) 👨 Sure, here&#x27;s my driver&#x27;s license. I&#x27;m here for a business meeting with Mr. Smith. (네, 여기 운전면허증 있습니다. 스미스씨와의 업무 미팅을 위해 왔습니다.) 😎 Thank you, Mr. Chung. Let me verify your information and contact Mr. Smith to confir</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.13.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230913084605478qk" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNjEg/MDAxNjk0MDEzMjA2NDI4.7YZw9hgLQH0kBzB4zd_QC-wNScewW-1L8TMTnDweLvYg.Ze6QLNhBEAb9CI5uscIg3_2qqjIviQ-8yFUrTu289MMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">&#x27;아무거나&#x27; 질문 13, 14, 15번에 대한 &#x27;내 마음대로&#x27; 답변</strong>
							<p class="my_subscriptions_content_desc">Q13. 빈 냄비 가열한 뒤 물 한 숟가락 부으면 1. 물방울들이 계란 프라이처럼 퍼지지 않고 구슬처럼 뭉쳐있어요. 2. 자리에 가만히 있지도 않고 증발하지도 않고 &quot;앗! 뜨거워&quot;를 외치며 냄비 안을 돌아다니다가 다른 물방울을 만나면 큰 구슬로 변합니다. 요리하다가 가끔 관찰하게 되는데 왜 그럴까요? 물방울이 냄비 바닥에 닿아 있는 부분은 기화가 일어나는 중입니다. 액체보다는 기체가 훨씬 큰 부피를 차지하지요? 기화가 일어나는 부분은 기체 압력이 갑자기 높아지니까 물방울을 밀어내는 것입니다. 이걸 생각해 보세요. 물을 책상 위에 조금 부어 놓고 후~ 불면 반대쪽으로 밀려가는 것을. 같은 원리입니다. 다른 물방울을 만나면 서로 뭉치는 것은 그렇게 하면 물방울 전체의 표면적이 작아지기 때문입니다. 물방울이 퍼지지 않고 동그란 것도 같은 이</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.13.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230912170852744cu" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTJfMjA1/MDAxNjk0NTA2MTAzNTUy.5knDaM11atb4eZY8dxzMwbDO8D4RozN80TwR-5yFAuQg.RZJxiZHSwCjGtP2d93wAAcwe0DdohfB0MNZJCq4qioAg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활영어회화 - 패션, 명사편 표현 43개 총정리(복습용)</strong>
							<p class="my_subscriptions_content_desc">생활영어회화 - 패션, 명사편 표현 43개를 총정리해드리겠습니다. 본 글은 1편~3편까지 표현과 예문을 익힌다음에 복습용으로 이용해주시면 더 도움이 됩니다.</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.12.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230912152146188dv" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTJfMjEy/MDAxNjk0NDk5Njc3NjQ5.RJWHXFAk8pru6qEys_c7MMr7qEeUJh7DLuRGuCufY_Ug._E1Z6FKuNUn7Jo1z258sxmBBRBifvA2S9IigLTKZ7VYg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">[Day 21] 영어로 환불 요청하기 - 대화문</strong>
							<p class="my_subscriptions_content_desc">영어로 환불을 요청하는 상황의 대화문입니다. 먼저 음성파일을 들어본다음에 아래 스크립트를 활용해주시기 바랍니다. *빨간 표시된 표현은 아래에서 따로 정리해드리겠습니다. 👧 Hello, how can I help you today? (안녕하세요, 무엇을 도와드릴까요?) 👩 I bought this item, but it&#x27;s not working. (이 제품을 샀었는데 지금 작동이 안 돼요.) 👧 Oh, I&#x27;m sorry to hear that. Do you have the receipt? (오, 그러셨군요. 영수증 갖고 계신가요?) 👩 Yes, here it is. (네, 여기있습니다.) 👧 Thank you. When did you purchase it? (감사합니다. 언제 구매하신거죠?) 👩 Last week. (지난주요.) 👧 Okay. According to our policy, we can offer a refund within 30 days of purchase. (그렇군요. 우리 정책에 따르면 구매일로부터 30일 이내에 환불이 가능합니다.) 👩 That&#x27;s great! Can I get a refund then? (좋네요! 그렇다면 환불을 받을 수 있나요?) 👧 Yes, cer</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.12.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230912083139028pq" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNjEg/MDAxNjk0MDEzMjA2NDI4.7YZw9hgLQH0kBzB4zd_QC-wNScewW-1L8TMTnDweLvYg.Ze6QLNhBEAb9CI5uscIg3_2qqjIviQ-8yFUrTu289MMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">&#x27;아무거나&#x27; 질문 10, 11, 12번에 대한 &#x27;내 마음대로&#x27; 답변</strong>
							<p class="my_subscriptions_content_desc">Q10. 교수님 최근 연구 결과 중에 미림, 맛술을 음식 조리 시 사용하면 가열해도 알코올이 남아 있다는 내용이 있더라고요. 그럼 미림과 맛술은 유아들 반찬에는 사용하면 안 되는 것일까요? A10. 어느 정도 온도에서 요리를 하는지, 시간은 어느 정도인지에 따라 알코올이 남아 있는 양은 다르지만 알코올이 끓는 온도(78.3도)에서 조리를 했을 때 두 시간 반 정도 이후에도 사용한 알코올 양의 5% 정도는 남는다고 합니다. 고기를 알코올에 재어 두었다가 가볍게 굽는 정도라면 사용한 알코올이 상당히 많이 남아있겠네요. 알코올이 끓는 온도에서 15분 동안 요리를 해도 40%의 알코올이 남아 있다고 하니까요. 물의 양이 아주 많고 오랫동안 끓이는 요리라면 별 걱정을 안 해도 되겠으나 그렇지 않은 경우는 아이들 요리에는 술을 사용하지 않는 것이 좋겠지요? Q</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.12.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230911181334552bu" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTFfOTIg/MDAxNjk0NDIzNTc3NTI4.oy1hQ_uFrP4GFj9BIW9Puh_1qE0KtZHdgA8HpD9tjNsg.ZPehb36WgKmX4R2er7U7Bd9ZWQDwp1okPTmukcKXiUYg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활영어회화 - 요리, 명사편 표현 50개 총정리(복습용)</strong>
							<p class="my_subscriptions_content_desc">생활영어회화 - 요리, 명사 표현 50개를 총정리해드리겠습니다. 본 글은 요리 명사 1편부터 4편까지 표현과 예문을 먼저 익힌다음에 복습용으로 활용하시면 더 도움이 됩니다.</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.11.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230911175036824wd" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTFfODEg/MDAxNjk0NDIyMDUyNDk4.KB2MfJSS-6bluQ-HtJFJDUoGWQU7PnJystFP7Dn924Yg.Engo4VxselffHH3E8BHvhrS74a6Cyfu5cUZJzxoOz4sg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">[Day 20] 여권 분실했을 때 영어로 설명하기 - 대화문</strong>
							<p class="my_subscriptions_content_desc">해외여행 도중 여권을 분실했을 때 영어로 말하는 상황의 대화문입니다. 아래 음성파일을 먼저 들어본 다음에 스크립트를 활용해주시기 바랍니다! *빨간 표시된 표현은 아래에서 따로 정리해드리겠습니다. 😎 Hello, how can I help you? (안녕하세요, 어떻게 도와드릴까요?) 👩 I&#x27;m in trouble. I can&#x27;t find my passport. (지금 큰일났어요. 제 여권을 찾을 수 없어요.) 😎 Oh no! Where did you last see it? (저런, 그러셨군요. 마지막으로 어디에서 보셨나요?) 👩 I think it was at the hotel, but now it&#x27;s gone. (호텔에서 본 것 같은데, 지금은 없어졌어요.) 😎 Stay calm. Did you check your things carefully? (일단 침착하세요. 짐들을 꼼꼼히 확인해보셨나요?) 👩 Yes, I looked everywhere, but couldn&#x27;t find it. (네, 다 뒤져봤는데 결국 못 찾았어요.) 😎 Okay, don&#x27;t worry. We&#x27;ll do our best to help you. Do you have any other ID with your name on it?</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.11.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230910235919197ix" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNjEg/MDAxNjk0MDEzMjA2NDI4.7YZw9hgLQH0kBzB4zd_QC-wNScewW-1L8TMTnDweLvYg.Ze6QLNhBEAb9CI5uscIg3_2qqjIviQ-8yFUrTu289MMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">&#x27;아무거나&#x27; 질문 7, 8, 9번에 대한 &#x27;내 마음대로&#x27; 답변</strong>
							<p class="my_subscriptions_content_desc">Q7. 플라스틱 제품이 햇볕에 오래 노출되었을 때 나는 냄새로 환경 호르몬이 유출되는지를 알 수 있을까요? 살고 있는 집의 창틀에서 플라스틱 냄새가 갈수록 심하게 나 찜찜해서 교체하고 싶은데, 가족들은 냄새는 몸에 해롭지 않다며 대수롭지 않게 생각합니다 A7. 빛(특히 에너지가 큰 자외선)이 지속적으로 플라스틱을 때리면 플라스틱을 구성하는 고분자의 화학 결합을 깰 수 있습니다. 플라스틱의 구조가 좀 헐거워지거나 깨지기도 하고요. 플라스틱 자체보다 사용한 접착제가 문제를 일으키고 있을 수도 있겠네요. 어쨌든 고분자 형성 시 반응이 덜 간 단량체 (monomer) 같은 것이 조금씩 휘발이 되면서 냄새를 낼 수 있지요. 화합물의 종류에 따라 몸에 좋지 않은 정도는 다르겠습니다만 냄새가 너무 심하게 난다는 것은 결코 좋은 상황은 아니네요. 바</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.10.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230909191831303uy" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDlfMjgz/MDAxNjk0MjUyODAwNDY2.x5xCdIw04fYpDHGm3oEZpqBNNtvDJxYQ53uLP8XBdCwg.jAJDQhUOMNjwsfcuRIZKXfe9OH8VJ461K5VWyUbiH9gg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">4. 요소수 부족, 왜 문제인가?</strong>
							<p class="my_subscriptions_content_desc">사람의 소변 무게의 약 2%나 차지하는 요소 (Urea), 이 흔해 빠진 것처럼 보이는 화합물이 또다시 문제를 일으키고 있네요. 이번에 요소의 최대 생산국 중국이 비료업체에 요소 수출 중단을 지시했다고 합니다. 2021년에 요소가 부족하여 트럭이 운행을 할 수 없어서 국가의 물류가 완전히 멈춰 버린 것을 기억할 것입니다. 요소가 부족하면 택배도 못 받고, 물자의 수송이 안 되어 공장 운영도 어렵고, 컨테이너를 싣고 갈 수가 없어서 수출/수입도 어려운 것입니다.  트럭 등에 장착된 경유 엔진은 아주 높은 온도에서 가동을 하는데 이 높은 온도에서는 질소와 산소가 반응을 하여 질소의 산화물 NOx가 생성이 됩니다. 이 NOx가 공기 중에 나오면 공기 중의 산소와 반응하여 몸에 아주 해로운 오존 O3를 만들어 내기 때문에 NOx를 공기 중에 배출하지 않도록 하는</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.09.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230909161703122sk" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNjEg/MDAxNjk0MDEzMjA2NDI4.7YZw9hgLQH0kBzB4zd_QC-wNScewW-1L8TMTnDweLvYg.Ze6QLNhBEAb9CI5uscIg3_2qqjIviQ-8yFUrTu289MMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">&#x27;아무거나&#x27; 질문 3, 5, 6번에 대한 &#x27;내 마음대로&#x27; 답변</strong>
							<p class="my_subscriptions_content_desc">Q3. 참기름이 고소하다고 느끼는 건 화학적으로 어떻게 설명할 수 있을까요? 냄새, 향기도 측량이 가능할까요? A3. 우리의 코에는 후각을 담당하는 신경 세포들이 아주 많이 있습니다. 그리고 후각 수용체라고 부르는 단백질이 이 신경세포의 세포 막에 있는데 냄새를 내는 분자들이 공기 중에 떠돌아다니다가 이 후각 수용체에 결합을 하게 되면 신경 세포가 뇌로 신호를 보내게 됩니다. &quot;애가 응가를 쌌다. 빨리 치워야 한다. 안 그러면 우리 다 죽어.&#x27;하면서 말이지요.  참기름에는 기름 말고도 공기 중으로 휘발이 될 수 있는 유기물들이 녹아 있습니다. 이 녀석들이 참기름의 특징적인 고소함을 책임집니다.  우리의 몸에 있는 후각 수용체의 종류는 400개 정도 밖에 안됩니다. 그런데 신기하게도 우리는 수천 개 이상의 냄새를 구분할 수 있지요. 후각 수용</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.09.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjA1MTVfMjI0/MDAxNjUyNjAzODU0Mzc5.S6Sj6BDIUnX6IQVaoa2Nx5soGWQaq-_u_nNGoJTpVhYg.CBaU0ouOWKEXgv130m07jZCVCQpimq6L32uwNYHcDCgg.JPEG/image%7Cpremium%7Cchannel%7Cchemistryeverywhere%7C2022%7C05%7C15%7C1652603854351.jpg?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">이광렬의 &quot;모두를 위한 화학&quot;</strong>
				</a>
				<a href="https://contents.premium.naver.com/chemistryeverywhere/knowledge/contents/230909141501182ds" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNjEg/MDAxNjk0MDEzMjA2NDI4.7YZw9hgLQH0kBzB4zd_QC-wNScewW-1L8TMTnDweLvYg.Ze6QLNhBEAb9CI5uscIg3_2qqjIviQ-8yFUrTu289MMg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">&#x27;아무거나&#x27; 질문 1, 2, 4번에 대한 &#x27;내 마음대로&#x27; 답변</strong>
							<p class="my_subscriptions_content_desc">Q1. 탑클래스 전문가의 관점에서, 우리나라 화학 관련 회사 중 가장 기술력 있고 장래성 있고 유망한 회사는 어디인지 물어도 되는 건지요?^^; 관련 주식 사려는 건 비밀이고요ㅎㅎㅎ A1. 제일 먼저 든 생각은 &#x27;아니 이 사람이 날 멕이려고 이러나?&#x27;였지만 분노를 가라앉히고 답을 드립니다.  저는 주식 전문가도 아니고 투자수익률도 남에게 자랑할 정도로 좋지는 않습니다. 제 실패의 경험에서 몇 가지만 말씀드리면^^ 다음은 저에게는 적용이 되더군요. 화학 회사 중에 R&amp;D에 많은 투자를 하는 회사 주식을 산다. 순전히 저의 경험입니다. 저에게 찾아와서 연구비를 주면서 연구를 해 달라는 회사는 적어도 그 시점에서 몇 년 내로 주가가 크게 오르더군요. 재정 상황도 좋고 미래를 생각하는 회사여서 그런 듯합니다. 그래서 저는 주변 동료 교수들이 &#x27;어떤 회</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.09.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230907172428240ct" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfNSAg/MDAxNjk0MDc0NzAxNDQ5.1iRtxTF3RQCwNp8m1IrALCyoBQZ3LNJwKwR3z4pre_cg.ZJRSuUTGgnsN65AaMsyVur5ax4e7_VpCHea61kGykPUg.PNG/SE-128767c4-d622-4230-8709-919ddb8e8d86.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">생활영어회화 - 요리, 명사 마지막편(10개)</strong>
							<p class="my_subscriptions_content_desc">생활영어회화 - 요리, 명사 마지막 편을 정리해드리겠습니다. 여기까지 오시느라 고생많으셨습니다. ▼엘리니아 마법도서관▼ 1. mixing bowl : 믹싱볼. &lt;실전 예문&gt; ▶ The chef mixed flour and sugar in a large mixing bowl. 요리사는 큰 믹싱 볼에 밀가루와 설탕을 섞었습니다. ▶ My mom mixed eggs and butter in a mixing bowl to make the dough. 엄마는 믹싱 볼에 달걀과 버터를 섞어 반죽을 만들었습니다. 2. bottle opener : 병따개. &lt;실전 예문&gt; ▶ I couldn&#x27;t find a bottle opener, so I had to use a spoon to open the soda bottle. 병 따개를 찾지 못해서 숟가락으로 탄산음료 병을 열어야 했습니다. ▶ My friend gifted me a unique bottle opener shaped like a guitar. 친구가 기타 모양으로 디자인된 독특한 병 따개를 선물해주었습니다. *soda : 탄산음료. 3. spoon holder : 수저통. &lt;실전 예문&gt; ▶ There is a spoon holder in the kitchen, so you can</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.07.</span>
					</div>
				</a>
			</div>
		</li>
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
						<img src="https://scs-phinf.pstatic.net/MjAyMjExMDNfMTcx/MDAxNjY3NDM3NTA3NzQw.6FO2E_Tk_6YwHAYi-50a26pOdDQWQebvFOM_6KR9xokg.724u8stegrnbL_DLl_Z5U8HfYQuesuVLGJIyeONubIUg.PNG/image%7Cpremium%7Cchannel%7Cbangkuseok%7C2022%7C11%7C03%7C1667437507721.png?type&#x3D;nfs200_200" width="22" height="22" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
					</div>
					<strong class="my_subscriptions_channel_name">방구석 어학연수</strong>
				</a>
				<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230907153906819ui" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<img src="https://scs-phinf.pstatic.net/MjAyMzA5MDdfMjUz/MDAxNjk0MDY4Njg2Njgw.e7WdwtdutW1XzDaHz5_Ap9oB2JY6S10BwbZBAY3MvrMg.G6sbQ3KOAZhQTVPL8nFly3Vj_n27y_QapHNecV_W2xgg.PNG/image.png?type&#x3D;nfs260_260" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
							<span class="icon_audio"><span class="blind">오디오</span></span>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">[Day19] 식당에서 컴플레인걸기 - 대화문</strong>
							<p class="my_subscriptions_content_desc">식당에서 컴플레인을 거는 상황에 대한 대화문입니다. 아래 음성파일은 먼저 들어본 다음에 스크립트를 활용해주시기 바랍니다! *빨간 표시로된 표현은 아래에서 따로 정리해드리겠습니다. 🧑 Yes ma&#x27;am, How can I help you? (네, 무엇을 도와드릴까요?) 👩 Hi. I actually noticed something wrong with my food. (안녕하세요. 제 음식에 문제를 발견했거든요.) 🧑 I&#x27;m sorry to hear that. What seems to be the problem? (그런 일이 있어서 죄송합니다. 무슨 문제가 있나요?) 👩 The food is not cooked enough, and the taste is not what I expected. (음식이 충분히 익지 않았고, 맛도 예상과 다릅니다.) 🧑 My apologies for the inconvenience. We take this seriously. Let me fix it right away. (불편을 드려서 죄송합니다. 이 문제를 심각하게 받아들여 지금 바로 조치하도록 하겠습니다.) 👩 Thanks for understanding. Can you cook it more or maybe give me a dif</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date">2023.09.07.</span>
					</div>
				</a>
			</div>
		</li>
	</ul>
	<div class="loading _CONTENT_LIST_LOADING">
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
