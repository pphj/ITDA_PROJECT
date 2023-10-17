	$(function(){
		let check = 0;
		
		$("form[name=modifyform]").submit(function(){					//submit버튼 클릭시 이벤트
			if($.trim($("#board_subject").val()) == ""){
				alert("제목을 입력하세요.");
				$("#board_subject").focus();
				return false;
			}
			
			if($.trim($("#board_content").val()) == ""){
				alert("내용을 입력하세요.");
				$("#board_content").focus();
				return false;
			}
			
			if($.trim($("#board_pass").val()) == ""){
				alert("비밀번호를 입력하세요.");
				$("#board_pass").focus();
				return false;
			}
			
			if (check == 0) {
				const value = $('#filevalue').text();
				const html = "<input type='hidden' value='" + value + "'name='check'>";
				$(this).append(html);
				
			}
			
			
		})//submit end
		
		
		function show(){
			if ($('#filevalue').text() == '') {					//파일 이름이 없는 경우
				$(".remove").css({'display': 'none'});			//remove 이미지를 보이지 않게
			
			}else {												//파일 이름이 있는 경우
				$(".remove").css({'display' : 'inline-block',	//remove 이미지를 보이게
								  'position' : 'relative',
								  'top': '-5px'
								  });
			
			}
			
			
		}//show end
		
		show();  				//show 호출
		
		
		
		$(".remove").click(function(){		//remove 이미지를 클릭하면 파일명을 ''로 변경하고 remove 이미지를 보이지 않게 한다
			$('#filevalue').text('');
			$(this).css('display', 'none');
			$('#upfile').val();				//파일을 선택하고 remove를 클릭하면 <input type=file>의 값도 빈문자열로 만든다
		})//click end
		
		
		
		$('#upfile').change(function(){		//첨부파일 변경시 이벤트
			check++;
			const inputfile = $(this).val().split('\\');
			
			$('#filevalue').text(inputfile[inputfile.length - 1]);
			show();
			
		})//change end
		
		
		
	});//ready end