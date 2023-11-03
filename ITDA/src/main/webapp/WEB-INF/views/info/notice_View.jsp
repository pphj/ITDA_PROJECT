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
<link rel="stylesheet"
	href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309211654">
<!-- 공지사항 페이지 전체 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/help.css">	

<script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
<script type="text/javascript"
	src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309211654"
	async="true"></script>
<jsp:include page="../include/header.jsp" />

</head>

<body>

	<link href="/help/css/quill_editor.css?v=202310161701" rel="stylesheet">
	<div id="contents" class="contents view-wrap">
		<div class="layout-inner">
			<section class="notice-wrap">
				<div class="view-top">
					<h1 class="tit">${adminBoard.adTitle}</h1>
					<div class="view-info">
						<span class="col date txt-num">
				            <fmt:formatDate value="${adminBoard.adDate}" pattern="yyyy-MM-dd HH:mm"/>
				        </span>
					</div>
				</div>
				<div class="view-cont ql-editor" style="height: 70vh;">${adminBoard.adContent}</div>
				<div class="btn-area" style=" padding: 20px;">
					<a href="${pageContext.request.contextPath}/info/notice" class="btn-default">목록</a>
				</div>
			</section>
		</div>
	</div>
	
	<jsp:include page="../include/footer.jsp" />
</body>
</html>