
	function go(page, goURL){						//해당 페이지로 이동시키는 함수
		const limit = $('#viewcount').val();
		
		//const data = `limit=${limit}&state=ajax&page=${page}`; 와 같은 의미
		const data = {limit : limit, state : "ajax", page : page}
		
		ajax(data, goURL);							//ajax를 호출, 명칭은 마음대로 설정 가능
		
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
	

		
	
	function ajax(sdata, goURL) {
		console.log(sdata)

		//let token = $("meta[name='_csrf']").attr("content");	
		//let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			type : "post",
			data : sdata,
			url	 : goURL,
			dataType : "json",
			cache : false,
			//beforeSend : function(xhr) {
			//	xhr.setRequestHeader(header, token);
			//},
			success : function(data) {
				$("#viewcount").val(data.limit);
				$("thead").find("span").text("글 개수 : " + data.listcount);
				
				if (data.listcount > 0) {
					$("tbody").remove();
					let num = data.listcount - (data.page - 1) * data.limit;
					console.log(num)
					let output = "<tbody>";
					$(data.List).each(
						function(index, item) {
							output += '<tr class="text-center"><td>' + (num--) + '</td>'

							let adTitle = item.adTitle;
							if (adTitle.length >= 20) {
								adTitle = adTitle.substr(0, 20) + "...";		//0부터 20개 부분 문자열 추출
							
							}
							
							let qacategory = "";
							switch (item.qcateId) {
								case 1:
									qacategory = "홍보, 영리목적";
									break;
								case 2:
									qacategory = "불법 정보";
									break;
								case 3:
									qacategory = "음란, 청소년 유해";
									break;
								case 4:
									qacategory = "욕설, 비방, 차별, 혐오";
									break;
								case 5:
									qacategory = "도배, 스팸";
									break;
								case 6:
									qacategory = "개인정보 노출, 거래";
									break;
								case 7:
									qacategory = "기타";4
									break;
								default:
									qacategory = "출력 오류";
							}
							
							if (item.userId === 'system') {
								output += "<td class='text-center'><div>"
										+ ' <a href="FAQ/' + item.adNum + '">'
										+ adTitle.replace(/</g,'&lt;').replace(/>/g,'&gt;')
										+ '<td class="text-left"><div>' + qacategory + '</div></td>'
										+ '<td class="text-center"><div>' + item.adWriter + '</div></td>'
										+ '<td class="text-left"><div>' + item.adDate.substr(0,10) + '</div></td></tr>'
							}
							
							if (item.userId !== 'system') {
								output += "<td class='text-center'><div>"
								   		+ ' <a href="QNA/' + item.adNum + '">'
								   	 	+ adTitle.replace(/</g,'&lt;').replace(/>/g,'&gt;')
										+ '<td class="text-left"><div>' + qacategory + '</div></td>'
										+ '<td class="text-center"><div>' + item.userId + '</div></td>'
										+ '<td class="text-left"><div>' + item.adDate.substr(0,10) + '</div></td></tr>'
							}
							
					})//each end
					output += "</tbody>"
					$('table').append(output);			//table 완성
					
					$(".pagination").empty();			//페이징 처리 영역 내용 제거
					output = "";
					
					let digit = '<i class="fa fa-chevron-left" aria-hidden="true"></i>'
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
					
					digit = '<i class="fa fa-chevron-right" aria-hidden="true"></i>';
					href = "";
					
					if (data.page < data.maxpage) {		//다음 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page + 1) + ')';		//go function 실행
					}
					output += setPaging(href, digit);
					
					$('.pagination').append(output);
						 
				}else if (data.listcount = 1) {
					$(".pagination").empty();
					$('table').empty();
					let output = '등록된 질문이 없습니다.';
					$('table').append(output);
				}
				
			},//success end
			
			error : function(){
				console.log('에러')
			}
			
		})//ajax end
		
	}//ready end
	
	
	
	$(function(){
		$("#FAQ").addClass("button-active");
		$("#tabUser").hide();
	
		$("#FAQ").on("click", function() {		// FAQ 버튼 클릭 시
			goURL = "FAQList_ajax";
			
			$("#FAQ").addClass("button-active");
			$("#QNA").removeClass("button-active");
			$("#tabHead").text("FAQ");
			$("#tabUser").hide();
			$("#tabWriter").show();
			$("#faqwbtn").show();
			go(1, goURL);
		});

		$("#QNA").on("click", function() {		// Q&A 버튼 클릭 시
			goURL = "QNAList_ajax";
			
			$("#QNA").addClass("button-active");
			$("#FAQ").removeClass("button-active");
			$("#tabHead").text("QNA");
			$("#tabUser").show();
			$("#tabWriter").hide();
			$("#faqwbtn").hide();
			go(1, goURL);
		});
		
		$("#faqwbtn").click(function(){
			location.href="faq_Write";			//버튼 클릭시 write로 이동
		
		})// click end
		
		$("#viewcount").change(function(){
			go(1, "FAQList_ajax"); 					// 보여줄 페이지를 1페이지로 설정한다
		
		})//change end
		
	});//ready end