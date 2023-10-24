
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
		let token = $("meta[name='_csrf']").attr("content");	
		let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			type : "post",
			data : sdata,
			url	 : "problemList_ajax",
			dataType : "json",
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				$("#viewcount").val(data.limit);
				$("thead").find("span").text("총 신고 수 : " + data.sumListCount);
				
				if (data.listcount > 0) {
					$("tbody").remove();
					let num = data.listcount - (data.page - 1) * data.limit;
					let output = "<tbody>";
					$(data.problemList).each(
						function(index, item) {
							output += '<tr><td class="text-center">' + (num--) + '</td>'
							
							let status = "";
							switch (item.statusid) {
								case 1:
									status = "정상";
									break;
								case 2:
									status = "일시 정지";
									break;
								case 3:
									status = "정지";
									break;
								default:
									status = "출력 오류";
							}
							
							output += '<td class="text-center targetSickId" style="color: #1294FA; font-weight: bold;"><div>' + item.sickId + '</div></td>'
									+ '<td class="text-center" style="color: red; font-weight: bold;"><div>' + item.sumCount + '</div></td>'
									+ '<td class="text-center" style="color: #38CFD5; font-weight: bold;"><div>' + status + '</div></td>'
									+ '<td class="td-actions text-center">'
							        + '<button type="button" rel="tooltip"'
									+ ' class="btn btn-secondary btn-icon btn-sm Pause" data-original-title="" title="">'
							        + ' 	<i class="fa fa-pause pt-1"></i>&nbsp;&nbsp;&nbsp;일시정지'
							        + '</button>&nbsp;'
							        + '<button type="button" rel="tooltip"'
									+ ' class="btn btn-danger btn-icon btn-sm Stop" data-original-title="" title="">'
							        + ' 	<i class="fa fa-ban pt-1"></i>&nbsp;&nbsp;&nbsp;정지'
							        + '</button>&nbsp;'
							        + '<button type="button" rel="tooltip"'
									+ ' class="btn btn-success btn-icon btn-sm Clear" data-original-title="" title="">'
							        + ' 	<i class="fa fa-heart pt-1"></i>&nbsp;&nbsp;&nbsp;해제'
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
	
	$(document).on("click", ".Pause", function() {
	    // 현재 클릭한 버튼이 속한 행에서 필요한 데이터를 가져옴
	    let targetSickId = $(this).closest("tr").find(".targetSickId div").text();
    	$(".selectUserId").val(targetSickId);
    	$("#problemPauseForm input[name='approve']").val("2");
    		
    	let result = confirm("회원상태를 일시정지 하겠습니까?");
		    
		if (result) {
			$("form[name='problemPauseForm']").submit();
		}
	});

	$(document).on("click", ".Stop", function() {
	    let targetSickId = $(this).closest("tr").find(".targetSickId div").text().trim();
    	$(".selectUserId").val(targetSickId);
    	$("#problemStopForm input[name='approve']").val("3");
    		
    	let result = confirm("회원상태를 정지 하겠습니까?");
		    
		if (result) {
			$("form[name='problemStopForm']").submit();
		}
	});

	$(document).on("click", ".Clear", function() {
	    let targetSickId = $(this).closest("tr").find(".targetSickId div").text().trim();
    	$(".selectUserId").val(targetSickId);
    	$("#problemClearForm input[name='approve']").val("1");
    		
    	let result = confirm("상태를 되돌리겠습니까?");
		    
		if (result) {
			$("form[name='problemClearForm']").submit();
		}
	});
	
	$(function(){
		$("#viewcount").change(function(){
			go(1); 									// 보여줄 페이지를 1페이지로 설정한다
		
		})//change end
		
		
	});//ready end

	