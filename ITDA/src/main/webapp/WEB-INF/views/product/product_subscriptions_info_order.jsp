<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta name="format-detection" content="telephone=no">
	<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
	<title>결제하기 : 잇다</title>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<base target="_parent">

	<script src="${pageContext.request.contextPath}/resources/js/payment/payment.js"></script>

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
			결제 하기
		</span>
	</h2>
	</div>
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
<form id="fm" method="Post">
	<input type="hidden" name="tid" value="">
	<input type="hidden" name="productName" value="${productInfo.productName}">
	<input type="hidden" name="productPrice" value="${productInfo.productPrice}">
	<input type="hidden" name="totalProductPrice" value="">
	<input type="hidden" name="totalPayPrice" value="">
	<input type="hidden" name="discountPrice" value="">
	

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
	</div>
<div class="product_pay">
	<strong class="product_pay_info_title">구매 정보 확인</strong>
	<dl class="product_pay_info_list">
		<div class="product_pay_info_item">
			<dt>결제방식</dt>
			<dd>단건 결제</dd>
		</div>
		<div class="product_pay_info_item">
			<dt>상품가</dt>
			<dd><em class="product_pay_price">${productInfo.productPrice}원</em></dd>
		</div>
		<div class="product_pay_info_item">
			<dt>이번 결제금액</dt>
			<dd>
				<em class="product_real_pay_price"><span class="_SUBSCRIPTION_DISCOUNT_PRICE">${productInfo.productPrice}</span>원</em>
			</dd>
		</div>
		<div class="product_pay_info_item">
			<dt>쿠폰 사용금액</dt>
			<dd>
				<em class="product_real_pay_price"><span class="_SUBSCRIPTION_DISCOUNT_PRICE">{}</span>원</em>
			</dd>
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
		</ul>
	</div>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 </form>
<div class="floating_button_wrap">
<%-- <form method="post" action="${pageContext.request.contextPath}/pay/kakaoPay.do">
<button type="button" class="floating_button _ORDER" id="kakaoPay" onclick="openKaKaoPayment()">결제하기</button>

</form>
 --%>
 		<button type="submit" class="floating_button _ORDER" id="btn-kakaopay" style="color: white;">결제하기</button>
</div>

<%-- <div id="_CONTENT_LAYER_REFUNDGUIDE" class="content_layer_wrap" style="display: none;">
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
											<strong>${productInfo.productPrice}</strong><span class="card_price_text">원/월</span>
										</div>
									</div>
								</div>
							</div>
							<div class="product_detail_info">
								<strong class="product_title">${productInfo.productName}</strong>
								<div class="product_price"><em>${productInfo.productPrice}</em><span class="price_unit">원</span> (월간)</div>
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
								<li>잇다가 발행한 쿠폰을 사용하여 구매한 뒤 청약철회등 된 경우, 해당 쿠폰은 재발급되어 다시 사용이 가능합니다. 단, 부분 환불된 경우 또는 유효기간이 지난 쿠폰의 경우는 재발급 불가합니다.</li>
								<li>구매 조건, 추가 조건에서 정하지 않은 사항 또는 정함이 있더라도 법령에 반하는 사항은 전자상거래등에서의소비자보호에관한법률 등 관련 법령에서 정한 바에 따릅니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --%>

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
  // 전체 동의 체크박스를 클릭할 때
  $("#agreement_all").click(function() {
    // 전체 동의 체크박스의 상태를 가져옵니다.
    var isChecked = $(this).prop("checked");
    
    // 모든 체크박스에 동일한 상태를 적용합니다.
    $("._AGREEMENT").prop("checked", isChecked);
  });
  
  // 다른 체크박스를 클릭할 때
  $("._AGREEMENT").click(function() {
    // 다른 체크박스 중 하나라도 선택 해제되면 전체 동의 체크박스도 선택 해제합니다.
    if ($("._AGREEMENT:checked").length < $("._AGREEMENT").length) {
      $("#agreement_all").prop("checked", false);
    }
  });
  $("#fm").submit(function(event) {
	    if ($("._AGREEMENT:checked").length < 1) {
	      // 필수 항목이 선택되지 않았을 때 경고창을 표시하고 제출을 막습니다.
	      alert("필수 항목을 체크해 주세요.");
	      event.preventDefault(); // 제출을 막습니다.
	    }
	  });
});
</script>
</body>

</html>
