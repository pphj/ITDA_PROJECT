<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="ko"><head>
		<meta charset="UTF-8">
        <title>1:1 문의</title>

        <link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
        <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png">
        <link rel="stylesheet" href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202310171353">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/help.css">	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/qna.css">
        <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-6V2CLLNXEB&amp;cx=c&amp;_slc=1"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-YR1S7BMWY7&amp;l=dataLayer&amp;cx=c"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-Y2XH7W3BRT&amp;l=dataLayer&amp;cx=c"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-T9TD5G7"></script><script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
		<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
		<script type="text/javascript" src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309221514" async="true"></script>
		<jsp:include page="../include/header.jsp"/>
		
    </head>
    <body>
        <div id="wrap" class="wrap sub">
            <!-- skip navi -->
           
       
<!-- contents -->
<div id="contents" class="contents">
	<div class="layout-inner">
		<section class="qna-wrap">
				<strong class="cont-tit txt-en">나의 1:1문의</strong>
			<div class="cont-top-area">
          <div class="faq-menu-area">
    <ul class="faq-menu-list">
        <li><a href="${pageContext.request.contextPath}/info/faq" target="">FAQ</a></li>
        <li><a href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
       <li><a href="${pageContext.request.contextPath}/info/requests" class="btn-default">1:1 문의글 작성</a>
    </ul>
</div>
</div>


			</section>		
			<div class="list-basic">
			<div class="list-item list-top">
					<div class="col category">카테고리</div>
					<div class="col tit">제목</div>
					<div class="col date">등록일</div>
					<div class="col state">상태</div>
				</div>
				<!-- adminBoardList 데이터 반복 출력 -->
						<c:forEach var="qna" items="${userQnaList}">
				    <div class="list-item">
				        <em class="col category">
				            <c:choose>
				                <c:when test="${qna.qcateId == 1}">홍보, 영리목적</c:when>
				                <c:when test="${qna.qcateId == 2}">불법 정보</c:when>
				                <c:when test="${qna.qcateId == 3}">음란, 청소년 유해</c:when>
				                <c:when test="${qna.qcateId == 4}">욕설, 비방, 차별, 혐오</c:when>
				                <c:when test="${qna.qcateId == 5}">도배, 스팸</c:when>
				                <c:when test="${qna.qcateId == 6}">개인정보 노출, 거래</c:when>
				                <c:when test="${qna.qcateId == 7}">기타</c:when>
				                <c:when test="${qna.qcateId == 8}">공지사항</c:when>
				            </c:choose>
				        </em>
				        <div class="col tit">
				            <a href="${pageContext.request.contextPath}/info/qna/view?no=${qna.adNum}">${qna.adTitle}</a>
				        </div>
				         <span class="col date txt-num">
				            <fmt:formatDate value="${qna.adDate}" pattern="yyyy-MM-dd HH:mm"/>
				        </span>
				        <div class="col state">
				           <c:choose>
                <c:when test="${not empty qna.qnaReplyList}">
                    <span>답변완료</span>
                </c:when>
                <c:otherwise>
                    <span>답변대기</span>
                </c:otherwise>
            </c:choose>
				            <!-- 여기에 상태 필드 추가 -->
				        </div>
				    </div>
				</c:forEach>

</div>

				
				
			</div>


			<div class="pagination" role="navigation">
				<a href="${pageContext.request.contextPath}/info/qna?page=1" class="btn-page-first">
					<span class="blind">처음</span>
				</a>
				<a href="${pageContext.request.contextPath}/info/qna?page=1" class="btn-page-prev">
					<span class="blind">이전</span>
				</a>
					<strong>1</strong>
				<a href="${pageContext.request.contextPath}/info/qna?page=2" class="btn-page-next">
					<span class="blind">다음</span>
				</a>
				<a href="${pageContext.request.contextPath}/info/qna?page=3" class="btn-page-last">
					<span class="blind">마지막</span>
				</a>
			</div>
		</section>
	</div>
</div>
<!-- // contents -->
            <!-- // contents -->

         <!-- footer -->
           <jsp:include page="../include/footer.jsp"/>
	<!-- /footer -->

            
        </div><iframe allow="join-ad-interest-group" data-tagging-id="G-6V2CLLNXEB" data-load-time="1695454705706" height="0" width="0" style="display: none; visibility: hidden;" src="https://td.doubleclick.net/td/ga/rul?tid=G-6V2CLLNXEB&amp;gacid=126819415.1695218125&amp;gtm=45je39k2&amp;aip=1&amp;fledge=1&amp;z=1747530967"></iframe>
    
</body></html>