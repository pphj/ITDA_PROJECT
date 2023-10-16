
	function go(page){						//해당 페이지로 이동시키는 함수
		const limit = $('#viewcount').val();
		
		//const data = `limit=${limit}&state=ajax&page=${page}`; 와 같은 의미
		const data = {limit : limit, state : "ajax", page : page}
		
		ajax(data);							//ajax를 호출, 명칭은 마음대로 설정 가능
		
	}
	
	
	
	function setPaging(href, digit) {		//페이징 링크를 생성시키는 함수
		let active = "";
		let gray = "";
		
		if (href == "") {					//href가 빈 문자열일 경우
			if (isNaN(digit)){				//digit이 숫자가 아닌 경우
				gray = "gray";				//href가 빈 문자열일 경우 + digit이 숫자가 아닌 경우 = 버튼색을 회색으로 바꾼다
			}else {
				active = "active";			//href가 빈 문자열일 경우 + digit이 숫자인경우 = 버튼에 active를 준다
			}
		}//if end
		
		let output = `<li class="page-item ${active}">`;
		
		//let anchor = "<a class='page-link " + gray + "'" + href + ">" + digit + "</a></li>"; 와 같은 의미
		let anchor = `<a class="page-link ${gray}" ${href}>${digit}</a></li>`;
		
		output += anchor;
		return output;
	}
	

		
	
	function ajax(sdata) {
		console.log(sdata)
		//let token = $("meta[name='_csrf']").attr("content");	
		//let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			type : "post",
			data : sdata,
			url	 : "sellerApproveList_ajax",
			dataType : "json",
			cache : false,
			//beforeSend : function(xhr) {
			//	xhr.setRequestHeader(header, token);
			//},
			success : function(data) {
				$("#viewcount").val(data.limit);
				$("thead").find("span").text("총 신청자 수 : " + data.listcount);
				
				if (data.listcount > 0) {
					$("tbody").remove();
					let num = data.listcount - (data.page - 1) * data.limit;
					let output = "<tbody>";
					$(data.sellerApproveList).each(
						function(index, item) {
							output += '<tr><td class="text-center">&nbsp;&nbsp;' + (num--) + '</td>'
							
							output += '<td class="text-center targetUserId"><div>' + item.userId + '</div></td>'
									+ '<td class="text-center"><div>' + item.sellerPhone + '</div></td>'
									+ '<td class="text-center"><div>' + item.sellerEmail + '</div></td>'
									+ '<td class="text-center"><div>' + item.sellerJoinDate.substr(0,10) + '</div></td>'
									+ '<td class="td-actions text-center">'
							        + '<button type="button" rel="tooltip"'
							        + ' class="btn btn-info btn-icon btn-fab sellerUpdate" data-original-title="" title="">'
							        + ' 	<i class="ni ni-circle-08 pt-1"></i>&nbsp;&nbsp;&nbsp;승인'
							        + '</button>&nbsp;'
							        + '<button type="button" rel="tooltip"'
							        + ' class="btn btn-danger btn-icon btn-fab sellerCancel" data-original-title="" title="">'
							        + '		<i class="fa fa-times pt-1"></i>&nbsp;&nbsp;&nbsp;거부'
							        + '</button>'
							        + '</td></tr>'
					})//each end
					output += "</tbody>"
					$('table').append(output);			//table 완성
					
					$(".pagination").empty();			//페이징 처리 영역 내용 제거
					output = "";
					
					let digit = '<i class="fa fa-chevron-left" aria-hidden="true"></i>'
					let href = "";
					
					if (data.page > 1) {											//이전 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page - 1) + ')';		//go function 실행
					}			//현재 페이지가 3인 상태에서 이전 버튼을 누르면 href=javascript:go(2)가 되는 것
					output += setPaging(href, digit);
					
					for (let i = data.startpage; i <= data.endpage; i++) {
						digit = i;
						href = "";
						
						if (i != data.page) {										//현재 페이지가 아닌 페이지 번호들
							href = 'href=javascript:go(' + i + ')';					//go function 실행
						}
						output += setPaging(href, digit);
						
					}//for end
					
					digit = '<i class="fa fa-chevron-right" aria-hidden="true"></i>';
					href = "";
					
					if (data.page < data.maxpage) {									//다음 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page + 1) + ')';		//go function 실행
					}
					output += setPaging(href, digit);
					
					$('.pagination').append(output);
						 
				}
				
			},//success end
			
			error : function(){
				console.log('에러')
			}
			
		})//ajax end
		
	}//ready end
	
	$(document).on("click", ".sellerUpdate", function() {
		let targetUserId = $(this).closest("tr").find(".targetUserId").text();
		let targetAdminId = $('#loginId').text();
	    // 해당 데이터를 폼에 설정
	    $(".selectUserId").val(targetUserId);
	    $(".selectAdminId").val(targetAdminId);
	    $("#sellerApproveForm input[name='approve']").val("Y");
	
	    // 승인 여부를 확인하는 다이얼로그
	    let result = confirm("판매자 가입을 승인하시겠습니까?");
	    
	    if (result) {
	        $("form[name='sellerApproveForm']").submit(); // 폼 제출
	    }
	});// click end
	
	$(document).on("click", ".sellerCancel", function() {
	    let targetUserId = $(this).closest("tr").find(".targetUserId").text();
	    let targetAdminId = $('#loginId').text();
	    
	    $(".selectUserId").val(targetUserId);
	    $(".selectAdminId").val(targetAdminId);
	    $("#sellerCancelForm input[name='approve']").val("N");
	    
	    let result = confirm("판매자 가입을 거부하시겠습니까?");
	    
	    if (result) {
	        $("form[name='sellerCancelForm']").submit();
	    }
	});
	
	$(function(){
		$("#viewcount").change(function(){
			go(1); 									// 보여줄 페이지를 1페이지로 설정한다
		
		})//change end
	});//ready end

	