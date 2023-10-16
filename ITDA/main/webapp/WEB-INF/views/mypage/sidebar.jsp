<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="my_sidebar_box">
		<div class="my_user">
			<a href="${pageContext.request.contextPath}/user/myInfo" class="my_user_modify_link">
				<div class="my_user_img_wrap">
				</div>
				<strong class="my_user_name">
					${userName} 
				</strong>
			</a>
			<div class="my_user_link_wrap">
				<a href="${pageContext.request.contextPath}/my/payment/subscriptions" class="my_user_link is_payment" data-clk="my_lnb.paydet">결제내역</a>
				<a href="${pageContext.request.contextPath}/my/coupons" class="my_user_link is_coupon" data-clk="my_lnb.coupon">쿠폰</a>
				<a href="${pageContext.request.contextPath}/my/notification" class="my_user_link is_setting" data-clk="my_lnb.set">설정</a>
			</div>
		</div>
		<div class="my_tab_wrap">
			<ul class="my_tab">
				<li class="my_tab_item is_active">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/subscriptions" data-clk="my_lnb.substab"><span class="my_tab_text">구독 채널</span></a>
				</li>
				<li class="my_tab_item">
					<a href="#" class="my_tab_link _LOCATION_REPLACE" data-url="${pageContext.request.contextPath}/my/contents" data-clk="my_lnb.constab"><span class="my_tab_text">관심 콘텐츠</span></a>
				</li>
			</ul>
		</div>
	</div>
</body>
