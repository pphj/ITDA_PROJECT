<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<jsp:include page="../include/header.jsp" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="${pageContext.request.contextPath}/js/content/warn.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/content/warn.css" type="text/css" rel="stylesheet">
<title>댓글신고</title>
<style>
.report_cont {
    white-space: nowrap;
    text-overflow: ellipsis;
    height: 200px;
}
body {
    height: 1000px;    /* 높이 설정 */
    overflow: auto;   /* 스크롤바 추가 */
}
</style>
</head>
<body>
	<input type="hidden" name="LoginId" id="LoginId" value="${userinfo.userId}" />
	<input type="hidden" id="chnum" value="${chnum}">
	<input type="hidden" id="writer" value="${boardinfo.writer}">
	
	
	<div class="pop_wrap">
		<div class="pop_header">
			<h1>댓글 신고하기</h1>
		</div>
		<div class="pop_container">
			<div class="pop_content">
				<div class="lst_report">
					<dl class="report_area">
						<dt>
							<span class="inner">작성자</span>
						</dt>
						<dd class="report_nick">${reply.replyWriter}</dd>
						<dt>
							<span class="inner">내 용</span>
						</dt>
						<dd class="report_cont" style="height: 80px;">${reply.replyContent}</dd>
					</dl>
				</div>
				<div class="lst_reason">
					<strong class="reason_title">사유선택</strong>
					<!---->
					<div class="list_type">
						<ul>
							<c:forEach items="${categories}" var="category" varStatus="status">
								<li class="list">
									<input type="radio" name="select" id="${status.index}" class="report_reason" value="${category.warnCateId}">
									<div class="check_area">
										<label for="${status.index}">${category.warnCateName}</label>
										<button type="button" class="more">
											<span class="blind">더보기</span>
										</button>
										<!-- <ul class="answer_area">
											<li class="list_answer">사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보 행위</li>
											<li class="list_answer">동일하거나 유사한 내용 반복 게시</li>
										</ul> -->
										<ul class="answer_area">
											<c:choose>
												<c:when test="${category.warnCateId eq 1}">
													<li class="list_answer">동일하거나 유사한 내용 반복 게시</li>
												</c:when>
												<c:when test="${category.warnCateId eq 2}">
													<li class="list_answer">불법 행위, 불법 링크에 대한 정보 제공</li>
													<li class="list_answer">불법 상품을 판매하거나 유도하는 내용</li>
												</c:when>
												<c:when test="${category.warnCateId eq 3}">
													<li class="list_answer">성적 수치심을 일으키는 내용</li>
													<li class="list_answer">가출/왕따/학교폭력/자살 등 청소년에게 부정적인 영향을 조성하는 내용</li>
												</c:when>
												<c:when test="${category.warnCateId eq 4}">
													<li class="list_answer">직·간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용</li>
													<li class="list_answer">생명을 경시여기거나 비하하는 내용</li>
												</c:when>
												<c:when test="${category.warnCateId eq 5}">
													<li class="list_answer">사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보 행위</li>
												</c:when>
												<c:when test="${category.warnCateId eq 6}">
													<li class="list_answer">당사자 동의 없는 특정 개인을 인지할 수 있는 정보</li>
													<li class="list_answer">법적으로 중요한 타인의 개인정보를 게재</li>
												</c:when>
												<c:when test="${category.warnCateId eq 7}">
													<li class="list_answer">불쾌한 표현 포함</li>
												</c:when>
											</c:choose>
										</ul>
									</div>
								</li>
							</c:forEach>
						</ul>

						<div class="other-reason" style="display: none;">
							<label for="otherReason" style="font-size: 14px; margin-left: 55px; margin-top: 5px;">기타 신고 사유</label>
							<textarea class= "list" id="otherReason" name="otherReason" ></textarea>
						</div>

					</div>


				</div>
			</div>
		</div>
		<div class="pop_footer">
			<a href="#" class="btn_submit">신고하기</a>
		</div>
		<!-- 
		<button type="button" class="btn_close">
			<span class="blind">닫기</span>
		</button>
		-->
	</div>
	<script>
		/*<![CDATA[*/
		const requestParam = {
			"itemType" : [ "AA04" ],
			"reportCountryCd" : [ "KR" ],
			"itemTitle" : [ "\uC0B0\uC5C5\uB3C4 \uC644\uC804\uD788 \uBC14\uB00C\uACE0 \uAE08\uC735 \uC815\uCC45\uB3C4 \uBC14\uB00C\uACE0 \uC7AC\uC815 \uC0C1\uD669\uB3C4 \uBC14\uB00C\uACE0 \uD22C\uC790\uC790\uB4E4\uC758 \uAD6C\uC131\uC774\uB098 \uC131\uD5A5\uC774\uB098 \uC815\uBCF4\uC758 \uC218\uC900\uC5D0 \uB530\uB978 \uB300\uC751\uB3C4 \uC644\uC804\uD788 \uBC14\uB00C\uC5C8\uB294\uB370.  36\uB144 \uC804\uC744 \uAC00\uC9C0\uACE0 \uD604\uC7AC\uB97C \uC608\uCE21\uD55C\uB2E4\uB294 \uAC83\uC740" ],
			"itemWriterNick" : [ "\uD398\uD504\uB9B0" ],
			"itemWriterId" : [ "yoda****" ],
			"cwriter" : [ "yoda****" ],
			"ctitle" : [ "\uC0B0\uC5C5\uB3C4 \uC644\uC804\uD788 \uBC14\uB00C\uACE0 \uAE08\uC735 \uC815\uCC45\uB3C4 \uBC14\uB00C\uACE0 \uC7AC\uC815 \uC0C1\uD669\uB3C4 \uBC14\uB00C\uACE0 \uD22C\uC790\uC790\uB4E4\uC758 \uAD6C\uC131\uC774\uB098 \uC131\uD5A5\uC774\uB098 \uC815\uBCF4\uC758 \uC218\uC900\uC5D0 \uB530\uB978 \uB300\uC751\uB3C4 \uC644\uC804\uD788 \uBC14\uB00C\uC5C8\uB294\uB370.  36\uB144 \uC804\uC744 \uAC00\uC9C0\uACE0 \uD604\uC7AC\uB97C \uC608\uCE21\uD55C\uB2E4\uB294 \uAC83\uC740 \uC528\uC798\uB370\uAE30 \uC5C6\uB294 \uCF54\uBA54\uB514\uC77C \uBFD0\uC784." ],
			"memtype" : [ "Y" ],
			"rlang" : [ "ko" ],
			"vsvc" : [ "BLG" ],
			"svc" : [ "CBM" ],
			"cwriterenc" : [ "Wj5djnBpFJ7GeqBjCjZRjw==" ],
			"env" : [ "pc" ],
			"itemId" : [ "blog;default;858303_201_223238903379;806986049715699725" ],
			"itemEncyptWriterId" : [ "gz6kiAJn\/BSlZpDWfCH\/Kw==" ],
			"reportLangCd" : [ "ko" ],
			"ctype" : [ "AA04" ],
			"itemSvcCd" : [ "CBM" ],
			"rcountry" : [ "KR" ],
			"memberType" : [ "Y" ],
			"itemDt" : [ "20231026005205" ],
			"itemVirtualSvcCd" : [ "BLG" ],
			"cid" : [ "blog;default;858303_201_223238903379;806986049715699725" ],
			"itemCateLevel" : [ "0", "1", "2" ],
			"itemCateName" : [ "\uBE14\uB85C\uADF8_\uB313\uAE00",
					"\uBE14\uB85C\uADF8_\uB313\uAE00",
					"\uBE14\uB85C\uADF8_\uB313\uAE00" ],
			"itemCateId" : [ "BLG_001", "BLG_001;001", "BLG_001;001;001" ],
			"m" : [ "rprtFrm" ]
		};

		let requestParamMap = new Map();

		const requestParamKeys = Object.keys(requestParam);
		for (let index = 0; index < requestParamKeys.length; index++) {
			let key = requestParamKeys[index];
			let value = requestParam[key];
			if (value !== null && value !== '') {
				requestParamMap.set(key, value[0]);
			}
		}

		// nClicks 로그 수집 서버
		window.ccsrv = "cc.naver.com";
		// nClicks 페이지코드(NSCode)
		window.g_ssc = "srp.all";
		/*]]>*/
	</script>

	<script src="/lib/nclk_v0.8.1.js"></script>


	<script src="/js/srp-06267de901b9829dfb022778f2383cad.js"></script>
	<div id="scrnli_recorder_root"></div>


	<iframe src="chrome-extension://ijejnggjjphlenbhmjhhgcdpehhacaal/audio-devices.html" allow="microphone" style="display: none;"></iframe>
	<input type="file" id="" name="file" style="display: none;">
	<div data-v-f3fb3dc8="">
		<div data-v-f3fb3dc8="" class="container_selected_area" style="cursor: crosshair;"></div>
		<div data-v-f3fb3dc8="" class="area" style="left: 0px; top: 0px; width: 0px; height: 0px;"></div>
	</div>
</body>
</body>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<!--<jsp:include page="../include/footer.jsp" />-->
</body>
</html>