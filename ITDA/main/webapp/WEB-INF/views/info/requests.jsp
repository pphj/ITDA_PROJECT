<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="${pageContext.request.contextPath}/css/header/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content/content_write.css">
 <script src="${pageContext.request.contextPath}/js/content_write.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/requests.css">
<script src="${pageContext.request.contextPath}/ckeditor5/build/ckeditor.js"></script>
<script type="module" src="../js/Ckeditor.js"></script>
<script src="">
   const chnum = <c:out value="${chnum}"/>
</script>
<title>게시글 작성</title>
</head>
<body>
   <jsp:include page="../include/header.jsp"/>
   <div class="board_write_wrap">
      <div class="board_group">
         <form action="${pageContext.request.contextPath}/info/qnainsert" method="post"
            enctype="multipart/form-data">
			    <select name="QcateId" id="recipeType" class="category_select_from">
			        <option value="">카테고리를 선택하세요</option>
			        <option value="1">홍보, 영리목적</option>
			        <option value="2">불법 정보</option>
			        <option value="3">음란, 청소년 유해</option>
			        <option value="4">욕설, 비방, 차별, 혐오</option>
			        <option value="5">도배, 스팸</option>
			        <option value="6">개인정보 노출, 거래</option>
			        <option value="7">기타</option>
			        <option value="8">공지사항</option>
			    </select>

            <div class="board_subject_wrap">
               <input class="text_from board_subject_from" type=text
                  name=adTitle placeholder="제목을 입력하세요">
            </div>
            <div class="board_content_wrap">
               <div class="editor_group">
                  <textarea name="adContent" id="editor"></textarea>
               </div>
            </div>
             
            <div class="board_file_wrap">
               <div class="thumbNailArea">
               
                  <img class="thumbNailImage" src="${src}" alt="profile">
               </div>
            </div>
            <div class="board_button_wrap">
               <button type="button" class="board_write_button write_cancel">작성취소</button>
               <button type="submit" class="board_write_button">작성완료</button>
            </div>
         </form>
      </div>
   </div>
   <script>
    $(document).ready(function() {
        $(".board_write_button").click(function(e) {
            e.preventDefault();
            $("form").submit();
        });
    });
    
    


    </script>
   <jsp:include page="../include/footer.jsp"/>
</body>
</html>