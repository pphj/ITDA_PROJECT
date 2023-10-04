<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/argon-dashboard.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/datetimepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap-datepicker.min.js"></script>
  <meta name="_csrf" content="${_csrf.token}">
  <meta name="_csrf_header" content="${_csrf.headerName}">
<script>
const result="${result}";

$(function(){
	$("#adminlogin").click(function(){
		$("#adminmodal").modal("show");
	})
})

$(function(){
		$("#logout").click(function(e){
			e.preventDefault();
			$("form[name=logout]").submit();
		})
	})
</script>
</head>
<body class="g-sidenav-show   bg-gray-100">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="검색어를 입력하세요">
            </div>
          </div>
          <ul class="navbar-nav justify-content-end">
         	 <sec:authorize access="isAnonymous()">
	            <li class="nav-item d-flex align-items-center">
            	<!-- modal start -->
                <div class="col-md-5">
		          <button type="button" class="btn btn-sm" id="adminlogin"
		           data-toggle="modal" data-target="#adminmodal" style="margin-top: 15px;">
            	  <i class="fa fa-user me-sm-3">&nbsp;&nbsp;Login</i></button>
		          <div class="modal fade" id="adminmodal" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
		            <div class="modal-dialog modal-dialog-centered modal" role="document">
		              <div class="modal-content">
		                <div class="modal-body p-0">
		                  <div class="card bg-secondary shadow border-0 mb-0">
		                    <div class="card-header bg-white pb-3">
		                      <div class="text-muted text-center mb-1">
		                        <span>관리자 로그인</span>
		                      </div>
		                    </div>
		                    <div class="card-body px-lg-5 py-lg-5">
		                      <form role="form" action="${pageContext.request.contextPath}/adMember/loginProcess"
		                       method="post" name="adLoginForm">
		                        <div class="form-group mb-3">
		                          <div class="input-group input-group-alternative">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text" style="width: 40px; height: 41px;
		                               border-radius: 10px 0px 0px 10px;">
		                              <i class="ni ni-circle-08"></i></span>
		                            </div>
		                            <input class="form-control" placeholder="Id" type="text"
		                             name="adminId" id="adminId" style="outline: none !important;">
		                          </div>
		                        </div>
		                        <div class="form-group">
		                          <div class="input-group input-group-alternative">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text" style="width: 40px; height: 40px;
		                               border-radius: 10px 0px 0px 10px;">
		                              <i class="ni ni-lock-circle-open"></i></span>
		                            </div>
		                            <input class="form-control" placeholder="  Password" type="password"
		                             name="adminPw" id="adminPw" style="outline: none !important;">
		                          </div>
		                        </div>
		                        <div class="form-group">
		                        	<label>
										<input type="checkbox" name="remember-me"
										 style="margin-bottom: 15px;"> 로그인 유지하기
									</label>
		                        </div>
		                        <div class="text-center">
		                          <button type='submit' class="btn btn-primary my-4">로그인</button>
		                        </div>
		                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                      </form>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		      	</div><!-- modal end -->
	            </li>
	         </sec:authorize>
	         <sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="pinfo" />
				<form action="${pageContext.request.contextPath}/adMember/logout" method="post" style="margin-bottom: 0px;" name="logout">
					<a class="nav-link" href="#" id="logout">
						<span id="loginId">${pinfo.username}</span>님(로그아웃)
					</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			 </sec:authorize>
	         <li class="nav-item px-3 d-flex align-items-center">
	            <a href="javascript:;" class="nav-link text-white p-0">
	               <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
	            </a>
	         </li>
          </ul>
        </div>
      </div>
    </nav>
</body>
</html>