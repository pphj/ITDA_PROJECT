<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


</div>
<div class="my_section">
	<h2 class="my_section_title">구독 채널</h2>
	<div class="my_subscriptions_tab">
		<ul class="my_subscriptions_tab_list" role="tablist">
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="false">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_subs.chl">채널</button>
			</li>
			<li class="my_subscriptions_tab_item" role="tab" aria-selected="true">
				<button type="button" class="my_subscriptions_tab_button _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions/contents" data-clk="my_subs.cont">최신 콘텐츠</button>
			</li>
		</ul>
		<div class="my_section_info_wrap">
			<button id="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" type="button" class="my_section_info_button _TOGGLE" data-target="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" data-classValue="is_expanded"><span class="blind">안내</span></button>
			<div class="my_section_info_layer">
				<p>구독 채널에서 최근 14일 이내 발행한<br>콘텐츠를 모아서 보여 드립니다.</p>
				<button type="button" class="my_section_info_layer_close _TOGGLE" data-target="_SCS_MY_SUBSCRIPTION_CONTENT_LIST_INFO_LAYER" data-classValue="is_expanded"><span class="blind">닫기</span></button>
			</div>
		</div>
	</div>
	<ul class="my_subscriptions_content_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_SUBSCRIPTION_CONTENT_LIST" data-cursor-name="next" data-cursor="1699693987230649345" data-has-next="true">
<%-- 	    	<c:choose>
			<c:when test="${newContentLis.ownerId eq null}">
			<div class="no_contents_center">
				<img class="no_contents" src="${pageContext.request.contextPath}/image/mypage/content_null.png">
			</div>
			</c:when>
		<c:otherwise> --%>
		<!-- list 시작 -->
		<c:forEach var="newContentList" items="${newContentList}">
		
		<li class="my_subscriptions_content_item">
			<div class="my_subscriptions_content_inside">
				<a href="${pageContext.request.contextPath}/channels/${newContentList.chNum}?userid=${newContentList.ownerId}" class="my_subscriptions_channel_link" data-clk="my_subs.contchlgo">
					<div class="my_subscriptions_channel_thumb">
					<c:choose>
                   <c:when test="${empty newContentList.chProfile}">
                      <img src="${pageContext.request.contextPath}/resources/image/common/itda_logo3.png" width="22" height="22">
                   </c:when>
                	<c:otherwise>
                    	<img src="${pageContext.request.contextPath}/image/MemberUpload/${newContentList.ownerId}${newContentList.chProfile}" width="22" height="22" <span class=&quot;no_image&quot;></span>>
                	</c:otherwise>
                </c:choose>
					
					</div>
					<strong class="my_subscriptions_channel_name">${newContentList.chName}</strong>
				</a>
				<a href="${pageContext.request.contextPath}/contents/${newContentList.chNum}/${newContentList.boardNum}?userid=${newContentList.writer}" class="my_subscriptions_content_link" data-clk="my_subs.contgo">
					<div class="my_subscriptions_content_link_inner">
						<div class="my_subscriptions_content_thumb">
							<c:choose>
                                <c:when test="${empty newContentList.thumbNail}">
                                    <img src="${pageContext.request.contextPath}/resources/image/common/itda_logo3.png" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
                                        </c:when>
                                        <c:otherwise>
                                             <img src="${pageContext.request.contextPath}/image/contents/${newContentList.chNum}${newContentList.thumbNail}" width="82" height="82" alt="" onerror="this.outerHTML='<span class=&quot;no_image&quot;></span>'">
                                        </c:otherwise>
                                    </c:choose>
						</div>
						<div class="my_subscriptions_content_text">
							<strong class="my_subscriptions_content_title">${newContentList.boardTitle}</strong>
							<p class="my_subscriptions_content_desc">
								<c:choose>
								    <c:when test="${fn:length(newContentList.intro) <= 30}">
								        <c:out value="${newContentList.intro}" />
								    </c:when>
								    <c:otherwise>
								        <c:out value="${fn:substring(newContentList.intro, 0, 30)}..." />
								    </c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
					<div class="my_subscriptions_content_info">
						<span class="my_subscriptions_content_date"><fmt:formatDate value="${newContentList.boardDate}" pattern="yyyy.MM.dd" />.</span>
					</div>
				</a>
			</div>
		</li>
		</c:forEach>
<%-- 		</c:otherwise>
		</c:choose> --%>
	</ul>
	<div class="loading">
	<div class="loader" style="display:flex; justify-content:center;">
	<button id="morebtn" type="button" class="load-more-button btn bt-item bt-hover">더보기</button> 
	</div>
	</div>
<!-- 	<div class="loading _CONTENT_LIST_LOADING">
		<div class="loader">
			<div class="dot dot1"></div>
			<div class="dot dot2"></div>
			<div class="dot dot3"></div>
			<div class="dot dot4"></div>
			<div class="dot dot5"></div>
			<div class="dot dot6"></div>
		</div>
	</div> -->
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
$(document).ready(function() {
    var showitems = 6;
    var visibleitems = 6;

    function toggleEventItems() {
       	$(".my_subscriptions_content_list li").hide();
        $(".my_subscriptions_content_list li:lt(" + visibleitems + ")").show();

        if (visibleitems >= $('.my_subscriptions_content_list li').length) {
            $('#morebtn').hide();
        } else {
            $('#morebtn').show();
        }
    }

    toggleEventItems();

    $('#morebtn').click(function(e) {
        e.preventDefault();
        visibleitems += showitems;
        toggleEventItems();
    });
});

</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
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
