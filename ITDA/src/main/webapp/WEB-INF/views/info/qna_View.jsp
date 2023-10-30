<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

<jsp:include page="../include/header.jsp" />
<link href="/help/css/quill_editor.css" rel="stylesheet">
<link rel="stylesheet" href="https://static.hankyung.com/resource/www/help/css/help.css?v=202310161701">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/info/qna_View.css">
</head>
<body>

	<!-- contents -->
	<div id="contents" class="contents">
		<div class="layout-inner">
		
			<section class="qna-wrap view-wrap">
				<div class="cont-top-area">
					<h1 class="cont-tit">나의 1:1문의</h1>
					<p class="cont-txt notice-txt">답변 운영 시간은 09:00 ~ 18:00 /
						토·일·공휴일 제외입니다.</p>
				</div>

				<div class="content-box">
					<div class="form-list view-list">
						<input type="hidden" name="no" value="">
						<div class="col">
							<dl class="flex-align-center">
								<dt>등록일</dt>
								<dd>${adminBoard.adDate}</dd>
							</dl>
							<dl>
								<dt>상태</dt>
								<dd>
									<span>${adminBoard.adState}</span>
								</dd>
						</dl>
						</div>

						<dl>
							<dt>문의유형</dt>
							<dd>${adminBoard.qcateId}</dd>
						</dl>

						<dl>
							<dt>문의내용</dt>

							<dd>
								<em class="qna-cont-tit">${adminBoard.adTitle}</em>

							<div class="qna-cont ql-editor">${adminBoard.adContent}</div>
							</dd>
						</dl>
					</div>
					
					
				
				<div class="content-box">
				<div class="form-list">
					<!-- <dl>
						<dt>답변</dt>
						<dd>답변 대기중입니다.</dd>
					</dl> -->
				</div>
				<div class="btn-area">
					<a href="${pageContext.request.contextPath}/info/qna" class="btn-default">목록</a>
				</div>
			</div>
				</div>

			</section>
		</div>
	</div>
	<!-- // contents -->


	<%-- <!-- contents -->
		<div id="contents" class="contents">
			<div class="layout-inner">
				<section class="qna-wrap">
					<div class="cont-top-area">
						<h1 class="cont-tit">나의 1:1문의</h1>
						<p class="cont-txt notice-txt">답변 운영 시간은 09:00 ~ 18:00 / 토·일·공휴일 제외입니다.</p>
					</div>

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

				</section>
			</div>
		</div> --%>



	<jsp:include page="../include/footer.jsp" />

</body>
</html>