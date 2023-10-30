<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
		<title>MY : 잇다</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
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
</head>
<body class="as_my_home body_mp as_my_home">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>

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

	<div class="sidebar_banner _LAZY_LOADING_ERROR_HIDE">
		<a href="https://blog.naver.com/premiumcontents/223186087023" data-clk="my_lnb.banner">
			<img class="_LAZY_LOADING" data-src="https://ssl.pstatic.net/static.news/image/news/m/2023/08/18/sidebar_banner.jpg" width="315" height="110" alt="">
		</a>
	</div>
</div>
<div id="likeItCountViewDiv" class="my_section">
	<h2 class="my_section_title">좋아요 콘텐츠 <em>${cnt}</em><span class="blind">개</span></h2>
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
				<%-- 반복 시작 --%>
				<c:forEach var="contentList" items="${contentList}">
				
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" style="display:block;">
						<fmt:formatDate value="${contentList.created_at}" pattern="yyyy.MM.dd" />.</strong>
					<div class="my_attention_inside">
						<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914181035921tg" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
								<img src="https://scs-phinf.pstatic.net/MjAyMzA5MTRfMTUg/MDAxNjk0NjgyNTk4OTAw.oO8vmg8KeZxwD1RsJraljBspCSfeMUoLyXw8MZMxAw0g.etYHgCFOOIKzcLaT94re4kuqAJgiu8VXsQ1Huzp0nXIg.PNG/image.png?type&#x3D;nfs260_260" width="94" height="94" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
							</div>
						</a>
						<div class="my_attention_text">
							<a href="https://contents.premium.naver.com/bangkuseok/bangkuseok1/contents/230914181035921tg" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">${contentList.chName}</div>
								<strong class="my_attention_title">
								${contentList.boardTitle}</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">						
								<fmt:formatDate value="${contentList.boardDate}" pattern="yyyy.MM.dd" />.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module _reactionModule" data-sid="SCS" data-cid="p_bangkuseok_bangkuseok1_230914181035921tg">
										<a class="u_likeit_list_btn _button" data-type="like" aria-pressed="false" data-ishiddenlabel="true" data-isHiddenZeroCount="true" >
											<span class="u_ico _icon"></span>
											<em class="u_txt _label">좋아요</em>
											<em class="u_cnt _count">${contentList.boardHeart}</em>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div>
						<button type="button" class="my_attention_remove" id="delButton" data-boardnum="${contentList.boardNum}"><span class="blind">삭제</span></button>
						</div>
					</div>
				</li>
				</c:forEach>
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
<script src="${pageContext.request.contextPath}/js/mypage/contents_heart.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>

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
