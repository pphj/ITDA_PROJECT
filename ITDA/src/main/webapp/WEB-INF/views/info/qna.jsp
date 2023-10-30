<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko"><head>
		<meta charset="UTF-8">
        <title>1:1 문의</title>

        <link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
        <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png">
        <link rel="stylesheet" href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202310171353">
        <link rel="stylesheet" href="https://static.hankyung.com/resource/www/help/css/help.css?v=202310171353">
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
			<div class="cont-top-area">
				<h1 class="cont-tit">나의 1:1문의</h1>
            <div class="faq-menu-area">
						<ul class="faq-menu-list">
							<li><a
								href="${pageContext.request.contextPath}/info/faq" target="">FAQ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
						</ul>
					</div>
				<a href="${pageContext.request.contextPath}/info/requests" class="btn-default">1:1 문의하기</a>
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
				        <em class="col category">${qna.qcateId}</em>
				        <div class="col tit">
				            <a href="${pageContext.request.contextPath}/info/qna/view?no=${qna.adNum}">${qna.adTitle}</a>
				        </div>
				        <span class="col date txt-num">${qna.adDate}</span>
				        <div class="col state">
				            <span class="badge-answer">${qna.adNum}</span>
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