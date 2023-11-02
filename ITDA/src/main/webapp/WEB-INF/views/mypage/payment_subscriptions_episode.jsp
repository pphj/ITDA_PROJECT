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

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-9fftb";
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
		var layoutName = "my_payment_subscription";

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
<div class="my_detail_head">
	<div class="my_detail_head_name">결제 상세 보기</div>
	
	
</div>
<div class="my_detail_card">
	<div class="membership_card">
		<div class="mc_content">
			<div class="mc_text">
				<span class="mct_sub">
					<span class="mct_sub_text">개인</span>
					<span class="mct_sub_text">이용권</span>
				</span>
				<strong class="mct_name">${orderInfo.productName}</strong>
			</div>
			<div class="mc_price_info">
				<span class="mcp_price"><em class="mcp_number">${orderInfo.productPrice}</em><span class="mcp_text">원/월</span></span>
			</div>
		</div>
	</div>
</div>
<div class="my_detail_talk">
</div>
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">구매 상품 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>상품명</dt>
			<dd><div class="my_detail_info_name">${orderInfo.productName}</div></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>이용기간</dt>
			<dd><span class="num">${orderInfo.productTerm} 일</span></dd>
		</div>
	</dl>
</div>
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">판매자 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>대표자</dt>
			<dd>잇다(주)</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>주소</dt>
			<dd>(우:<span class="num">12345</span>)<br>
				서울특별시 종로구 종로0길 </dd>
		</div>
		<div class="my_detail_info_item">
			<dt>이메일</dt>
			<dd><span class="num">itda@otda.com</span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>전화번호</dt>
			<dd><span class="num">1588-1588</span></dd>
		</div>
	</dl>
</div>
<form id="fm" action='${pageContext.request.contextPath}/product/subscriptions/info/refund'>
<input type="hidden" name="payedNum" value="${orderInfo.payedNum}">
<input type="hidden" name="payedPrice" value="${orderInfo.payedPrice}">
<input type="hidden" name="discountPrice" value="${orderInfo.discountPrice}">
<input type="hidden" name="productTerm" value="${orderInfo.productTerm}">
<input type="hidden" name="couponCode" value="${orderInfo.couponCode}">
<div class="my_detail_content">
	<div class="my_detail_titlewrap">
		<h2 class="my_detail_title">구매 정보</h2>
	</div>
	<dl class="my_detail_info">
		<div class="my_detail_info_item">
			<dt>구매상태</dt>
				<c:if test="${orderInfo.payedStatus == 'Y'}">
					<dd><em><c:out value="결제완료"/></em></dd>
				</c:if>
				<c:if test="${orderInfo.payedStatus == 'R'}">
					<dd><em><c:out value="결제취소"/></em></dd>
				</c:if>
				<c:if test="${orderInfo.payedStatus == 'F'}">
					<dd><em><c:out value="결제실패"/></em></dd>
				</c:if>
				<c:if test="${orderList.payedStatus == 'N'}">
					<dd><em><c:out value="결제중단"/></em></dd>
				</c:if>				
			
		</div>
		<div class="my_detail_info_item">
			<dt>구매번호</dt>
			<dd><span class="num">${orderInfo.payedNum}</span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제일</dt>
			<dd><span class="num"><fmt:formatDate value="${orderInfo.payedOkDate}" pattern="yyyy.MM.dd HH:mm" /></span></dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제수단</dt>
			<dd>${orderInfo.payedMethod}</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>상품금액</dt>
			<dd>
				<span class="num">${orderInfo.productPrice}</span>원
			</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>할인금액</dt>
			<dd>
 				<span class="num">${orderInfo.discountPrice}</span>원
<!--				<span class="my_detail_info_item_sub">(쿠폰: 무료 쿠폰)</span>
 -->		</dd>
		</div>
		<div class="my_detail_info_item">
			<dt>결제금액</dt>
			<dd><em><span class="num">${orderInfo.payedPrice}</span>원</em></dd>
		</div>
	</dl>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

</form>
<div class="my_detail_button_wrap">
   <c:choose>
       <c:when test="${orderInfo.payedStatus == 'Y'}">
	<button class="my_detail_button _CANCLE" data-clk="my_order.cancle">환불</button>
       </c:when>
     <c:when test="${orderInfo.payedStatus eq 'Y'}">
        </c:when>
      </c:choose>

	<a href="#" class="my_detail_button _BACK" data-clk="my_order.back">이전</a>
</div>
<div class="my_detail_guide">
	<strong class="my_detail_guide_title">구매 취소 안내</strong>
	<ul class="my_detail_guide_list">
		<li class="my_detail_guide_item">결제일 기준 7일 이내 콘텐츠 이용 이력이 없는 경우 청약철회등이 가능하며 전액 환불됩니다.</li>
		<li class="my_detail_guide_item"><strong>구독 상품은 구독 해지 후 환불 신청이 가능합니다.</strong><br>구독 해지는 'MY > 구독 채널  탭 > 해당 구독 채널 상세페이지'에서 확인 가능합니다. <a href="/my/subscriptions" class="my_detail_guide_item_link" data-clk="my_order.">[구독채널 보기]</a></li>
		<li class="my_detail_guide_item">상품의 콘텐츠 이용이 개시된 경우 또는 구매 후 이용가능한 날로부터 7일이 경과된 경우 청약철회가 제한될 수 있습니다.</li>
		<li class="my_detail_guide_item">단건 상품 중 라이브 유형의 상품은 상품 특성상 라이브 제공 개시 전까지만 청약철회등 가능하며, 일단 라이브가 시작되면 이용하지 않았더라도 청약철회등이 불가능할 수 있습니다.</li>
		<li class="my_detail_guide_item">청약철회등 및 결제 취소/환불 관련 자세한 사항은 이용 중이신 프리미엄콘텐츠 채널 하단 푸터에 노출된 판매자의 연락처로 문의해 주시기 바랍니다.</li>
	</ul>
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
<script>
//환불 링크를 클릭할 때 실행할 함수
$('.my_detail_button._CANCLE').click(function() {
  // 페이지 이동을 수행하는 코드
  $("#fm").submit();
});
$(".my_detail_button._BACK").on("click", function(e) {
    e.preventDefault(); // 기본 동작(링크 이동)을 중지합니다.
    window.history.back();
});

</script>
</body>

<jsp:include page="../include/footer.jsp"></jsp:include>
</html>
