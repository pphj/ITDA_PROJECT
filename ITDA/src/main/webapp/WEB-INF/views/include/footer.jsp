<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<body>
<footer role="contentinfo" class="footer _STICKY_FOOTER">
	<a href="#" class="page_top show _MOVE_TOP" style=""></a>
	<div class="footer_naver_info_wrap">
		<button id="_ITDA_INFO" type="button" class="footer_naver_info_button is_active _TOGGLE _IFRAME_RESIZE" data-target="_NAVER_INFO" data-classvalue="is_active" data-show-clk="fot.ninfoopen" data-hide-clk="fot.ninfoclose" data-cookie-name="P_NF">잇다(주) 사업자 정보</button>
		<dl class="footer_naver_info_list">
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">사업자등록번호</dt>
				<dd class="footer_naver_info_text">123-45-67890</dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">통신판매업번호</dt>
				<dd class="footer_naver_info_text">제1234-서울종로-0000호</dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">대표이사</dt>
				<dd class="footer_naver_info_text">많다많다</dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">주소</dt>
				<dd class="footer_naver_info_text">서울 종로구 청와대로 1
				</dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">전화번호</dt>
				<dd class="footer_naver_info_text"><a href="javascript:;" class="_LINK" data-url="tel:1588-3820" data-clk="fot.ninfotel">1588-1588</a></dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">이메일</dt>
				<dd class="footer_naver_info_text"><a href="javascript:;" class="_LINK" data-url="mailto:ccnaver@naver.com" data-clk="fot.ninfomail">itda@itda.com</a></dd>
			</div>
			<div class="footer_naver_info_item">
				<dt class="footer_naver_info_title">호스팅서비스제공</dt>
				<dd class="footer_naver_info_text">NAVER Cloud</dd>
			</div>
		</dl>
	</div>
	<div class="footer_sub_wrap">
		<p class="footer_naver_info_desc">잇다(주)는 통신판매중개시스템의 제공자로서 통신판매의 당사자가 아닙니다. 콘텐츠 판매, 환불 등과 관련한 의무와 책임은 판매자에게 있습니다.</p>
		<div class="footer_sub_link_wrap">
			<div class="footer_sub_item"><a href="https://policy.naver.com/rules/service.html" class="footer_sub_link" data-clk="fot.agreement">잇다 이용약관</a></div>
			<div class="footer_sub_item"><a href="/ch/agreement/service" class="footer_sub_link" data-clk="fot.pcagreement">잇다콘텐츠 판매회원 이용약관</a></div>
			<div class="footer_sub_item"><a href="https://policy.naver.com/policy/service_group.html" class="footer_sub_link" data-clk="fot.policy">잇다 운영정책</a></div>
			<div class="footer_sub_item"><a href="/ch/agreement/service?type=policy" class="footer_sub_link" data-clk="fot.pcpolicy">잇다콘텐츠 운영정책</a></div>
			<div class="footer_sub_item"><a href="https://policy.naver.com/policy/privacy.html" class="footer_sub_link" data-clk="fot.privacy"><strong>개인정보처리방침</strong></a></div>
			<div class="footer_sub_item"><a href="https://policy.naver.com/rules/disclaimer.html" class="footer_sub_link" data-clk="fot.legal">법적고지</a></div>
			<div class="footer_sub_item"><a href="${pageContext.request.contextPath}/info/faq" class="footer_sub_link" data-clk="fot.pccs">고객센터</a></div>
			<div class="footer_sub_item"><a href="${pageContext.request.contextPath}/info/notice" class="footer_sub_link">공지사항</a></div>
		</div>
	</div>
</footer>
 <script>
$(document).ready(function() {
	// 초기 로딩시 숨김
    $(".footer_naver_info_list").hide();
    
    // 버튼 클릭 이벤트 핸들러
    $("#_ITDA_INFO").click(function() {
        $(".footer_naver_info_list").slideToggle(); // 내용을 슬라이드 토글
    });
});

</script> 
</body>
</html>