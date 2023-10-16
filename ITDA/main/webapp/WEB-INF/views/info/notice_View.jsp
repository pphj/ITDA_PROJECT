<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko"
	data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
<meta charset="utf-8">
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="shortcut icon" href="https://www.hankyung.com/favicon.ico">
<!--  <link rel="apple-touch-icon" sizes="192x192" href="https://static.hankyung.com/resource/common/img/favicon/apple-touch-icon.png"> -->
<!-- 페이지 네이션 -->
<link rel="stylesheet"
	href="https://static.hankyung.com/css/www/w/common.ui.all.css?v=202309211654">
<!-- 공지사항 페이지 전체 css -->
<link rel="stylesheet"
	href="https://static.hankyung.com/resource/www/help/css/help.css?v=202309211654">

<script src="https://static.hankyung.com/plugin/jquery-1.12.4.min.js"></script>
<script src="https://static.hankyung.com/plugin/jquery.cookie.js"></script>
<script type="text/javascript"
	src="https://static.hankyung.com/js/ga/googleTagManager.js?v=202309211654"
	async="true"></script>
<jsp:include page="../include/header.jsp" />

</head>

<body>

	<div class="list-basic">

			<div class="list-item">
			  <div class="col tit">${adminBoard.adTitle}</div>
			  <!-- adTitle 필드 출력 -->
			  <p class="col date txt-num">${adminBoard.adDate}</p>
			  <!-- adDate 필드 출력 -->
			  <p class="col content">${adminBoard.adContent}</p>
			  <!-- adContent 필드 출력 -->
			</div>


	</div>


	<jsp:include page="../include/footer.jsp" />

</body>
</html>