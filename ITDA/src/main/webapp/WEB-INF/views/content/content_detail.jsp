<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" content="${_csrf.token}">
<jsp:include page="../include/header.jsp" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script> var contextPath = "<%=request.getContextPath()%>"
</script>
<script src="${pageContext.request.contextPath}/js/content/Reply.js"></script>
<script
	src="${pageContext.request.contextPath}/js/content/HeartandVisit.js"></script>
<link
	href='${pageContext.request.contextPath}/resources/css/content/Reply.css'
	type='text/css' rel='stylesheet'>
<link
	href="${pageContext.request.contextPath}/resources/css/content/content_detail.css"
	type="text/css" rel="stylesheet">
<script>
	$(document).ready(function() {
		getList(1); // 페이지 로드 시 처음으로 댓글 목록 가져오기
		
		$('.btn_Delete').on('click', function(e) {
		    e.preventDefault();

		    // 팝업 창 설정
		    let width = 736; // 팝업 창의 너비
    		let height = 945; // 팝업 창의 높이
		    let left = (window.screen.width - width) / 2;
		    let top = (window.screen.height - height) / 2;
		    
		 	// 팝업 창 열기
		    let popupWindow = window.open(contextPath + '/contents/contentwarn/' + ${board.chNum} + '?boardNum=' + ${board.boardNum}, '신고하기', 
		        'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
		 	
		 	
		});

	});	
</script>
<title>${board.boardTitle}</title>
</head>
<body>
	<input type="hidden" name="LoginId" id="LoginId"
		value="${userinfo.userId }" />
	<input type="hidden" id="chnum" value="${board.chNum}" name="chnum">
	<input type="hidden" id="boardnum" value="${board.boardNum}"
		name="boardnum">
	<input type="hidden" name="num" value="${board.boardNum}"
		id="Reply_board_num">
	<div class="board_detail_wrap">
		<div class="board_detail_all_group">
			<div class="board_detail_title_group">
				<div class="inline_header">
					<a
						href="${pageContext.request.contextPath}/channels/${board.chNum}?userid=${board.writer}"
						class="button_back _BACK"><img class="link_premium"
						style="width: 30px; margin-top: 20px;"
						src="/itda/resources/image/content/errow_left.png"> <span
						class="blind">이전으로</span> </a>
				</div>
				<div class="board_detail_category">
					<a
						href="${pageContext.request.contextPath}/channels/${board.chNum}"
						class="viewer_category_link">${board.chCate_Name}</a>
				</div>


				<div class="board_detail_title_inline">
					<span class="board_detail_title">${board.boardTitle}</span>
				</div>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="pinfo" />
					<c:if test="${sellerinfo.userId == pinfo.username}">
						<a
							href="${pageContext.request.contextPath}/contents/${board.chNum}/modifyView?boardnum=${board.boardNum}&${board.chCate_Name}">
							<button type="button" class="btn_type">
								<span class="txt_default"> <img class="ico_plus"
									src="${pageContext.request.contextPath}/resources/image/channel/ico-plus.png"><b>글수정</b>
								</span>
							</button>
						</a>
						<form name="deleteForm"
							action="${pageContext.request.contextPath}/contents/${board.chNum}/delete"
							method="post" style="all: unset;"
							onsubmit="return confirm('정말 삭제하시겠습니까?')">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"> <input type='hidden'
								name='boardnum' value='${board.boardNum}' />
							<button type="submit" class="btn_type">
								<span class="txt_default"> <img class="ico_plus"
									src="${pageContext.request.contextPath}/resources/image/channel/ico-plus.png">
									<b>글삭제</b>
								</span>
							</button>
						</form>
					</c:if>
				</sec:authorize>
				<div class="viewer_title_content">
					<div class="viewer_date">${board.boardDate}</div>
					<div class="viewer_count">
						<div class="viewer_count_func_wrap">
							<div class="content_info">
								<span class="content_comment_wrap"> <a href="#"
									class="heart_butt" data-id="${board.boardNum}"> <img
										class="content_comment_img"
										src='${pageContext.request.contextPath}/image/content/heart.png'>
										<span class="content_comment_count"></span> <input
										type="hidden" name="boardHeart"
										value="${updatedValue.heartCount}" id="boardHeart"> <em
										class="u_heart_count">${updatedValue.heartCount}</em>
								</a> <a href="#reply_area"><img class="content_comment_img2"
										src='${pageContext.request.contextPath}/image/content/comment.png'>
										<span class="content_comment_count"></span> <em
										class="u_cnt_count">${rcnt}</em> </a>
								</span>
							</div>
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="pinfo" />
								<c:if test="${sellerinfo.userId != pinfo.username}">
									<button type="button" class="btn_type btn_Delete"
										data-board-num="${board.boardNum}" style="width: 200px;">
										<p style="width: 200px; height: 10px; color: #929294;">게시글
											신고하기</p>
									</button>
								</c:if>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
			<!--  
			<div class="viewer_main_text_group">
				<div class="ck-content content_main_text">${board.boardContent}
					<input type="hidden" name="num" value="${board.boardNum}" id="Reply_board_num">
				</div>
			</div> 
			-->

			<div class="viewer_main_text_group">
				<div class="ck-content content_main_text">

					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
						<c:choose>
							<c:when
								test="${sellerinfo != null and sellerinfo.userId == pinfo.username}">
								<!-- 채널 주인인 경우, 게시글의 전체 내용을 보여줍니다. -->   			
			                   			 ${board.boardContent}
			                </c:when>

							<c:when
								test="${subUser != null and subUser.userId == pinfo.username}">
								<!-- 구독자인 경우, 게시글의 전체 내용을 보여줍니다. -->
										${board.boardContent}
							</c:when>

							<c:otherwise>
								<!-- 채널 주인이나 구독자가 아닌 로그인한 사용자에게 게시글의 내용을 400자까지만 보여줍니다. -->
			                    		${fn:substring(board.boardContent, 0, 2000)}

			                </c:otherwise>
						</c:choose>
					</sec:authorize>

					<sec:authorize access="isAnonymous()">

						<!-- 로그인하지 않은 사용자에게 게시글의 내용을 400자까지만 보여줍니다. -->
			            ${fn:substring(board.boardContent, 0, 400)}
 			        </sec:authorize>

					<input type="hidden" name="num" value="${board.boardNum}"
						id="Reply_board_num">
				</div>
			</div>

			<div class="viewer_bottom_warp">

				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="pinfo" />
					<c:choose>
						<c:when
							test="${sellerinfo != null and sellerinfo.userId == pinfo.username}">
							<!-- 채널 주인 또는 구독자인 경우, 메시지를 숨깁니다. -->
						</c:when>

						<c:when
							test="${subUser != null and subUser.userId == pinfo.username}">

						</c:when>

						<c:otherwise>
							<!-- 채널 주인이나 구독자가 아닌 로그인한 사용자에게 메시지를 보여줍니다. -->
							<div class="viewer_paywall">
								<div class="viewer_paywall_text">
									<!-- <strong class="viewer_paywall_title">본 콘텐츠는 무료로
										제공중입니다.<br>콘텐츠가 마음에 드셨나요?
									</strong> -->
									<p class="viewer_paywall_desc"
										style="color: black; text-decoration: none;">올바른 구독으로 더 많은
										콘텐츠를 만나보세요!</p>
								</div>
								<div class="viewer_paywall_subscribe _PAYWALL_BUTTON"
									data-is-ticket="true" data-is-product="" data-price="19,900"
									data-url="/allbareun/allbareunkr/subscriptions?rContentId=230726221406327lp">
									<div class="viewer_paywall_subscribe_inner">
										<a
											href="${pageContext.request.contextPath}/product/subscriptions">
											<span class="viewer_paywall_subscribe_title">프리미엄 구독으로
												다양한 콘텐츠를 만나보세요!</span>
										</a>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</sec:authorize>

				<sec:authorize access="isAnonymous()">
					<!-- 로그인하지 않은 사용자에게 메시지를 보여줍니다. -->
					<div class="viewer_paywall">
						<div class="viewer_paywall_text">
							<p class="viewer_paywall_desc"
								style="color: black; text-decoration: none;">올바른 구독으로 더 많은
								콘텐츠를 만나보세요!</p>
						</div>
						<div class="viewer_paywall_subscribe _PAYWALL_BUTTON"
							data-is-ticket="true" data-is-product="" data-price="19,900"
							data-url="/allbareun/allbareunkr/subscriptions?rContentId=230726221406327lp">
							<div class="viewer_paywall_subscribe_inner">
								<a
									href="${pageContext.request.contextPath}/product/subscriptions">
									<span class="viewer_paywall_subscribe_title">프리미엄 구독으로
										다양한 콘텐츠를 만나보세요!</span>
								</a>
							</div>
						</div>
					</div>
				</sec:authorize>

				<div class="viewer_paywall_none" style="color: red;">
					<p class="viewer_paywall_none_text">해당 콘텐츠는 프리미엄 구독자 공개(유료)
						콘텐츠로 무단 캡쳐 및 불법 공유시 법적 제재를 받을 수 있습니다.</p>
				</div>


				<div class="viewer_bottom_info">
					<div class="viewer_tag">
						<ul class="viewer_tag_list">
							<c:forEach var="tag" items="${taginfo}" varStatus="status">
								<input type="hidden" name="tagId" value="${tag.tagId}">
								<li class="viewer_tag_item"><a href class="viewer_tag_link"
									data-clk="chlh_cont.tag">${tag.tagName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="viewer_bottom_count_wrap">
						<div class="viewer_bottom_count">
							<span class="content_comment_wrap"> <a href><img
									class="content_comment_img"
									src='${pageContext.request.contextPath}/image/content/heart.png'>
									<span class="content_comment_count"></span> <em
									class="u_heart_count">${board.boardHeart}</em> </a> <a href><img
									class="content_comment_img2"
									src='${pageContext.request.contextPath}/image/content/comment.png'>
									<span class="content_comment_count"></span> <em
									class="u_cnt_count">${rcnt}</em> </a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="reply_area" id="reply_area">
			<div class="reply_head">
				<h5 class="reply_title">
					댓글 <sup class="reply_count"></sup>
				</h5>
				<div class="reply_order">
					<ul class="reply_order_list">
						<%-- 등록순 최신순 목록 --%>
					</ul>
				</div>
			</div>
			<%-- comment_head end --%>
			<ul class="reply_list"
				style="margin-left: 200px; margin-right: 200px;">
				<%-- 댓글 목록 --%>
			</ul>
			<div class="reply_write">
				<div class="reply_write_area">
					<b class="reply_write_area_name">${userinfo.userId}</b> <span
						class="reply_write_area_count">0/200</span>
					<textarea placeholder="댓글을 남겨보세요" rows="1"
						class="reply_write_area_text" maxLength="200"></textarea>
				</div>
				<div class="register_box">
					<div class="button btn-cancel">취소</div>
					<%-- 댓글의 취소는 display:none, 등록만 보이도록 합니다.--%>
					<div class="button btn-register">등록</div>
				</div>
			</div>
			<%-- reply_write end --%>
		</div>
	</div>
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}">
	<jsp:include page="../include/footer.jsp" />
</body>
</html>