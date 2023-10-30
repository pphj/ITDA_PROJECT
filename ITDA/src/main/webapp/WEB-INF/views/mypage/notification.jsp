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

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-nnwp8";
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
		var layoutName = "my_notification_marketing";

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
<body class="as_white_background body_mp">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<script>
	var svt = "20230917184229.713";
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
			설정
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
<h2 class="my_title">설정</h2>
<div class="my_tab_wrap">
	<ul class="my_tab">
		<li class="my_tab_item is_active">
			<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/notification" data-clk="my_lnb.setmrk">
				<span class="my_tab_text">
					구독 <span class=my_tab_sub_text>목록</span>
					<em>${count}</em>
				</span>
			</a>
		</li>
	</ul>
</div>
    <form id="fm">
    	<input type="hidden" name="chNum" value="">
<div class="my_setting as_news _TEMPLATE" data-template-id="SCS_PREMIUM_MY_NOTIFICATION_MARKETING_LIST">
    <ul class="my_setting_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_NOTIFICATION_MARKETING_LIST" data-cursor-name="next" data-cursor="" data-has-next="">
    	
    	<c:choose>
			<c:when test="${count eq 0}">
			<div class="no_contents_center">
				<img class="no_contents" src="${pageContext.request.contextPath}/image/mypage/content_null.png">
			</div>
			</c:when>
		<c:otherwise>
    	<c:forEach var="likeChList" items="${likeChList}">
    	<li class="my_setting_item">
			<a href="${pageContext.request.contextPath}/channels/${likeChList.chNum}?userid=${likeChList.ownerId}" class="my_channel_thumb" data-clk="my_subs.list">
				<c:choose>
                   <c:when test="${empty likeChList.chProfile}">
                      <img src="${pageContext.request.contextPath}/resources/image/common/itda_logo3.png" width="48" height="48">
                   </c:when>
                	<c:otherwise>
                    	<img src="${pageContext.request.contextPath}/image/MemberUpload/${likeChList.ownerId}${likeChList.chProfile}" width="48" height="48" onerror="this.parentNode.innerHTML='<span class=&quot;no_image&quot;></span>'">
                	</c:otherwise>
                </c:choose>
			</a>
			<div class="my_channel_text">
				<a href="${pageContext.request.contextPath}/channels/${likeChList.chNum}?userid=${likeChList.ownerId}" class="my_channel_link" data-clk="my_subs.list">
					<div class="my_channel_name">
						<strong class="my_channel_name_text">${likeChList.chName}</strong>
					</div>
					<div class="my_subscribe_date">
						<em class="my_channel_date_title">구독일</em>
						<div class="my_channel_date_text"><fmt:formatDate value="${likeChList.subdate}" pattern="yyyy.MM.dd" />.</div>
					</div>
				</a>
			</div>
			<button type="button" class="my_attention_remove2" id="delButton" data-chnum="${likeChList.chNum}"><span class="blind">삭제</span></button>
    	</li>
    	</c:forEach>
    	</c:otherwise>
    	</c:choose>
    </ul>
		
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
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
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
<script>
$(document).ready(function() {
    // "삭제" 버튼 클릭 이벤트 핸들러
    $(".my_attention_remove2").click(function() {
    	
    	var chnum = $(this).data("chnum");
        // 모달 레이어 생성
        var modalHtml = `
            <div class="popup_layer _MODAL">
                <strong class="popup_tit"></strong>
                <p class="popup_sub_desc">해당 구독 채널을 목록에서 삭제하시겠습니까?</p>
                <div class="popup_button_wrap">
                    <button type="button" class="button_layer _MODAL_CANCEL">
                        취소
                    </button>
                    <button type="submit" class="button_layer type_confirm" id="delSub">
                        확인
                    </button>
                </div>
            </div>
        `;

        // 모달 레이어를 _LAYER_DIMMED 아래에 추가
        $("#_LAYER_DIMMED").html(modalHtml);

        // _LAYER_DIMMED를 보이게 함
        $("#_LAYER_DIMMED").show();

        // "취소" 버튼 클릭 이벤트 핸들러
        $(".button_layer._MODAL_CANCEL").click(function() {
            // 모달 레이어를 숨김
            $("#_LAYER_DIMMED").hide();
        });
        
        $("#delSub").click(function(event) {
            event.preventDefault();
            
            $("#fm input[name='chNum']").val(chnum);
            console.log(chnum);
            // 여기에서 필요한 작업을 수행

            // 마지막으로 양식을 제출
            $("#fm").attr('action', '/itda/my/notification/likeChDeletePro');
            $("#fm").attr('method', 'post');
            $("#fm").submit();
        });
        
    });
});
</script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>

<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>
