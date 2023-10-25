	$(function(){
	  	 $("#fm").submit(function(event) {
			console.log($("._AGREEMENT:checked").length)
		    if ($("._AGREEMENT:checked").length < 4) {
		      // 필수 항목이 선택되지 않았을 때 경고창을 표시하고 제출을 막습니다.
		      alert("필수 항목을 체크해 주세요.");
		      return false;
		    }
	  
	    event.preventDefault(); // 제출을 막습니다.
	  	var productName = $("input[name='productName']").val();
	  	var productId = $("input[name='productId']").val();
	    //var discountPrice = $("#discountPrice").val(); 
	    var productPrice = $("input[name='productPrice']").val();
	    var totalProductPrice = productPrice;
	    var totalPayPrice = productPrice;

	    // totalPayPrice와 totalProductPrice를 각각의 input 필드에 설정
	    $("input[name='totalProductPrice']").val(totalProductPrice);
	    $("input[name='totalPayPrice']").val(totalPayPrice);

//	    let token = $("meta[name='_csrf']").attr("content");  
//	    let header = $("meta[name='_csrf_header']").attr("content");
	    $.ajax({
	      url: '/itda/product/subscriptions/info/order/kakaoPay.do',
//	      type: 'POST', // HTTP 요청 메서드를 POST로 지정
	      dataType: 'json',
	      cache: false,
//	      beforeSend: function(xhr) {
//	        xhr.setRequestHeader(header, token);
//	      },
	      data: {
	      	productId : productId,
	      	item_name : productName,
	        total_amount: totalPayPrice,
	        sumPrice: totalProductPrice,
	        totalPrice: totalPayPrice
	      },
	      success: function(data) {
	        var paybox = data.next_redirect_pc_url;
//	        alert(data.tid);
	        window.open(paybox);
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	        alert("에러발생");
	      }
	    }); // ajax
	  }); // form
	});