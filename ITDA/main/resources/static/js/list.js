
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
			url	 : "list_ajax",
			dataType : "json",
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				$("#viewcount").val(data.limit);
				$("thead").find("span").text("글 개수 : " + data.listcount);
				
				if (data.listcount > 0) {
					$("tbody").remove();
					let num = data.listcount - (data.page - 1) * data.limit;
					console.log(num)
					let output = "<tbody>";
					$(data.boardlist).each(
						function(index, item) {
							output += '<tr><td>' + (num--) + '</td>'
							const blank_count = item.board_re_lev * 2 + 1;
							let blank = '&nbsp;';
							
							for (let i = 0; i < blank_count; i++){
								blank += '&nbsp;&nbsp;';
							
							}
							
							let img = "";
							if (item.board_re_lev > 0) {
								img = "<img src='${pageContext.request.contextPath}/resources/image/line.gif'>";
								
							}
							
							let subject = item.board_subject;
							if (subject.length >= 20) {
								subject = subject.substr(0, 20) + "...";		//0부터 20개 부분 문자열 추출
							
							}
							
							output += "<td><div>" + blank + img
								    + ' <a href="detail?num=' + item.board_num + '">'
								    + subject.replace(/</g,'&lt;').replace(/>/g,'&gt;')
								    + '</a>[' + item.cnt + ']</div></td>'
								    + '<td><div>' + item.board_name + '</div></td>'
									+ '<td><div>' + item.board_date + '</div></td>'
									+ '<td><div>' + item.board_readcount + '</div></td></tr>'
							
							
					})//each end
					output += "</tbody>"
					$('table').append(output);			//table 완성
					
					$(".pagination").empty();			//페이징 처리 영역 내용 제거
					output = "";
					
					let digit = '이전&nbsp;'
					let href = "";
					
					if (data.page > 1) {				//이전 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page - 1) + ')';		//go function 실행
					}			//현재 페이지가 3인 상태에서 이전 버튼을 누르면 href=javascript:go(2)가 되는 것
					output += setPaging(href, digit);
					
					for (let i = data.startpage; i <= data.endpage; i++) {
						digit = i;
						href = "";
						
						if (i != data.page) {			//현재 페이지가 아닌 페이지 번호들
							href = 'href=javascript:go(' + i + ')';					//go function 실행
						}
						output += setPaging(href, digit);
						
					}//for end
					
					digit = '&nbsp;다음&nbsp;';
					href = "";
					
					if (data.page < data.maxpage) {		//다음 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page + 1) + ')';		//go function 실행
					}
					output += setPaging(href, digit);
					
					$('.pagination').append(output);
						 
				}//data.listcount end
				
			},//success end
			
			error : function(){
				console.log('에러')
			}
			
		})//ajax end
		
	}//ready end
	
	
	
	$(function(){
		
		$("button").click(function(){
			location.href="write";				//버튼 클릭시 write로 이동
		
		})// click end
		
		$("#viewcount").change(function(){
			go(1); 								// 보여줄 페이지를 1페이지로 설정한다
		
		})//change end
		
	});//ready end