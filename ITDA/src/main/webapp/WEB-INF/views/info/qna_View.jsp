<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>

<jsp:include page="../include/header.jsp" />
<link href="/help/css/quill_editor.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/info/help.css">
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
								<dd>
									<fmt:formatDate value="${adminBoard.adDate}"
										pattern="yyyy-MM-dd HH:mm" />
								</dd>
							</dl>
							<dl>
								<dt>상태</dt>
								<dd>
									<c:choose>
										<c:when test="${not empty qnaReplyList}">
											<span>답변완료</span>
										</c:when>
										<c:otherwise>
											<span>답변대기</span>
										</c:otherwise>
									</c:choose>
								</dd>
							</dl>
						</div>

						<dl>
							<dt>문의유형</dt>
							<dd>
								<c:choose>
									<c:when test="${adminBoard.qcateId == 1}">홍보, 영리목적</c:when>
									<c:when test="${adminBoard.qcateId == 2}">불법 정보</c:when>
									<c:when test="${adminBoard.qcateId == 3}">음란, 청소년 유해</c:when>
									<c:when test="${adminBoard.qcateId == 4}">욕설, 비방, 차별, 혐오</c:when>
									<c:when test="${adminBoard.qcateId == 5}">도배, 스팸</c:when>
									<c:when test="${adminBoard.qcateId == 6}">개인정보 노출, 거래</c:when>
									<c:when test="${adminBoard.qcateId == 7}">기타</c:when>
									<c:when test="${adminBoard.qcateId == 8}">공지사항</c:when>
								</c:choose>
							</dd>
						</dl>


						<dl>
							<dt>문의내용</dt>

							<dd>
								<em class="qna-cont-tit">${adminBoard.adTitle}</em>

								<div class="qna-cont ql-editor">${adminBoard.adContent}</div>
							</dd>
						</dl>
					</div>



					<div class="content-box" style="padding: 20px;">
						<div class="form-list">
							<%-- 댓글 --%>
							<!-- 댓글 목록 표시 부분 -->
							<div id="qnaReply">
								<table class="table">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th>답변자</th>
											<th>내용</th>
											<th class="text-right">날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="reply" items="${qnaReplyList}">
											<tr>
												<td class="text-center">${reply.qnaReplyNum}</td>
												<td>${reply.adminId}</td>
												<td>${reply.qnaReplyContent}</td>
												<td class="text-right"><fmt:formatDate
														value="${reply.qnaReplyDate}" pattern="yyyy-MM-dd HH:mm" />
												</td>
											</tr>
										</c:forEach>
										<!-- 댓글 데이터가 없을 때 표시할 내용 -->
										<c:if test="${empty qnaReplyList}">
											<tr>
												<td class="text-center" colspan="4" style="height: 50vh;">답변
													대기중입니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>

						</div>
						<div class="btn-area">
							<a href="${pageContext.request.contextPath}/info/qna"
								class="btn-default">목록</a>
						</div>
					</div>
				</div>

			</section>
		</div>
	</div>
	<!-- // contents -->



	<jsp:include page="../include/footer.jsp" />

</body>
</html>