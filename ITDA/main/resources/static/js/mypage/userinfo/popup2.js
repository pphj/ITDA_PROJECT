



  $(document).keypress(function(e) { 
    if (e.keyCode == 13) e.preventDefault(); 
  });


	
	

function showAddressChangePopUp() {
    displayObj('dimmed'); 
    displayObj('addressChangePopUpLayer');
       document.getElementById("wrap").classList.add("is_fixed");
        resetInternationalCode();
    var popupLayer = document.getElementById("addressChangePopUpLayer");
    popupLayer.style.display = "block";
}

// 팝업 숨김 함수
function hideAddressChangePopUp() {
    displayObj('addressChangePopUpLayer');
    document.getElementById("wrap").classList.remove("is_fixed");
    resetInternationalCode();
    var popupLayer = document.getElementById("addressChangePopUpLayer");
    popupLayer.style.display = "none";
    document.getElementById("dimmed").style.display = "none";
    	  document.getElementById("e_addressNo").className = "";
      document.getElementById("e_addressNo").innerHTML = "";
      document.getElementById("sample6_postcode").value = "";
      document.getElementById("sample6_address").value = "";
      document.getElementById("sample6_detailAddress").value = "";
      document.getElementById("sample6_extraAddress").value = "";
}

// 키워드 변경 함수
function showKeyWordChangePopUp() {
    displayObj('dimmed'); 
    displayObj('keyWordChangePopUpLayer');
       document.getElementById("wrap").classList.add("is_fixed");
        resetInternationalCode();
    var popupLayer = document.getElementById("keyWordChangePopUpLayer");
    popupLayer.style.display = "block";
}

// 팝업 숨김 함수
function hideKeyWordChangePopUp() {
    displayObj('keyWordChangePopUpLayer');
    document.getElementById("wrap").classList.remove("is_fixed");
    resetInternationalCode();
    var popupLayer = document.getElementById("keyWordChangePopUpLayer");
    popupLayer.style.display = "none";
    document.getElementById("dimmed").style.display = "none";
    	  document.getElementById("e_addressNo").className = "";
      document.getElementById("e_addressNo").innerHTML = "";
      document.getElementById("sample6_postcode").value = "";
      document.getElementById("sample6_address").value = "";
      document.getElementById("sample6_detailAddress").value = "";
      document.getElementById("sample6_extraAddress").value = "";
}

