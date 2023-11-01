<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>이용권 선택 : 잇다</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<base target="_parent"> 

</head>

<body class="as_white_background body_mp">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>

<hr>
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
			이용권 선택
		</span>
	</h2>
	</div>
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
<sec:authentication property="principal" var="pinfo" />
<div class="_PAY_ORDER_CONTENT product_wrap">
	<form id="fm" name="fm" method="get" action="${pageContext.request.contextPath}/product/subscriptions/info">
		<div class="product_ticket_wrap">
			<ul class="product_ticket_list">
			<c:forEach var="subProductList" items="${subProductList}">
				<li class="product_ticket_item _TICKET_LIST">
					<div class="product_ticket_inside">
					<!-- class="product_ticket_check_input _TICKET_INPUT" -->
						<input type="radio" id="product_${subProductList.productId}" name="productId"  value="${subProductList.productId}">
 						<label for="product_${subProductList.productId}"  class="product_ticket_check_label"><span class="blind">상품선택</span></label>
 						<div class="product_ticket_content">
							<div class="product_ticket_text">
								<div class="product_ticket_type">
									<span class="product_ticket_type_text">단기</span>
									<span class="product_ticket_type_text">월간이용권</span>
								</div>
								<strong class="product_ticket_name">${subProductList.productName}</strong>
								<div class="product_ticket_price_wrap">
									<div class="product_ticket_price">
										<strong>${subProductList.productPrice}</strong>
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
			</ul>
		</div>
		</form>
	<button type="submit" id="productSubmit" class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP">
	<div class="floating_button _PURCHASE_PRODUCT_BUTTON">
		선택하기
	</div>
 	</button>
</div>
</div>
</div>
</div>
</div>


<div id="_LAYER_DIMMED" class="layer_dimmed" style="display:none;"></div>
<div id="_MODAL_WRAP"></div>
<div id="_TOAST_WRAP"></div>

<script>

$(document).ready(function() {
    $('input[type="radio"]').on('click', function() {
        // 선택한 라디오 버튼의 값을 가져옵니다.
        var selectedValue = $(this).val();

        // 여기에서 선택된 값으로 할 일을 정의할 수 있습니다.
        // 예를 들어, 선택한 값을 콘솔에 출력하거나 다른 동작을 수행할 수 있습니다.
        console.log("선택한 값: " + selectedValue);
    });
    
    $("#productSubmit").on('click', function(e){
    	e.preventDefault();
    	$("#fm").submit();
    })
    
    $(".button_back._BACK").on("click", function(e) {
        e.preventDefault(); // 기본 동작(링크 이동)을 중지합니다.
        window.history.back();
    });
});

 </script>

</body>

</html>
