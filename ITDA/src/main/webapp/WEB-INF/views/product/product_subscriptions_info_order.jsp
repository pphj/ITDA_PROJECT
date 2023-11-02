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
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <title>결제하기 : 잇다</title>
    <jsp:include page="../include/header.jsp"></jsp:include>
    <base target="_parent">
    <script src="${pageContext.request.contextPath}/resources/js/payment/payment.js"></script>
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
                <a href="#" class="button_back _BACK">
                    <img class="link_premium" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
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
                            <a href="#" class="button_back _BACK">
                                <img class="link_errow" style="width: 30px;" src="${pageContext.request.contextPath}/resources/image/content/errow_left.png">
                                <span class="blind">이전으로</span>
                            </a> 
                        </div>
                        <h2 class="flat_header_title">
                            <span class="flat_header_title_inner">
                                결제 하기
                            </span>
                        </h2>
                    </div>
                </div>
                <form id="fm" method="get">
                    <input type="hidden" name="userName" value="">
                    <input type="hidden" name="productName" value="${productInfo.productName}">
                    <input type="hidden" name="productPrice" value="${productInfo.productPrice}">
                    <input type="hidden" name="productId" value="${productInfo.productId}">
                    <input type="hidden" name="totalProductPrice" value="">
                    <input type="hidden" name="totalPayPrice" value="">
                    <input type="hidden" name="discountPrice" value="">
                    <input type="hidden" name="couponCode" value="">
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
                                <dt>쿠폰 적용 금액</dt>
                                <dd>
                                    <em class="product_coupon_price">
                                        <span class="_SUBSCRIPTION_COUPON_PRICE"></span>원
                                    </em>
                                </dd>
                            </div>						
                            <div class="product_pay_info_item">
                                <dt>이번 결제금액</dt>
                                <dd>
                                    <em class="product_real_pay_price">
                                        <span class="_SUBSCRIPTION_DISCOUNT_PRICE">${productInfo.productPrice}</span>원
                                    </em>
                                </dd>
                            </div>

                          </dl>
                    </div>

					<ul class="my_coupon_list _CONTENT_LIST" data-template="SCS_PREMIUM_MY_COUPON_LIST" data-stype="" data-cursor-name="page" data-cursor="1" data-has-next="">
						<li class="product_ticket_item _TICKET_LIST">
						<div class="product_ticket_inside">
						<input type="radio" id="cpNum" name="cpNum"  value="0" data-couponCode="0">
 						<label for="cpNum"  class="product_ticket_check_label"><span class="blind">쿠폰선택</span></label><div class="myc_caution_item">쿠폰 적용 안함</div>
 						</div>
 						</li>
 						
					<c:forEach var="couponList" items="${couponList}">
					<li class="product_ticket_item _TICKET_LIST">
					<div class="product_ticket_inside">
						<input type="radio" id="cpNum_${couponList.cpNum}" name="cpNum"  value="${couponList.couponPrice}" data-couponCode="${couponList.couponCode}">
 						<label for="cpNum_${couponList.cpNum}"  class="product_ticket_check_label"><span class="blind">쿠폰선택</span></label>
						<div class="myc_caution_item">이용기간 :<br> <fmt:formatDate value="${couponList.startDate}" pattern="yyyy.MM.dd. HH:MM" /> ~ <fmt:formatDate value="${couponList.couponUseExdate}" pattern="yyyy.MM.dd. HH:MM" /></div>
						<div class="my_coupon_card">
							<div class="myc_content">
								<div class="myc_top">
									<div class="myc_name">
										<em class="myc_name_text">${couponList.couponName}</em>
									</div>
									<em class="myc_badge" data-useExdate="${couponList.couponUseExdate}"></em>
								</div>
								<strong class="myc_title">
									<span class="myc_title_discount"  data-couponPrice="${couponList.couponPrice}">
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
					</div>
					</li>
					</c:forEach>
				</ul>
                            
                       
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
                                        <span class = "pay_terms_check_text">청약철회등 환불 안내 확인 및 동의 (필수)</span>
                                    </label>
                                    <a href="#" class="pay_terms_check_link _TOGGLE" data-target="_CONTENT_LAYER_REFUNDGUIDE" data-prevent-scroll="true" data-clk="prod_chek.revokeinfo">
                                        <span class="blind">더보기</span>
                                    </a>
                                </li>
                                <li class="pay_terms_item _AGREEMENT_WRAP">
                                    <input type="checkbox" id="agreement_inform" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
                                    <label for="agreement_inform" class="pay_terms_check_label">
                                        <i class="pay_terms_check_icon"></i>
                                        <span class="pay_terms_check_text">판매자에 개인 정보 제공 동의 (필수)</span>
                                    </label>
                                    <a href="#" class="pay_terms_check_link _TOGGLE" data-target="_CONTENT_LAYER_AGREEMENT" data-prevent-scroll="true" data-clk="prod_chek.privacyinfo">
                                        <span class="blind">더보기</span>
                                    </a>
                                </li>
                                <li class="pay_terms_item _AGREEMENT_WRAP">
                                    <input type="checkbox" id="agreement_notice" name="checkbox" class="pay_terms_check_input _AGREEMENT" data-check-clk="prod_chek.agree" data-uncheck-clk="prod_chek.agreecancel">
                                    <label for="agreement_notice" class="pay_terms_check_label">
                                        <i class="pay_terms_check_icon"></i>
                                        <span class= "pay_terms_check_text">하단 유의사항의 확인 및 동의 (필수)</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="product_pay_notice">
                            <h3 class="product_pay_subtitle">유의사항</h3>
                            <ul class="product_pay_notice_list">
                                <li class="product_pay_notice_item">미성년자가 법정대리인의 동의 없이 상품 거래 계약을 체결하는 경우, 미성년자 본인 또는 법정대리인은 그 계약을 취소할 수 있습니다.</li>
                                <li class="product_pay_notice_item">초대를 통한 구독의 변경 및 해지는 초대자의 권한에 따르며 이용권자는 초대자가 설정한 범위 내에서만 구독 이용이 가능합니다. 단, 초대를 통해 구독 중인 이용자는 스스로 초대 수락을 철회하고 구독 이용을 해지할 수 있습니다.</li>
                                <li class="product_pay_notice_item">청약철회등 환불 관련 정책은 상품 상세설명 페이지 내 "청약철회등 환불 안내"를 참조해 주시기 바랍니다.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="floating_button_wrap">
                    <button type="submit" class="floating_button _ORDER" id="btn-kakaopay" style="color: white;">결제하기</button>
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
    <script src="${pageContext.request.contextPath}/resources/js/payment/order.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/payment/payment.js"></script>
    <script>

        
    </script>
</body>
</html>
