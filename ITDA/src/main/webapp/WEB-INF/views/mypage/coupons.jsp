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

		var svr = "one-service-premium-r-20230914-230914-164329-5bff964899-zf5k2";
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
		var layoutName = "my_coupons";

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
	var isLogin = true;

	var service = {
		premium: true
	};


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
<h2 class="my_title">쿠폰</h2>
<div class="my_tab_wrap">
	<ul class="my_tab">
		<li class="my_tab_item is_active">
			<a href="#" data-url="${pageContext.request.contextPath}/my/coupons" class="my_tab_link _LOCATION_REPLACE" data-clk="my_coupon.valid"><span class="my_tab_text">보유한 쿠폰<em>${count}</em></span></a>
		</li>
	</ul>
</div>
<div class="my_coupon">
	<a href="#" class="my_coupon_register _TOGGLE" data-target="_CONTENT_LAYER_COUPON_REDEEM" data-prevent-scroll="true">쿠폰 등록</a>
	<h3 class="my_coupon_title">
		보유한 쿠폰
		<em>${count}</em>
	</h3>
		<ul class="my_coupon_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_COUPON_LIST" data-stype="" data-cursor-name="page" data-cursor="1" data-has-next="">
	<c:choose>
			<c:when test="${count eq 0}">
				<img class="no_contents" src="${pageContext.request.contextPath}/image/mypage/content_null.png">
			</c:when>
		<c:otherwise>
		<c:forEach var="couponList" items="${couponList}">
		
		<li class="my_coupon_item">
			<div class="my_coupon_card">
				<div class="myc_content">
					<div class="myc_top">
						<div class="myc_name">
							<em class="myc_name_text">${couponList.couponName}</em>
						</div>
						<em class="myc_badge" data-useExdate="${couponList.couponUseExdate}"></em>
					</div>
					<strong class="myc_title">
						<span class="myc_title_discount">
							<span class="myc_title_num">${couponList.couponPrice}</span>
							<span class="myc_title_unit as_percent">원</span>
						</span>
						<span class="myc_title_text">할인</span>
					</strong>
					<div class="myc_sub">
						<div class="myc_type">
								${couponList.couponDetail}
														</div>
						<div class="myc_info">
							<span class="myc_info_title"></span>
							<div class="myc_info_content">
								<span class="myc_info_text"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="myc_caution">
					<button id="_COUPON_DESCRIPTION_${couponList.cpNum }" class="myc_caution_button _TOGGLE" type="button" data-target="_COUPON_DESCRIPTION_${couponList.cpNum }" data-classValue="is_open" data-show-clk="my_coupon.expopen" data-hide-clk="my_coupon.expclose">쿠폰설명 (유의사항)</button>
					<ul class="myc_caution_list">
						<li class="myc_caution_item">기간 : <fmt:formatDate value="${couponList.startDate}" pattern="yyyy.MM.dd. HH:MM" /> ~ <fmt:formatDate value="${couponList.couponUseExdate}" pattern="yyyy.MM.dd. HH:MM" /></li>
						<li class="myc_caution_item">상품 : ${couponList.couponName}
						</li>
						<li class="myc_caution_item">설명 : ${couponList.couponDetail}</li>
					</ul>
			</div>
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
	<dl class="my_setting_none">
		<dt>이용 안내</dt>
		<dd>발급된 쿠폰은 유효기간 내에서만 사용하실 수 있습니다.</dd>
		<dd>유효기간이 경과한 미사용 쿠폰은 재발급이 불가합니다.</dd>
		<dd>최근 1년 이내 사용완료된 쿠폰, 유효기간이 경과된 쿠폰, 사용 불가 조건의 쿠폰은 [종료된 쿠폰]에서 확인하실 수 있습니다.</dd>
		<dd>쿠폰 적용 시 실결제금액이 100원 이상인 상품에만 쿠폰 적용이 가능합니다.</dd>
		<dd>쿠폰은 중복 사용이 불가하며 한 건의 거래에 한 개의 쿠폰만 사용하실 수 있습니다.</dd>
		<dd>쿠폰에 표기된 금액보다 적은 금액을 결제하시더라도 차액은 반환되지 않습니다. (ex. 1만원 쿠폰 할인을 적용하여 5천원 상품을 구매하더라도 차액은 모두 소진됨)</dd>
		<dd>구독 상품을 구독중이고 해당 구독 상품에 사용 가능한 쿠폰이 있을 경우, 쿠폰은 다음 정기 결제에 자동 사용됩니다. 사용 가능한 쿠폰이 여러 개인 경우, 할인 금액이 높은 순 &gt; 유효기간 종료일이 빠른순으로 우선 사용됩니다.</dd>
		<dd>2개 이상의 구독 상품을 구독중이고, 구독중인 상품들에 모두 사용 가능한 쿠폰이 있을 경우, 쿠폰은 구독중인 상품 중 다음 정기 결제일이 빠른 상품에 우선 사용됩니다.</dd>
		<dd>다음 정기 결제에 사용할 쿠폰을 직접 선택하고 싶은 경우,<br>‘MY &gt; 구독채널 &gt; 채널관리‘에서 선택할 수 있으며, 별도로 설정하지 않은 경우는 위에 명시된 정기 결제 쿠폰 사용 우선순위에 따라 자동 사용됩니다.</dd>
		<dd>네이버가 발행한 쿠폰을 사용하여 구매한 뒤 청약철회등 된 경우, 해당 쿠폰은 재발급되어 다시 사용이 가능합니다. 단, 부분 환불된 경우 또는 유효기간이 지난 쿠폰의 경우는 재발급 불가합니다.</dd>
		<dd>그 외에 판매자가 발행한 포인트/쿠폰의 경우 판매자가 정한 바에 따라 취급됩니다.</dd>
	</dl>
	
	
