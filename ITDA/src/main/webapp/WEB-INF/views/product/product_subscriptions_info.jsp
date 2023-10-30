<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<title>상품명 이름 : 상세정보</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<base target="_parent">
</head>
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
			상세 정보
		</span>
	</h2>
	</div>
		<form id="fm" action="${pageContext.request.contextPath}/product/subscriptions/info/order">
		<input type="hidden" name="userId" value="${pinfo.username}">
		<input type="hidden" name="productId" value="${productInfo.productId}">
	
		<div class="product_detail_card">
			<div class="membership_card">
				<div class="mc_content">
					<div class="mc_text">
						<span class="mct_sub">
							<span class="mct_sub_text">개인</span>
							<span class="mct_sub_text">월간이용권</span>
						</span>
						<strong class="mct_name">${productInfo.productName}</strong>
					</div>
					<div class="mc_price_info">
						<span class="mcp_price">
							<em class="mcp_number">${productInfo.productPrice}</em>
							<span class="mcp_text">원/월</span>
						</span>
					</div>
				</div>
			</div>
			<dl class="product_detail_benefit_list">
				<dt>혜택</dt>
				<dd>
					<p class="product_detail_benefit">${productInfo.productDetail}</p>
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
					<dd>잇다가 발행한 쿠폰을 사용하여 구매한 뒤 청약철회등 된 경우, 해당 쿠폰은 재발급되어 다시 사용이 가능합니다. 단, 부분 환불된 경우 또는 유효기간이 지난 쿠폰의 경우는 재발급 불가합니다.</dd>
					<dd>구매 조건, 추가 조건에서 정하지 않은 사항 또는 정함이 있더라도 법령에 반하는 사항은 전자상거래등에서의소비자보호에관한법률 등 관련 법령에서 정한 바에 따릅니다.</dd>
				</div>
			</dl>
		</div>
	</div>
	</form>
	<button type="submit" id="productSubmit" class="floating_button_wrap _PURCHASE_PRODUCT_DETAIL_LIST_WRAP" data-ticket-id="sps-tck-1000000295">
	<div class="floating_button _PURCHASE_PRODUCT_BUTTON" data-clk="prod_order.subs">
		<span class="blind">결제권</span>
		구독하기
	</div>
	</button>>
</div>

			</div>
			<div class="container_aside _CONTAINER_ASIDE">
				<div class="container_aside_inner _GRID_TEMPLATE_COLUMN_ASIDE _CONTAINER_ASIDE_INNER"></div>
			</div>
		<div class="_GRID_TEMPLATE_COLUMN_OUTSIDE"></div>
<div id="frontDetect"></div>
<div id="_LAYER_DIMMED" class="layer_dimmed" style="display:none;"></div>
<div id="_MODAL_WRAP"></div>
<script>
$(document).ready(function() {
$("#productSubmit").on('click', function(e){
	e.preventDefault();
	$("#fm").submit();
})

});

</script>
</body>
</html>
