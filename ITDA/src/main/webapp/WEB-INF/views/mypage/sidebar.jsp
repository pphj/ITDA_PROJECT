<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">
.my_tab_text.active{
    font-weight: bold;
    color: black;
}
</style>
<body>

<script>
$(document).ready(function(){
    // 페이지 로드 시, 로컬 스토리지에서 저장된 값으로 글꼴 두께와 색상을 설정합니다.
    var savedFontWeight = localStorage.getItem("font-weight");
    var savedColor = localStorage.getItem("color");

    if (savedFontWeight && savedColor) {
        $(".my_tab_link.my_tab_text").css({
            "font-weight": savedFontWeight,
            "color": savedColor
        });
    }

    $(".my_tab_link.my_tab_text").click(function(){
        // 현재 요소의 글꼴 두께와 색상 값을 가져옵니다.
        var fontWeight = $(this).css("font-weight");
        var color = $(this).css("color");

        // 현재 글꼴 두께가 "bold"이면 다시 "normal"로 변경하고,
        // "bold"가 아니면 "bold"로 변경합니다.
        if (fontWeight === "bold") {
            $(this).css({
                "font-weight": "normal",
                "color": "" // 기본 색상으로 변경
            });
        } else {
            $(this).css({
                "font-weight": "bold",
                "color": "#222" // 색상을 원하는 값으로 변경
            });
        }

        // 변경된 글꼴 두께와 색상을 로컬 스토리지에 저장합니다.
        localStorage.setItem("font-weight", $(this).css("font-weight"));
        localStorage.setItem("color", $(this).css("color"));
    });
});
</script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
<div class="my_sidebar_box">
		<div class="my_user">
			<a href="${pageContext.request.contextPath}/user/myInfo" class="my_user_modify_link">
				<div class="my_user_img_wrap2">
				   <t:choose>
                     <t:when test="${empty  pinfo.userProfile}">
			                <img class="my_user_img_wrap" src="https://static.nid.naver.com/images/web/user/default.png" alt="프로필 이미지">
                        </t:when>
                    <t:when test="${!empty pinfo.userProfile}">
                                <img class="my_user_img_wrap" src="${pageContext.request.contextPath}/image/Member/${userId}${userProfile}">
                        </t:when>
                 </t:choose>
				</div>
				<strong class="my_user_name">
					${pinfo.userName} 
				</strong>
			</a>
			<div class="my_user_link_wrap">
			<t:if test="${!empty payActive }">
				<a href="${pageContext.request.contextPath}/my/payment/subscriptions" class="my_user_link is_payment is_active" data-clk="my_lnb.paydet">결제내역</a>
			</t:if>
			<t:if test="${empty payActive }">
				<a href="${pageContext.request.contextPath}/my/payment/subscriptions" class="my_user_link is_payment" data-clk="my_lnb.paydet">결제내역</a>
			</t:if>
			<t:if test="${!empty cpActive }">
				<a href="${pageContext.request.contextPath}/my/coupons" class="my_user_link is_coupon is_active" data-clk="my_lnb.coupon">쿠폰</a>
			</t:if>
			<t:if test="${empty cpActive }">
				<a href="${pageContext.request.contextPath}/my/coupons" class="my_user_link is_coupon" data-clk="my_lnb.coupon">쿠폰</a>
			</t:if>
			<t:if test="${!empty notiActive }">
				<a href="${pageContext.request.contextPath}/my/notification" class="my_user_link is_setting is_active" data-clk="my_lnb.set">설정</a>
			</t:if>
			<t:if test="${empty notiActive }">
				<a href="${pageContext.request.contextPath}/my/notification" class="my_user_link is_setting" data-clk="my_lnb.set">설정</a>
			</t:if>
			<t:if test="${message ne 'NOT_SELLER' && !empty chActive }">	
				<a href="${pageContext.request.contextPath}/my/channellist" class="my_user_link is_channel is_active" data-clk="my_lnb.set">나의채널</a>
			</t:if>	
			<t:if test="${message ne 'NOT_SELLER' && empty chActive }">	
				<a href="${pageContext.request.contextPath}/my/channellist" class="my_user_link is_channel" data-clk="my_lnb.set">나의채널</a>
			</t:if>	
			</div>
		</div>
		<div class="my_tab_wrap">
			<ul class="my_tab">
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_lnb.substab">
					<t:if test="${!empty subActive }">
						<span class="my_tab_text active">구독 채널</span>
					</t:if>
					<t:if test="${empty subActive }">
						<span class="my_tab_text">구독 채널</span>
					</t:if>
					</a>
				</li>
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/contents" data-clk="my_lnb.constab">
					<t:if test="${!empty contentsActive }">
						<span class="my_tab_text active">관심 콘텐츠</span>
					</t:if>
					<t:if test="${empty contentsActive }">
						<span class="my_tab_text">관심 콘텐츠</span>
					</t:if>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="sidebar_banner _LAZY_LOADING_ERROR_HIDE">
		<a href="${pageContext.request.contextPath}" data-clk="my_lnb.banner">
			<img class="_LAZY_LOADING" src="${pageContext.request.contextPath}/image/mypage/mini_banner.png" width="315" height="110" alt="">
		</a>
	</div>
	</sec:authorize>
</body>
<script>
$(document).ready(function() {
    $(".my_tab_link").click(function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        
        // data-url 속성의 URL 가져오기
        var url = $(this).data('url');
        
        // 페이지 이동
        window.location.href = url;
    });
    
    $(".my_subscriptions_tab_button[data-clk='my_subs.chl']").click(function() {
        var url = $(this).data('url');
        window.location.href = url;
    });

    // "최신 콘텐츠" 버튼 클릭 이벤트 핸들러
    $(".my_subscriptions_tab_button[data-clk='my_subs.cont']").click(function() {
        var url = $(this).data('url');
        window.location.href = url;
    });
});
</script>