</div>

<form id="fm" method="post">

<div id="_CONTENT_LAYER_COUPON_REDEEM" class="content_layer_wrap as_coupon" style="display: none;">
	<div class="content_layer">
		<div class="content_layer_inside">
			<div class="content_layer_header">
				<h2 class="content_layer_title">
					쿠폰 번호를 입력해주세요
				</h2>
				<button type="button" class="content_layer_close _TOGGLE _COUPON_REDEEM_RESET_BTN" data-target="_CONTENT_LAYER_COUPON_REDEEM" data-prevent-scroll="true">
					<span class="blind">닫기</span>
				</button>
			</div>
			<div class="content_layer_container">
				<div class="content_layer_inner">
					<div class="my_coupon">
						<div class="coupon_enroll_wrap">
							<input type="text" id="cpCodeIn" name="couponCode"  class="coupon_enroll_input _COUPON_REDEEM_CODE_INPUT" placeholder="쿠폰 번호를 입력해주세요" maxlength="20" autocomplete="off">
						</div>
						<dl class="my_setting_none">
							<dt class="blind">제한 사항</dt>
							<dd>유효 기간이 지난 쿠폰은 등록이 불가합니다.</dd>
							<!-- <dd>쿠폰 등록이 5회 초과 실패한 경우, 고객센터로 문의해주세요.</dd> -->
						</dl>
					</div>
					<div class="floating_button_wrap">
						<button id="couponSubmit" class="floating_button" disabled>확인</button>
					</div>
				</div>
			</div>
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
<script>
$(document).ready(function() {
    // 팝업을 열기 위한 클릭 이벤트 핸들러
    $(".open-popup-button").click(function() {
        $("#_CONTENT_LAYER_COUPON_REDEEM").show(); // 팝업을 표시합니다.
    });

    // 팝업을 닫기 위한 클릭 이벤트 핸들러
    $(".content_layer_close _TOGGLE _COUPON_REDEEM_RESET_BTN").click(function() {
        $("#_CONTENT_LAYER_COUPON_REDEEM").hide(); // 팝업을 숨깁니다.
    });
    
 // input 엘리먼트의 값이 20일 때 버튼을 활성화
    $("#cpCodeIn").on("input", function() {
        var inputLength = $(this).val().length;
        if (inputLength === 20) {
            $("#couponSubmit").prop("disabled", false);
        } else {
            $("#couponSubmit").prop("disabled", true);
        }
    });

    $("#couponSubmit").click(function(event) {
        event.preventDefault();

        let contextpath = "${pageContext.request.contextPath}";
        var header = '${_csrf.headerName}';
        var token = '${_csrf.token}';
        var couponCode = $("input[name='couponCode']").val(); // 쿠폰 코드 입력 필드에서 값을 가져옵니다.

        // 입력된 값 중에 문자열이 하나라도 포함되어 있는지 확인
        if (couponCode.match(/[a-zA-Z]/)) {
            alert("쿠폰 번호가 일치하지 않습니다.");
            return; // alert를 표시하고 함수를 종료
        }

        $.ajax({
            type: "POST",
            url: contextpath + "/my/coupons/cpCodeCheck",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: { "couponCode": couponCode },
            dataType: "json",
            success: function(result) {
                console.log(result);

                if (result === 1) {
                    alert("쿠폰이 등록되었습니다.");
                    // 원하는 작업 수행

                 // 폼의 action 속성 설정 후 제출
                    $("#fm").attr("action", contextpath + "/my/coupons/couponAddPro");
                    $("#fm").attr("method", "POST"); // POST 메서드 설정
                    $("#fm").submit();

                }else if (result == 3){
                	alert("이미 등록하거나, 사용된 쿠폰입니다.");
                    $("input[name='couponCode']").val("");
            	}else {
                    alert("쿠폰 번호가 일치하지 않습니다.");
                    $("input[name='couponCode']").val("");
                }
            },
            error: function(error) {
                console.log("error: " + error);
            }
        });
    });

    // data-useExdate 속성에서 날짜 정보 가져오기
    $(".myc_badge").each(function(index, item){
    	console.log(index);
        var currentDate = new Date();
        
    	var useExdate = $(this).data("useexdate");
    
        // 날짜 차이 계산
        var timeDiff = Math.abs(new Date(useExdate) - currentDate);
        var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

        // 디데이 형식으로 출력
        var dDayText = "D-" + daysDiff;

        // 결과를 <em> 엘리먼트에 삽입
        $(this).text(dDayText);
    	
    })

    // 현재 날짜 가져오기

});

</script>

<div id="_TOAST_WRAP"></div>
<script type="x-tmpl-mustache" class="_TOAST_TEMPLATE">
<div class="toast_popup_layer">
	<p class="toast_popup_desc">{{{text}}}</p>
</div>
</script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_library.min.js"></script>
	<script src="https://static-nnews.pstatic.net/js/min/20230914a/premium_read.min.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>
