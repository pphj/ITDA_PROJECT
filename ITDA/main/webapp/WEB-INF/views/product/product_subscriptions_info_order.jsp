<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>결제하기 : 잇다</title>
	<base target="_parent">
<!-- 	<script>
		var g_ssc = nsc = "Mpremiumcontents.all";
		var g_default_area = "art";

		var svr = "one-service-premium-r-20230914-230914-164253-6d7db59565-l82xv";
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
		var layoutName = "subscription_order";

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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
/* function openKaKaoPayment() {
	  var url = "next_redirect_pc_url"; // URL을 정의합니다.
	  window.open(url); // 새 창에서 URL을 엽니다.
	}

	// 함수를 호출하여 결제를 시작할 수 있습니다.
	openKaKaoPayment(); */

</script>
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
	<a href="/" class="link_premium" data-clk="prod_chek.pclogo"><span class="blind">Premium Contents</span></a>
	</h1>
	<a href="#" class="button_back _BACK" data-clk="prod_chek.back">
		<span class="blind">이전으로</span>
	</a>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner as_pc">
			구매 확인
		</span>
	</h2>
	</div>
</header>-->
<hr>
<!-- <script>
	var svt = "20230918020710.411";
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
			<div class="product_sidebar_box _TEMPLATE is_hidden" data-template-id="SCS_PREMIUM_SIDEBAR_CHANNEL" data-grid-template-column-sidebar="true">
					
    <div class="flat_header" style="margin-top: 40px;">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_errow" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			결제하기
		</span>
	</h2>
	</div>
	
</div>
<div class=" product_head as_no_title _PAY_ORDER_CONTENT" data-cp-name="usa" data-sub-id="nasdaq" data-ticket-id="sps-tck-1000000295" data-ticket-sale-type="SUBSCRIBE_PERIOD_PAYNOW">
    <div class="flat_header">
    <div class="inline_header">
		<a href="#" class="button_back _BACK"><img class="link_errow" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
		<span class="blind">이전으로</span>
	</a> 
    </div>
	<h2 class="flat_header_title">
		<span class="flat_header_title_inner">
			결제하기
		</span>
	</h2>
	</div>
</div>
	<div class="product_detail_card">
		<div class="membership_card">
			<div class="mc_content">
				<div class="mc_text">
					<span class="mct_sub">
						<span class="mct_sub_text">개인</span>
						<span class="mct_sub_text">월간이용권</span>
					</span>
					<strong class="mct_name">무제한 구독권</strong>
				</div>
				<div class="mc_price_info">
					<span class="mcp_price">
						<em class="mcp_number">3,900</em>
						<span class="mcp_text">원/월</span>
					</span>
				</div>
			</div>
		</div>
	</div>
<div class="product_pay">
	<strong class="product_pay_info_title">구매 정보 확인</strong>
	<dl class="product_pay_info_list">
		<div class="product_pay_info_item">
			<dt>결제방식</dt>
			<dd>월간 정기 결제</dd>
		</div>
		<div class="product_pay_info_item">
			<dt>상품가</dt>
			<dd><em class="product_pay_price">3,900원</em></dd>
		</div>
		<div class="product_pay_info_item">
			<dt>이번 결제금액</dt>
			<dd>
				<em class="product_real_pay_price"><span class="_SUBSCRIPTION_DISCOUNT_PRICE">3,900</span>원</em>
			</dd>
		</div>
		<div class="product_pay_info_item">
			<dt>다음 결제금액</dt>
			<dd><em class="product_pay_price">3,900원</em></dd>
		</div>
		<div class="product_pay_info_item">
			<dt>예상 적립 포인트</dt>
			<dd><span class="product_pay_npay"><span class="_EXPECTED_MILEAGE_PRICE">39</span>원</span></dd>
		</div>
	</dl>
