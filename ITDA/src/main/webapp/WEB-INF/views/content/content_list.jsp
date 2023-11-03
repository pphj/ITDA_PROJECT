<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="${pageContext.request.contextPath}/resources/css/common.css"
	rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="utf-8">
<title><c:out value="${param.chcate_name}" default='전체글' />:${param.chname}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/content/content_list.css">
<script
	src="${pageContext.request.contextPath}/resources/js/content_list.js"></script>
<jsp:include page="../include/header.jsp" />
</head>
<body>
	<div class="header_wrap">
		<div class="header_inline"></div>
	</div>
	<c:if test="${listcount == 0 }">
		<div class="content_group_wrap" style="margin-bottom: 70px;">
			<div class="content_group">
				<div class="head_content">
					<div class="head_service">
						<div class="head_back">
							<a class=back_content href="${pageContext.request.contextPath}/channels/${param.chnum}?userid=${ChannelList.ownerId}"> 
							<img src="${pageContext.request.contextPath}/image/content/errow_left.png" width="20"></a>
						</div>
					</div>
					<h2 class="head_title">${param.chname}</h2>
				</div>
				<hr>
				<div class="content_line">
					<div class="content_tap_wrap">
						<h3 class="content_head">
							<span class="content_cate_title" style="color: #666666"> <c:out
									value="${param.chcate_name}" default='전체글' />
							</span> <em>${listcount}</em>
						</h3>
					</div>
					<div class="category_sorting_wrap">
						<div class="sorting_wrap">

							<ul class="sorting_list">
								<li class="sorting_item" role="radio" aria-checked="true">
									<a
									href="contentlist.co?chnum=${param.chnum}&chcate_id=${param.chcate_id}&chcate_name=<c:out value="${param.chcate_name}"  default='전체글'/>&chname=${param.chname}&order=desc"
									class="sorting_link" id="sort_desc" onClick="sort_desc()"></a>
								</li>
								<li class="sorting_item" role="radio"><a
									href="contentlist.co?chnum=${param.chnum}&chcate_id=${param.chcate_id}&chcate_name=<c:out value="${param.chcate_name}"  default='전체글'/>&chname=${param.chname}&order=asc"
									class="sorting_link" id="sort_asc" onClick="sort_asc()"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="content_list_wrap">
					<h4 style="text-align: center; margin: 100px 0px; color: #959595; font-size: 20px;">등록된 글이
						없습니다.</h4>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${listcount > 0 }">
		<div class="content_group_wrap">
			<div class="content_group">
				<div class="head_content">
					<div class="head_service">
						<div class="head_back">
							<a class=back_content href="${pageContext.request.contextPath}/channels/${param.chnum}?userid=${ChannelList.ownerId}"><img
								src="../image/content/errow_left.png" width="20"></a>
						</div>
					</div>
					<h2 class="head_title">${param.chname}</h2>
				</div>
				<hr>
				<div class="content_line">
					<div class="content_tap_wrap">
						<h3 class="content_head">
							<span class="content_cate_title"> <c:out
									value="${param.chcate_name}" default='전체글' />
							</span> <em>${listcount}</em>
						</h3>
					</div>
					<div class="category_sorting_wrap">
						<div class="sorting_wrap">
							<input type="hidden" name="order" value="${order}">
							<ul class="sorting_list">
								<li class="sorting_item" role="radio" aria-checked="true">
									<a
									href="contentlist.co?page=${page}&chnum=${param.chnum}&chcate_id=${param.chcate_id}&chcate_name=<c:out value="${param.chcate_name}"  default='전체글'/>&chname=${param.chname}&order=desc"
									class="sorting_link" id="sort_desc">최신순</a>
								</li>
								<li class="sorting_item" role="radio"><a
									href="contentlist.co?page=${page}&chnum=${param.chnum}&chcate_id=${param.chcate_id}&chcate_name=<c:out value="${param.chcate_name}"  default='전체글'/>&chname=${param.chname}&order=asc"
									class="sorting_link" id="sort_asc">과거순</a></li>
							</ul>
						</div>
					</div>
				</div>


				<div class="content_list_wrap">
					<c:set var="num" value="${listcount-(page-1)*limit}" />
					<ul class="content_list">
						<c:forEach var="b" items="${contentlist}">
							<li class="content_item">
								<div class="content_item_line">
									<a
										href="${pageContext.request.contextPath}/contents/${param.chnum}/${b.boardNum}?userid=${ChannelList.ownerId}">
										<img
										src="${pageContext.request.contextPath}/image/contents/${param.chnum}${b.thumbNail}?userid=${ChannelList.ownerId}"
										class="content_thumb">
									</a>
									<div class="content_text">
										<a class="content_text_link"
											href="${pageContext.request.contextPath}/contents/${param.chnum}/${b.boardNum}?userid=${ChannelList.ownerId}">
											<strong class="content_title" style="color: #666666">${b.chCate_Name}</strong>


											<span class="content_title"
											style="color: #959595; font-size: 15px;"> <c:if
													test="${b.boardTitle.length()>=20}">
													<c:out value="${b.boardTitle.substring(0,20)}..." />
												</c:if> <c:if test="${b.boardTitle.length()<20}">
													<c:out value="${b.boardTitle}" />
												</c:if>
										</span>
										</a>
										<div class="content_info" style="color: #666666">
											<span class="content_comment_wrap"> <span
												class="content_info_text"> ${b.boardDate} </span> <a><img
													class="content_comment_img"
													src="../image/content/heart.png"> <span
													class="content_comment_count">${b.boardHeart}</span></a> <a><img
													class="content_comment_img"
													src="../image/content/comment.png"> <span
													class="content_comment_count">${b.cnt}</span> </a>
											</span>
										</div>
									</div>
									<br>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- content_group_wrap -->
		<div class="center-block">

			<ul class="pagination justify-content-center">
				<c:if test="${page <= 1}">
					<li class="page-item" style="font-family: "Noto Sans DemiLight", "Malgun Gothic", sans-serif;"><a class="page-link gray" style="color: #959595; font-size: 15px;">이전&nbsp;</a></li>
				</c:if>
				<c:if test="${page > 1}">
					<li class="page-item"><a
						href="contentlist.co?order=${order }&chnum=${param.chnum}&chcate_name=<c:out value="${param.chcate_name}" default='전체글' />&chcate_id=${param.chcate_id}&chname=${param.chname}&page=${page-1}"
						class="page-link" style=" color:  #959595; text-decoration: none; font-size: 15px;">이전&nbsp;</a></li>
				</c:if>

				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page}">
						<li class="page-item active"  style="font-family: "Noto Sans DemiLight", "Malgun Gothic", sans-serif;"><a class="page-link" style="color: #959595; font-size: 15px;">${a}</a></li>
					</c:if>
					<c:if test="${a != page }">
						<li class="page-item"><a
							href="contentlist.co?order=${order }&chnum=${param.chnum}&chcate_name=<c:out value="${param.chcate_name}" default='전체글' />&chcate_id=${param.chcate_id}&chname=${param.chname}&page=${a}"
							class="page-link" style="color: #959595; font-size: 15px;" >${a}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage }">
					<li class="page-item" style="font-family: "Noto Sans DemiLight", "Malgun Gothic", sans-serif;"><a class="page-link gray" style="color: #959595; font-size: 15px;">&nbsp;다음</a></li>
				</c:if>
				<c:if test="${page < maxpage }">
					<li class="page-item"><a
						href="contentlist.co?order=${order }&chnum=${param.chnum}&chcate_name=<c:out value="${param.chcate_name}" default='전체글' />&chcate_id=${param.chcate_id}&chname=${param.chname}&page=${page+1}"
						class="page-link" style="color: #959595; font-size: 15px;">&nbsp;다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>