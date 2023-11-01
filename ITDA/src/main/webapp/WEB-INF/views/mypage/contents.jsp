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

		var svr = "one-service-premium-r-dhjhw";
		var nelo = {
			sampleNumber : 100,
			maxCount : 100,
			maxSendMessage : "로그 전송 최대치 도달"
		};


		var ajaxDomain = "";
		var urlPrefix = "";
		var newsDomain = "";


	</script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_common.min.js"></script>
</head>
<body class="as_white_background as_my_home body_mp as_my_home">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>

<script>
	
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

</div>
<div id="likeItCountViewDiv" class="my_section">
	<h2 class="my_section_title">관심 콘텐츠 <em>${cnt}</em><span class="blind">개</span></h2>
	<div class="my_section_info_wrap">
		<button id="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" type="button" class="my_section_info_button _TOGGLE" data-target="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" data-classValue="is_expanded" data-clk="my_conts.tooltip"><span class="blind">안내</span></button>
		<div class="my_section_info_layer">
			<p>'좋아요'한 콘텐츠를 조회할 수 있습니다.</p>
			<button type="button" class="my_section_info_layer_close _TOGGLE" data-target="_SCS_HYPERGRAPE_VISITED_LIST_INFO_LAYER" data-classValue="is_expanded" data-clk="my_conts.tooltip"><span class="blind">닫기</span></button>
		</div>
	</div>
	<div class="my_attention_wrap">
	<form id="fm">
		<input type="hidden" name="boardNum" value="">
		<div class="my_attention">
			<ul class="my_attention_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_VISITED_CONTENT_LIST" data-cursor-name="next" >
				<c:choose>
				<c:when test="${cnt eq 0}">
				<div class="no_contents_center">
					<img class="no_contents" src="${pageContext.request.contextPath}/image/mypage/content_null.png">
				</div>
				</c:when>
				<c:otherwise>
				<%-- 반복 시작 --%>
				<c:forEach var="contentList" items="${contentList}">
				
				<li class="my_attention_item">
					<strong class="my_attention_top_date _CONTENT_LIST_GROUP_TITLE" style="display:block;">
						<fmt:formatDate value="${contentList.created_at}" pattern="yyyy.MM.dd" />.</strong>
					<div class="my_attention_inside">
						<a href="${pageContext.request.contextPath}/contents/${contentList.chNum}/${contentList.boardNum}?userid=${contentList.writer}" class="my_attention_thumb" data-clk="my_conts.list">
							<div class="visited_content_thumb">
							        <c:choose>
                                        <c:when test="${empty contentList.thumbNail}">
                                            <img class="card_img"
                                             src="${pageContext.request.contextPath}/resources/image/common/itda_logo3.png">
                                        </c:when>
                                        <c:otherwise>
                                            <!--<img class="card_img"
                                             src="${pageContext.request.contextPath}/resources/image/common/itda_logo3.png">-->
                                             <img class="card_img" src="${pageContext.request.contextPath}/image/contents/${contentList.chNum}${contentList.thumbNail}">
                                        </c:otherwise>
                                    </c:choose>
							</div>
						</a>
						<div class="my_attention_text">
							<a href="${pageContext.request.contextPath}/contents/${contentList.chNum}/${contentList.boardNum}?userid=${contentList.writer}" class="my_attention_text_link" data-clk="my_conts.list">
								<div class="my_attention_channel">${contentList.chName}</div>
								<strong class="my_attention_title" >
								<c:choose>
								    <c:when test="${fn:length(contentList.boardTitle) <= 40}">
								        <c:out value="${contentList.boardTitle}" />
								    </c:when>
								    <c:otherwise>
								        <c:out value="${fn:substring(contentList.boardTitle, 0, 40)}..." />
								    </c:otherwise>
								</c:choose>
								</strong>
							</a>
							<div class="my_attention_info">
								<div class="my_attention_date">						
									<fmt:formatDate value="${contentList.boardDate}" pattern="yyyy.MM.dd" />.</div>
								<div class="my_attention_count">
									<div class="u_likeit_list_module">
										<a class="u_likeit_list_btn _button">
											<span class="u_ico _icon">
											<img src='${pageContext.request.contextPath}/image/content/heart2.png' style="width:13px; margin-right:2px"></span>
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
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
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
<div id="_TOAST_WRAP"></div>
<script src="${pageContext.request.contextPath}/js/mypage/contents_heart.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>

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