</div>
<div class="product_pay_info">
	<div class="product_pay_terms">
		<div class="pay_terms_check_all">
			<input type="checkbox" id="agreement_all" name="check_all" class="pay_terms_check_all_input _AGREEMENT_ALL" data-check-clk="prod_chek.allagree" data-uncheck-clk="prod_chek.allcancel">
			<label for="agreement_all" class="pay_terms_check_all_label">
				<i class="pay_terms_check_all_icon"></i>
				<span class="pay_terms_check_all_text">전체 동의 <em class="_AGREEMENT_OPTIONAL" data-enabled="false" style="display:none;">(선택 동의 포함)</em></span>
			</label>
		</div>
		<ul class="pay_terms_list">
			<li class="pay_terms_item _AGREEMENT_WRAP">
				<input type="checkbox" id="agreement_order" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
				<label for="agreement_order" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">구매 조건 확인 및 동의 (필수)</span>
				</label>
			</li>
			<li class="pay_terms_item _AGREEMENT_WRAP">
				<input type="checkbox" id="agreement_refund" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
				<label for="agreement_refund" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">청약철회등 환불 안내 확인 및 동의 (필수)</span>
				</label>
				<a href="#" class="pay_terms_check_link _TOGGLE" data-target="_CONTENT_LAYER_REFUNDGUIDE" data-prevent-scroll="true" data-clk="prod_chek.revokeinfo"><span class="blind">더보기</span></a>
			</li>
			<li class="pay_terms_item _AGREEMENT_WRAP">
				<input type="checkbox" id="agreement_inform" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
				<label for="agreement_inform" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">판매자에 개인 정보 제공 동의 (필수)</span>
				</label>
				<a href="#" class="pay_terms_check_link _TOGGLE" data-target="_CONTENT_LAYER_AGREEMENT" data-prevent-scroll="true" data-clk="prod_chek.privacyinfo"><span class="blind">더보기</span></a>
			</li>
			<li class="pay_terms_item _AGREEMENT_WRAP">
				<input type="checkbox" id="agreement_notice" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
				<label for="agreement_notice" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">하단 유의사항의 확인 및 동의 (필수)</span>
				</label>
			</li>
			<li class="pay_terms_item _AGREEMENT_WRAP _MARKETING_INFORM" style="display:none;" data-enabled="false" data-cp-name="usa" data-sub-id="nasdaq">
				<input type="checkbox" id="agreement_marketing" name="checkbox" class="pay_terms_check_input _AGREEMENT _MARKETING_OPTION" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel" data-optional="true">
				<label for="agreement_marketing" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">채널의 마케팅 알림 수신 동의 (선택)</span>
				</label>
			</li>
			<li class="pay_terms_item _AGREEMENT_WRAP _PREMIUM_MARKETING_INFORM" style="display:none;" data-enabled="false">
				<input type="checkbox" id="agreement_premium_marketing" name="checkbox" class="pay_terms_check_input _AGREEMENT _PREMIUM_MARKETING_OPTION" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel" data-optional="true">
				<label for="agreement_premium_marketing" class="pay_terms_check_label">
					<i class="pay_terms_check_icon"></i>
					<span class="pay_terms_check_text">프리미엄콘텐츠 마케팅 알림 수신 동의 (선택)</span>
				</label>
			</li>
		</ul>
	</div>
	<div class="product_pay_notice">
		<h3 class="product_pay_subtitle">유의사항</h3>
		<ul class="product_pay_notice_list">
			<li class="product_pay_notice_item">미성년자가 법정대리인의 동의 없이 상품 거래 계약을 체결하는 경우, 미성년자 본인 또는 법정대리인은 그 계약을 취소할 수 있습니다.</li>
			<li class="product_pay_notice_item">초대를 통한 구독의 변경 및 해지는 초대자의 권한에 따르며 이용권자는 초대자가 설정한 범위 내에서만 구독 이용이 가능합니다. 단, 초대를 통해 구독 중인 이용자는 스스로 초대 수락을 철회하고 구독 이용을 해지할 수 있습니다.</li>
			<li class="product_pay_notice_item">청약철회등 환불 관련 정책은 상품 상세설명 페이지 내 “청약철회등 환불 안내”를 참조해 주시기 바랍니다.</li>
			<li class="product_pay_notice_item">
				본 프리미엄 콘텐츠는 일반투자자 대상으로는 가장 높은 수준의 전문성과 깊이를 담고 있는 콘텐츠입니다. 구독 전, 2주 분량의 무료로 공개된 샘플 콘텐츠를 꼭 읽어보시고 글 내용이 큰 어려움 없이 이해가 가실 때에만 구독을 신청해 주시기를 정중하게 부탁드립니다. 배워가실 수 있는 인사이트가 정말 많을 거에요.
			</li>
		</ul>
	</div>
</div>
<div class="floating_button_wrap">
<%-- <form method="post" action="${pageContext.request.contextPath}/pay/kakaoPay.do">
<button type="button" class="floating_button _ORDER" id="kakaoPay" onclick="openKaKaoPayment()">결제하기</button>
</form>
 --%>
 		<span class="floating_button _ORDER">
 		<button id="btn-kakaopay">
			결제하기
 		</button>
		</span>
 </div>
