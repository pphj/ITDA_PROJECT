<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<!--타이틀 수정 필요-->
	<title>상품명 이름 : 상세정보</title>
	<base target="_parent">
<!-- 	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-h66vh";
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
		var layoutName = "subscription";

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
	</script> -->
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
			상세정보
		</span>
	</h2>
	</div>
</header>-->
<hr>
<!-- <script>
	var svt = "20230918020337.790";
	var timestamp = svt.substr(0, 8);
	var isLogin = true;

	var service = {
		premium: true
	};

	var analyticsNtmUrl = "https://ntm.pstatic.net/scripts/ntm_774a0c8e7c40.js";

	var envPhase = "production";
	var isProduction = true;
</script> -->
<div id="ct_wrap" class="container">
	<div id="ct" class="container_inner">
		<div class="container_main">
		
			<div class="container_content _GRID_TEMPLATE_COLUMN _STICKY_CONTENT">
			
<div class="_PAY_ORDER_CONTENT" data-cp-name="usa" data-sub-id="nasdaq" data-ticket-id="sps-tck-1000000295" data-ticket-sale-type="SUBSCRIBE_PERIOD_PAYNOW">
   
    <div class="flat_header" style="margin-top: 40px;">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_errow" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			상세정보
		</span>
	</h2>
	</div>
		<div class="product_detail_card">
			<div class="membership_card">
				<div class="mc_content">
					<div class="mc_text">
						<span class="mct_sub">
							<span class="mct_sub_text">개인</span>
							<span class="mct_sub_text">월간이용권</span>
						</span>
						<strong class="mct_name">1개월 구독권</strong>
					</div>
					<div class="mc_price_info">
						<span class="mcp_price">
							<em class="mcp_number">3,900</em>
							<span class="mcp_text">원/월</span>
						</span>
					</div>
				</div>
			</div>
			<dl class="product_detail_benefit_list">
				<dt>혜택</dt>
				<dd>
					<p class="product_detail_benefit">1개월 동안 콘텐츠 무제한 열람</p>
				</dd>
			</dl>
		</div>
	<div class="product_info_detail">
		<button id="_CP_INFO" type="button" class="button_product_info is_selected _TOGGLE" data-target="_CP_INFO" data-classValue="is_selected" data-show-clk="prod_order.cpinfoopen" data-hide-clk="prod_order.cpinfoclose">판매자 정보</button>
		<dl class="product_info_list">
			<div class="product_info_item">
				<dt>상호명</dt>
				<dd>잇다(주)</dd>
			</div>
			<div class="product_info_item">
				<dt>대표자</dt>
				<dd>많다많다</dd>
			</div>
			<div class="product_info_item">
				<dt>통신판매업번호</dt>
				<dd>2023-서울종로-0000</dd>
			</div>
			<div class="product_info_item">
				<dt>사업자등록번호</dt>
				<dd>123-45-67890</dd>
			</div>
			<div class="product_info_item">
				<dt>주소</dt>
				<dd>(우:12345) 서울시 종로구 종로리 123</dd>
			</div>
			<div class="product_info_item">
				<dt>이메일</dt>
				<dd><a href="javascript:;" class="_LINK" data-url="mailto:westernant21@gmail.com">itda@itda.com</a></dd>
			</div>
			<div class="product_info_item">
				<dt>전화번호</dt>
				<dd><a href="javascript:;" class="_LINK" data-url="tel:01087504742">02-0000-0000</a></dd>
			</div>
		</dl>
		<div class="_PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000295" >
			<button id="_PAY_CONTENT_INFO_0" type="button" class="button_product_info is_selected _TOGGLE" data-target="_PAY_CONTENT_INFO_0" data-classValue="is_selected" data-show-clk="prod_order.rodinfoopen" data-hide-clk="prod_order.prodinfoclose">상품정보제공 고시</button>
			<dl class="product_info_list">
				<div class="product_info_item">
					<dt>제작자 또는 공급자</dt>
					<dd>잇다(주)</dd>
				</div>
				<div class="product_info_item">
					<dt>이용조건·이용기간</dt>
					<dd>상품 정보 참조</dd>
				</div>
				<div class="product_info_item">
					<dt>상품 제공방식</dt>
					<dd>상품 정보 참조</dd>
				</div>
				<div class="product_info_item">
					<dt>최소시스템사양, 필수 소프트웨어</dt>
					<dd>Chrome 브라우저, IE 11, Android 8.0 이상, iOS 14.0 이상</dd>
				</div>
				<div class="product_info_item">
					<dt>청약철회 또는 계약해지에 따른 효과</dt>
					<dd>청약철회등 환불 안내 기준 확인</dd>
				</div>
				<div class="product_info_item">
					<dt>소비자 상담전화</dt>
					<dd><a href="javascript:;" class="_LINK" data-url="tel:15881588">1588-1588</a></dd>
				</div>
			</dl>
			<button id="_PAY_REFUND_INFO_0" type="button" class="button_product_info is_selected _TOGGLE" data-target="_PAY_REFUND_INFO_0" data-classValue="is_selected" data-show-clk="prod_order.revokeinfoopen" data-hide-clk="prod_order.revokeinfoclose">청약철회등 환불 안내</button>
			<dl class="product_refund_list">
				<div class="product_refund_item">
					<dt>기본 조건</dt>
					<dd>본 상품은 결제일 기준 7일 이내 콘텐츠 이용 이력이 없는 경우, 청약철회등이 가능하며 전액 환불됩니다.</dd>
					<dd>상품의 콘텐츠 이용이 개시된 경우 또는 구매후 이용 가능한 날로부터 7일이 경과된 경우, 청약철회가 제한될 수 있습니다.</dd>
					<dd>단건 상품 중 라이브 유형의 상품은 상품의 특성상 라이브 제공 개시 전까지만 청약철회등 가능하며, 일단 라이브가 시작되면 이용하지 않더라도 청약철회등이 불가능할 수 있습니다.</dd>
					<dd>그룹 상품의 경우(구독 상품 중 그룹형 구독인 경우), 그룹 회원(초대를 통해 구독한 이용권자)의 이용도 상품 이용에 포함됩니다.</dd>
					<dd>구매 시 적립 받은 네이버 포인트가 있는 경우, 청약철회등이 되면 즉시 회수 처리됩니다.</dd>
					<dd>네이버가 발행한 쿠폰을 사용하여 구매한 뒤 청약철회등 된 경우, 해당 쿠폰은 재발급되어 다시 사용이 가능합니다. 단, 부분 환불된 경우 또는 유효기간이 지난 쿠폰의 경우는 재발급 불가합니다.</dd>
					<dd>그 외에 판매자가 발행한 포인트/쿠폰의 경우 판매자가 정한 바에 따라 취급됩니다.</dd>
					<dd>구매 조건, 추가 조건에서 정하지 않은 사항 또는 정함이 있더라도 법령에 반하는 사항은 전자상거래등에서의소비자보호에관한법률 등 관련 법령에서 정한 바에 따릅니다.</dd>
				</div>
			</dl>
		</div>
	</div>
	<div class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000295">
	<a href="${pageContext.request.contextPath}/product/subscriptions/info/order" class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.subs">
		<span class="blind">프리미엄 채널</span>
		구독하기
	</a>
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
