<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- <script>
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
					url : contextPath + "/sellerCheck",
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
</script> --%>

   <script>
   $(document).ready(function(){
	    // CSRF 토큰 가져오기
	    var csrfToken = '${_csrf.token}';
	    
	    $("#join_seller").click(function(e){
	        var id = '<%= session.getAttribute("userId") %>';
	        var contextPath = '${pageContext.request.contextPath}';
	        
	        if (id == null) {
	            // 로그인이 필요한 경우 로그인 페이지로 이동
	            location.href = contextPath + "/main/protomain";
	        } else {
	            $.ajax({
	                type: 'POST',
	                url: contextPath + "/seller/sellerCheck",
	                data: { userId: id },
	                // CSRF 토큰 추가
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
	                },
	                success: function(rdata) {
	                    if (rdata === "true") {
	                        alert("이미 판매회원으로 등록된 아이디입니다.");
	                    } else {
	                        // 판매회원 가입 페이지로 이동
	                        location.href = contextPath + "/seller/join";
	                    }
	                },
	                error: function() {
	                    alert("오류가 발생했습니다. 다시 시도해주세요.");
	                }
	            });
	        }
	    });
	});

   </script>

</head>

<body>
    <div class="titleback">
        <div class="inner">
            <div class="banner" style="position: relative;">
                <img class="baimg"
                    src="${pageContext.request.contextPath}/resources/image/common/mainbanner2.png"
                    style="width: 1280px; height: 400px;">
                <a href="#" id="join_seller" 
                   style="position: absolute; top: calc(50% + 1cm); left: 50%; transform: translate(-50%, -50%); padding: 10px 20px; width: 3cm; height: 1cm; white-space:
					nowrap; color:#00c6be;">판매회원 가입하기</a>
            </div>
        </div>
    </div>  
</body>