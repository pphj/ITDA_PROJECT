<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<meta name="description" content="미국주식 사관학교의 콘텐츠 상품을 구매하실 수 있습니다.">
	<title>이용권 선택 : 잇다</title>
		<link rel="stylesheet" href="/premium_service2.css">
	<link rel="shortcut icon" type="image/x-icon" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/favicon_M.ico" />
	<link rel="apple-touch-icon-precomposed" size="72x72" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="96x96" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="144x144" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<link rel="apple-touch-icon-precomposed" size="192x192" href="https://ssl.pstatic.net/static.news/image/news/premium/studio/meta/2021/04/22/og.png" />
	<base target="_parent">
	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164253-6d7db59565-qbtz6";
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
		var layoutName = "subscriptions";

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
<body class="as_white_background body_mp">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<!--<header class="flat_header_wrap as_white_background">
	<div class="flat_header">
	<h1 class="flat_header_logo">
	<a href="/" class="link_premium" data-clk="prod_order.pclogo"><span class="blind">Premium Contents</span></a>
	</h1>
	<a href="#" class="button_back _BACK" data-clk="prod_order.back">
		<span class="blind">이전으로</span>
	</a>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			이용권 선택
		</span>
	</h2>
	</div>
</header>-->
<hr>
<script>
	var svt = "20230918015535.324";
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
			<div class="container_content _GRID_TEMPLATE_COLUMN _STICKY_CONTENT">
			<div class="product_sidebar_box _TEMPLATE is_hidden" data-template-id="SCS_PREMIUM_SIDEBAR_CHANNEL" data-grid-template-column-sidebar="true">

    <div class="flat_header">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_premium" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title" style="margin-top: 40px;">
		<span class="flat_header_title_inner">
			이용권 선택
		</span>
	</h2>
	</div>