<div id="_CONTENT_LAYER_REFUNDGUIDE" class="content_layer_wrap" style="display: none;">
	<div class="content_layer">
		<div class="content_layer_inside">
			<div class="content_layer_header">
				<h2 class="content_layer_title">
					청약철회등 환불 안내
				</h2>
				<button type="button" class="content_layer_close _TOGGLE" data-target="_CONTENT_LAYER_REFUNDGUIDE" data-prevent-scroll="true" data-clk="prod_chek.layerclose">
					<span class="blind">닫기</span>
				</button>
			</div>
			<div class="content_layer_container">
				<div class="content_layer_inner">
					<div class="product_common">
						<div class="product_refund_card">
							<div class="product_card_mini_wrap">
								<div class="product_card_mini">
									<div class="card_head">
										<strong class="card_tit">무제한 구독권</strong>
									</div>
									<div class="card_price_wrap">
										<div class="card_price">
											<strong>3,900</strong><span class="card_price_text">원/월</span>
										</div>
									</div>
								</div>
							</div>
							<div class="product_detail_info">
								<strong class="product_title">미국주식 사관학교 무제한 구독권</strong>
								<div class="product_price"><em>3,900</em><span class="price_unit">원</span> (월간)</div>
							</div>
						</div>
						<div class="product_refund_guide">
							<strong class="product_guide_title">기본 조건</strong>
							<ul class="guide_list">
								<li>본 상품은 결제일 기준 7일 이내 콘텐츠 이용 이력이 없는 경우, 청약철회등이 가능하며 전액 환불됩니다.</li>
								<li>상품의 콘텐츠 이용이 개시된 경우 또는 구매후 이용 가능한 날로부터 7일이 경과된 경우, 청약철회가 제한될 수 있습니다.</li>
								<li>단건 상품 중 라이브 유형의 상품은 상품의 특성상 라이브 제공 개시 전까지만 청약철회등 가능하며, 일단 라이브가 시작되면 이용하지 않더라도 청약철회등이 불가능할 수 있습니다.</li>
								<li>그룹 상품의 경우(구독 상품 중 그룹형 구독인 경우), 그룹 회원(초대를 통해 구독한 이용권자)의 이용도 상품 이용에 포함됩니다.</li>
								<li>구매 시 적립 받은 네이버 포인트가 있는 경우, 청약철회등이 되면 즉시 회수 처리됩니다.</li>
								<li>네이버가 발행한 쿠폰을 사용하여 구매한 뒤 청약철회등 된 경우, 해당 쿠폰은 재발급되어 다시 사용이 가능합니다. 단, 부분 환불된 경우 또는 유효기간이 지난 쿠폰의 경우는 재발급 불가합니다.</li>
								<li>그 외에 판매자가 발행한 포인트/쿠폰의 경우 판매자가 정한 바에 따라 취급됩니다.</li>
								<li>구매 조건, 추가 조건에서 정하지 않은 사항 또는 정함이 있더라도 법령에 반하는 사항은 전자상거래등에서의소비자보호에관한법률 등 관련 법령에서 정한 바에 따릅니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <div id="_CONTENT_LAYER_AGREEMENT" class="content_layer_wrap" style="display: none;">
	<div class="content_layer">
		<div class="content_layer_inside">
			<div class="content_layer_header">
				<h2 class="content_layer_title">
					판매자에 개인정보 제공 동의
				</h2>
				<button type="button" class="content_layer_close _TOGGLE" data-target="_CONTENT_LAYER_AGREEMENT" data-prevent-scroll="true" data-clk="prod_chek.layerclose">
					<span class="blind">닫기</span>
				</button>
			</div>
			<div class="content_layer_container">
				<div class="content_layer_inner">
					<div class="product_common">
						<div class="product_guide">
							<strong class="product_guide_title">개인정보를 제공받는 자</strong>
							<ul class="guide_list">
								<li><em>알데바란</em></li>
							</ul>
						</div>
						<div class="product_guide">
							<strong class="product_guide_title">제공하는 개인정보 항목</strong>
							<ul class="guide_list">
								<li>이름, 마스킹 처리된 아이디, 성별, 연령대</li>
								<li>서비스 이용기록(예: 구독일, 해당 채널의 최근 접속일, 해지예정 여부)</li>
							</ul>
						</div>
						<div class="product_guide">
							<strong class="product_guide_title">개인정보를 제공받는 자의 이용 목적</strong>
							<ul class="guide_list">
								<li><em>구독자 관리 및 상품 판매, 개선 등 판매회원이 프리미엄콘텐츠 채널을 운영하는데 이용합니다.</em></li>
							</ul>
						</div>
						<div class="product_guide">
							<strong class="product_guide_title">개인정보를 제공받는 자의 개인정보 보유 및 이용기간</strong>
							<ul class="guide_list">
								<li><em>개인정보를 제공받는 자가 운영하는 채널의 구독을 해지하는 시점까지 이용합니다.</em></li>
							</ul>
						</div>
						<div class="product_guide">
							<strong class="product_guide_title">동의 거부권 등에 대한 고지</strong>
							<ul class="guide_list">
								<li>정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 개인정보를 제공받는 자가 운영하는 채널의 구독이 제한될 수 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 -->
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
<script src="${pageContext.request.contextPath}/resources/js/payment/payment.js">

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
