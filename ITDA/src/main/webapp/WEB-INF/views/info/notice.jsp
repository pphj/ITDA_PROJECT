<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko"
	data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>

<meta charset="UTF-8">
<title>공지사항</title>

<link rel="icon" href="${pageContext.request.contextPath}/resources/image/main/tv_icon.ico">
<!--  <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png"> -->
<!-- 페이지 네이션 -->
<link rel="stylesheet"
	href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309211654">
<!-- 공지사항 페이지 전체 css -->
<!-- <link rel="stylesheet"
	href="https://static.hankyung.com/resource/www/help/css/help.css?v=202309211654"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/info/help.css">	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/info/notice.css">
<script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
<script type="text/javascript"
	src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309211654"
	async="true"></script>
	

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
					<strong class="cont-tit txt-en">공지사항</strong>
					<ul class="faq-menu-list">
						<li><a href="${pageContext.request.contextPath}/info/faq">FAQ</a></li>
						<li class="on"><a
							href="${pageContext.request.contextPath}/info/notice" target="">공지사항</a></li>
						<li><a href="javascript:void(0);" id="qnaBtn"
							onclick="handleQnABtnClick()"> 1:1문의<span
								class="icon-membersonly2">회원전용</span>
						</a></li>
					</ul>
					<!-- contents -->
					<div id="contents" class="contents">
						<div class="layout-inner">
							<section class="qna-wrap">
								<div class="list-basic">
									<!-- adminBoardList 데이터 반복 출력 -->
							<c:forEach var="adminBoard" items="${adminBoardList}">
							    <div class="list-item">
							        <div class="col tit">
							            <a href="${pageContext.request.contextPath}/info/notice/view?no=${adminBoard.adNum}">${adminBoard.adTitle}</a>
							        </div>
							        <p class="col date txt-num">
							            <fmt:formatDate value="${adminBoard.adDate}" pattern="yyyy-MM-dd HH:mm" />
							        </p>
							    </div>
							</c:forEach>
								</div>
							</section>
						</div>
					</div>
					<script>
    function handleQnABtnClick() {
        // Spring Security의 인증 상태를 확인
        var isAuthenticated = <c:out value="${pageContext.request.userPrincipal != null}" />;
        if (isAuthenticated) {
            // 로그인 상태인 경우 1:1문의 페이지로 이동
            window.location.href = "${pageContext.request.contextPath}/info/qna";
        } else {
            // 로그아웃 상태인 경우 
            alert("로그인이 필요합니다.");
        }
    }
    
    
</script>

					  <div class="pagination" role="navigation">
						<a href="${pageContext.request.contextPath}/info/notice?page=1"
							class="btn-page-first"> <span class="blind">처음</span>
						</a> <a href="${pageContext.request.contextPath}/info/notice?page=1"
							class="btn-page-prev"> <span class="blind">이전</span>
						</a> <strong>1</strong>  
						<a href="${pageContext.request.contextPath}/info/notice?page=5"
							class="btn-page-next"> <span class="blind">다음</span>
						</a> <a href="${pageContext.request.contextPath}/info/notice?page=5"
							class="btn-page-last"> <span class="blind">마지막</span>
						</a>
					</div>   
				
				</section>
			</div>
		</div>
		<!-- // contents -->
		<jsp:include page="../include/footer.jsp" />

	</div>
</body>
</html>