</div>
<div class="_PAY_ORDER_CONTENT product_wrap" data-cp-name="" data-sub-id="">
	<div class="product_head">
	    <div class="flat_header">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_premium" style="width: 30px;" src="image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			이용권 선택
		</span>
	</h2>
	</div>
	</div>
		<div class="product_ticket_wrap">
			<ul class="product_ticket_list">
			<!-- 티켓 시작 -->
			<c:forEach var="subProductList" items="${subProductList}">
				<li class="product_ticket_item _TICKET_LIST" data-ticket-id="sps-tck-1000000295" data-clk="prod_order.subscheck">
					<div class="product_ticket_inside">
						<input type="radio" id="product_0" name="product" class="product_ticket_check_input _TICKET_INPUT" data-ticket-id="sps-tck-1000000295">
						<label for="product_0" class="product_ticket_check_label"><span class="blind">상품선택</span></label>
						<div class="product_ticket_content">
							<div class="product_ticket_text">
								<div class="product_ticket_type">
									<span class="product_ticket_type_text">단기</span>
									<span class="product_ticket_type_text">월간이용권</span>
								</div>
								<strong class="product_ticket_name">${subProductList.productName }1개월 구독권</strong>
								<div class="product_ticket_price_wrap">
									<div class="product_ticket_price">
										<strong>${subProductList.productPrice}3,900</strong>
										<span class="product_ticket_price_text">
											원/월
										</span>
									</div>
								</div>
							</div>
							<div class="product_ticket_card">
								<div class="product_card_mini_wrap">
									<div class="product_card_mini">
										<div class="card_head">
											<strong class="card_tit">무제한 구독권</strong>
										</div>
										<div class="card_price_wrap">
											<div class="card_price">
												<strong>${subProductList.productPrice}</strong><span class="card_price_text">원/월</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="product_ticket_benefit">
							<strong class="product_ticket_benefit_title">혜택</strong>
							<ul class="product_ticket_benefit_list">
								<li class="product_ticket_benefit_item">${subProductList.productDetail}</li>
							</ul>
						</div>
					</div>
				</li>
				</c:forEach>
				
				<li class="product_ticket_item _TICKET_LIST" data-ticket-id="sps-tck-1000000825" data-clk="prod_order.subscheck">
					<div class="product_ticket_inside">
						<input type="radio" id="product_1" name="product" class="product_ticket_check_input _TICKET_INPUT" data-ticket-id="sps-tck-1000000825">
						<label for="product_1" class="product_ticket_check_label"><span class="blind">상품선택</span></label>
						<div class="product_ticket_content">
							<div class="product_ticket_text">
								<div class="product_ticket_type as_group">
									<span class="product_ticket_type_text">단기</span>
									<span class="product_ticket_type_text">월간이용권</span>
								</div>
								<strong class="product_ticket_name">3개월 구독권</strong>
								<div class="product_ticket_price_wrap">
									<div class="product_ticket_price">
										<strong>9,900</strong>
										<span class="product_ticket_price_text">
											원/월
										</span>
									</div>
								</div>
							</div>
							<div class="product_ticket_card">
								<div class="product_card_mini_wrap">
									<div class="product_card_mini">
										<div class="card_head">
											<strong class="card_tit">가족 구독권</strong>
										</div>
										<div class="card_price_wrap">
											<div class="card_price">
												<strong>9,900</strong><span class="card_price_text">원/월</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="product_ticket_benefit">
							<strong class="product_ticket_benefit_title">혜택</strong>
							<ul class="product_ticket_benefit_list">
								<li class="product_ticket_benefit_item">3개월 동안 콘텐츠 무제한 열람</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="product_ticket_item _TICKET_LIST" data-ticket-id="sps-tck-1000000524" data-clk="prod_order.subscheck">
					<div class="product_ticket_inside">
						<input type="radio" id="product_2" name="product" class="product_ticket_check_input _TICKET_INPUT" data-ticket-id="sps-tck-1000000524">
						<label for="product_2" class="product_ticket_check_label"><span class="blind">상품선택</span></label>
						<div class="product_ticket_content">
							<div class="product_ticket_text">
								<div class="product_ticket_type as_group">
									<span class="product_ticket_type_text">장기</span>
									<span class="product_ticket_type_text">월간이용권</span>
								</div>
								<strong class="product_ticket_name">6개월 구독권</strong>
								<div class="product_ticket_price_wrap">
									<div class="product_ticket_price">
										<strong>39,000</strong>
										<span class="product_ticket_price_text">
											원/월
										</span>
									</div>
								</div>
							</div>
							<div class="product_ticket_card">
								<div class="product_card_mini_wrap">
									<div class="product_card_mini">
										<div class="card_head">
											<strong class="card_tit">단체구독자용 상품</strong>
										</div>
										<div class="card_price_wrap">
											<div class="card_price">
												<strong>39,000</strong><span class="card_price_text">원/월</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="product_ticket_benefit">
							<strong class="product_ticket_benefit_title">혜택</strong>
							<ul class="product_ticket_benefit_list">
								<li class="product_ticket_benefit_item">6개월 동안 콘텐츠 무제한 열람</li>
							</ul>
						</div>
					</div>
				</li>
				<li class="product_ticket_item _TICKET_LIST" data-ticket-id="sps-tck-1000003964" data-clk="prod_order.subscheck">
					<div class="product_ticket_inside">
						<input type="radio" id="product_3" name="product" class="product_ticket_check_input _TICKET_INPUT" data-ticket-id="sps-tck-1000003964">
						<label for="product_3" class="product_ticket_check_label"><span class="blind">상품선택</span></label>
						<div class="product_ticket_content">
							<div class="product_ticket_text">
								<div class="product_ticket_type">
									<span class="product_ticket_type_text">장기</span>
									<span class="product_ticket_type_text">연간이용권</span>
								</div>
								<strong class="product_ticket_name">연간 구독권</strong>
								<div class="product_ticket_price_wrap">
									<div class="product_ticket_price">
										<strong>39,000</strong>
										<span class="product_ticket_price_text">
											원/연
										</span>
									</div>
								</div>
							</div>
							<div class="product_ticket_card">
								<div class="product_card_mini_wrap">
									<div class="product_card_mini">
										<div class="card_head">
											<strong class="card_tit">연간 구독권</strong>
										</div>
										<div class="card_price_wrap">
											<div class="card_price">
												<strong>39,000</strong><span class="card_price_text">원/연</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="product_ticket_benefit">
							<strong class="product_ticket_benefit_title">혜택</strong>
							<ul class="product_ticket_benefit_list">
								<li class="product_ticket_benefit_item">1년 동안 콘텐츠 무제한 열람</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	<div class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000295">
	<a href="${pageContext.request.contextPath}/product/subscriptions/info" class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.select">
		선택하기
	</a>
	</div>
	<div class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000825" style="display:none;">
	<a href="${pageContext.request.contextPath}/product/subscriptions/info" class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.select">
		선택하기
	</a>
	</div>
	<div class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000524" style="display:none;">
	<a href="${pageContext.request.contextPath}/product/subscriptions/info" class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.select">
		선택하기
	</a>
	</div>
	<div class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000003964" style="display:none;">
	<a href="${pageContext.request.contextPath}/product/subscriptions/info" class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.select">
		선택하기
	</a>
	</div>
</div>

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
