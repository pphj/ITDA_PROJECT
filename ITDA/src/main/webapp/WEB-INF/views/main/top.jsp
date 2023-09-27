<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script>
	$(document).ready(function(){
		$("#join_seller").click(function(e){
			var id = `<%= session.getAttribute("userId") %>`;
			var contextPath = '<%= request.getContextPath() %>';
			
			if (id == 'null') {
				e.preventDefault();
				alert("로그인이 필요합니다.");
				
			}else {
				$.ajax({
					type : 'post',
					url : contextPath + "/sellerCheck.me",
					data : {userId : id},
					success : function (rdata) {
						if (rdata === "true") {
							alert("이미 판매회원으로 등록된 아이디입니다.");
						}else {
							location.href = contextPath + "/sellerjoin.me";
						}
					}
					
				});//ajax end
			}
			
		});//click end
		
	});//ready end
</script>
</head>
<body>
	<div class="titleback">
		<div class="inner">
			<div class="banner">
				<img class="baimg"
				src="resources/image/common/mainbanner2.png"
				style="width: 1280px; height: 400px;">
<!-- 				<div>
					<button type="button" id="join_seller">판매회원 가입하기</button>
				</div> -->
			</div>
		</div>
	</div>
</body>