<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content/content_write.css">
<script src="${pageContext.request.contextPath}/resources/js/content/content_write.js"></script>
<script src="../../resources/ckeditor5/build/ckeditor.js"></script>
<script type="module" src="${pageContext.request.contextPath}/resources/js/Ckeditor.js"></script>
<script !src="">
	const chnum = <c:out value="${chNum}"/>
</script>
<title>채널게시글 작성 </title>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="board_write_wrap">
		<div class="board_group">
			<form action="${pageContext.request.contextPath}/channels/contentadd" method="post" enctype="multipart/form-data">
			<input type="hidden" name="chNum" id="chNum" value="${chnum}">
			<form action="contentadd.co" method="post" enctype="multipart/form-data">
				<div class="text_form board_head_wrap">
					<select class="category_select_from">
						<option disabled selected>카테고리를 선택하세요</option>
						<c:forEach var="item" items="${cbctlist}">
							<option value="${item.chCate_Id}">${item.chCate_Name}</option>
						</c:forEach>
					</select> <input type="hidden" name="chCate_Id" class="categoryId" value="">
				</div>
				<div class="board_subject_wrap">
					<input class="text_from board_subject_from" type=text name="boardTitle" placeholder="제목을 입력하세요">
				</div>
				<div class="board_content_wrap">
					<div class="editor_group">

						<textarea name="boardContent" id="editor"></textarea>
						<script type="text/javascript">
							// 글쓰기 editor 및 사진 업로드 기능
							CKEDITOR.replace('editor', {
								filebrowserUploadUrl : '/contentadd'
							});
						</script>
					</div>
				</div>

				<div class="board_file_wrap">
					<div class="thumbNailArea">

						<img class="thumbNailImage" src="${src}" alt="profile">


						<textarea name="content" id="editor"></textarea>




					</div>
				</div>
				<div class="board_tag_wrap">
					<input class="board_tag_text"  type=text id="input_tag" placeholder="태그를 추가해 보세요(최대 5개)">
					<button class="tag_add" id="tag_add" type="button" onclick="cnt_tag();">추가</button>
					<div class="add_tag_group">
						<div class="viewer_tag">
							<ul class="viewer_tag_list" id="ul_tag_list">
							</ul>
						</div>
					</div>
				</div>
				<div class="board_file_wrap">
					<div class="thumbNailArea">
						<%--                    <span class="thumbNailName">썸네일</span>--%>
						<div style="height: 50px; margin: 15px 20px 0px 0px">
							<label class="thumbNailUploadArea" for="file"> <img src="${pageContext.request.contextPath}/image/content/thumbnailupload.png"
								style="width: 100px; height: 100px;"><br> <span style="color: #c9c9c9">썸네일 업로드</span> <input
								class="thumbNailUpload" type="file" name="upload" id="file" accept="image/*">
							</label>
						</div>
						<img class="thumbNailImage" src="${src}" alt="profile">
					</div>
				</div>
				<div class="board_button_wrap">
					<button type="button" class="board_write_button write_cancel">작성취소</button>
					<button type="submit" class="board_write_button">작성완료</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
