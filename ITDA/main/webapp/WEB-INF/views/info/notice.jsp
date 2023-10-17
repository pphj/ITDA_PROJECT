<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36"><head>
	<meta charset="utf-8">
    <head>
		<meta charset="UTF-8">
        <title>공지사항</title>

        <link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
       <!--  <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png"> -->
        <!-- 페이지 네이션 -->
        <link rel="stylesheet" href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309211654">
        <!-- 공지사항 페이지 전체 css -->
        <link rel="stylesheet" href="https://static.hankyung.com/resource/www/help/css/help.css?v=202309211654"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/notice.css">
        <script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
		<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
		<script type="text/javascript" src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309211654" async="true"></script>
		<jsp:include page="../include/header.jsp"/>
		
    </head>
    
    <body>
        <div id="wrap" class="wrap sub">
            <!-- skip navi -->
            <div class="skip_navi">
                <a href="#contents">본문 바로가기</a>
            </div>
          
<!-- contents -->
		<div id="contents" class="contents">
			<div class="layout-inner">
				<section class="notice-wrap">
					<h1 class="cont-tit">공지사항</h1>
					
					<ul class="faq-menu-list">

					<li class="on"><a href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
					<li ><a href="${pageContext.request.contextPath}/info/faq">FAQ</a></li>
					<li >
					
					<!-- 로그인 상태일 때 -->
					<sec:authorize access="isAuthenticated()">
					    <li><a href="#" id="qnaBtn">1:1문의<span class="icon-membersonly2">회원전용</span></a></li>
					</sec:authorize>
					<!-- 비로그인 상태일 때 -->
					<sec:authorize access="!isAuthenticated()">
					    <script>
					        $(document).ready(function() {
					            $("#qnaBtn").click(function(e) {
					                e.preventDefault();
					                alert("로그인이 필요합니다.");
					            });
					        });
					    </script>
					</sec:authorize>
					

					
					<!-- contents -->
				<div id="contents" class="contents">
					<div class="layout-inner">
						<section class="qna-wrap">
				
							<div class="list-basic">
								
								<!-- adminBoardList 데이터 반복 출력 -->
				        <c:forEach var="adminBoard" items="${adminBoardList}">
				    <div class="list-item">
				        <div class="col tit"><a href="${pageContext.request.contextPath}/info/notice/view?no=${adminBoard.adNum}">${adminBoard.adTitle}</a></div> <!-- adTitle 필드 출력 -->
				        <p class="col date txt-num">${adminBoard.adDate}</p> <!-- adDate 필드 출력 -->
				        <!-- 상태 필드 등 추가적인 내용을 표시할 수 있습니다. -->
				    </div>
						</c:forEach>
					
					
					
				</ul>
				
				
				<div class="pagination" role="navigation">
						<a href="${pageContext.request.contextPath}/info/notice?page=1"
							class="btn-page-first"> <span class="blind">처음</span>
						</a> <a href="${pageContext.request.contextPath}/info/notice?page=1"
							class="btn-page-prev"> <span class="blind">이전</span>
						</a> <strong>1</strong> <a
							href="${pageContext.request.contextPath}/info/notice?page=2">2</a> <a
							href="${pageContext.request.contextPath}/info/notice?page=3">3</a> <a
							href="${pageContext.request.contextPath}/info/notice?page=4">4</a> <a
							href="${pageContext.request.contextPath}/info/notice?page=5">5</a> <a
							href="${pageContext.request.contextPath}/info/notice?page=5"
							class="btn-page-next"> <span class="blind">다음</span>
						</a> <a href="${pageContext.request.contextPath}/info/notice?page=5"
							class="btn-page-last"> <span class="blind">마지막</span>
						</a>
					</div>
					

				</section>
			</div>
		</div>
		<!-- // contents -->
		<jsp:include page="../include/footer.jsp"/>

	</div>
    </body>
</html>