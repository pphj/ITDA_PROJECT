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
		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-zf5k2";
		var nelo = {
			sampleNumber : 100,
			maxCount : 100,
			maxSendMessage : "로그 전송 최대치 도달"
		};


		var domain = "https://contents.premium.naver.com";
		var ajaxDomain = "";
		var MEDIA_GW_DOMAIN = "https://media-gw.naver.com";
		var PREMIUM_GW_DOMAIN = "https://premium-gw.naver.com";
		var PREMIUM_LOG_DOMAIN = "https://l.premium.naver.com";
		var urlPrefix = "";
		var newsDomain = "";
		var layoutName = "my_payment_subscriptions";

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
<h2 class="my_title">결제 내역</h2>
<div class="my_tab_wrap">
	<ul class="my_tab">
	
		<li class="my_tab_item is_active">
			<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/payment/subscriptions" data-clk="my_lnb.setmrk">
				<span class="my_tab_text">
					결제 내역 <span class=my_tab_sub_text>목록</span>
					<em>${count}</em>
				</span>
			</a>
		</li>
	</ul>
</div>
<div class="my_payment">
	<h2 class="my_section_title">구독 결제 내역 <em>${count}</em></h2>
	<ul class="my_subscribe_payment_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_PAYMENT_SUBSCRIPTION_LIST" data-cursor-name="page" data-cursor="1" data-has-next="">
	    	<c:choose>
			<c:when test="${count eq 0}">
			<div class="no_contents_center">
				<img class="no_contents" src="${pageContext.request.contextPath}/image/mypage/content_null.png">
			</div>
			</c:when>
		<c:otherwise>

	<c:forEach var="orderList" items="${orderList}">
		<li class="my_subscribe_payment_item">
			<a href="${pageContext.request.contextPath}/my/payment/subscriptions/${orderList.payedNum}" class="my_subscribe_payment_link" data-clk="my_order.subslist">
				<div class="my_subscribe_payment_text">
					<div class="my_subscribe_payment_info">
						<strong class="my_subscribe_payment_channel">${orderList.productName}</strong>
						<div class="my_subscribe_payment_name">${orderList.productDetail}</div>
						<em class="my_subscribe_payment_price"><span class="num">${orderList.payedPrice}</span>원</em>
					</div>
					<div class="my_subscribe_payment">
						<strong class="my_subscribe_payment_status false">
							<c:if test="${orderList.payedStatus == 'Y'}">
								<c:out value="결제완료"/>
							</c:if>
							<c:if test="${orderList.payedStatus == 'F'}">
								<c:out value="결제실패"/>
							</c:if>
							<c:if test="${orderList.payedStatus == 'N'}">
								<c:out value="결제중단"/>
							</c:if>
							<c:if test="${orderList.payedStatus == 'R'}">
								<c:out value="결제취소"/>
							</c:if>
						</strong>
						<div class="my_subscribe_payment_date"><fmt:formatDate value="${orderList.payedOkDate}" pattern="yyyy.MM.dd" /></div>
						<div class="my_subscribe_payment_episode"><span class="num"></span>상세보기</div>
					</div>
				</div>
			</a>
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
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>


</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
