<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>ITDA 관리자</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chartjs.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/Chart.extension.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  $(function(){
	  	let userTotal = [];
	  	let creDate = [];

	  	// 원하는 개수만큼 반복
	  	for (let i = 1; i <= 10; i++) {
	    	userTotal.push($(".userTotal" + i).text());
	    	creDate.push($(".creDate" + i).text());
	  	}
	  	
	  	userTotal = userTotal.reverse();
	  	creDate = creDate.reverse();
	  	
	    var ctx1 = document.getElementById("chart-line").getContext("2d");

	    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

	    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
	    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
	    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
	    new Chart(ctx1, {
	      type: "line",
	      data: {
	        labels: creDate,
	        datasets: [{
	          label: "총 유저수",
	          tension: 0.4,
	          borderWidth: 0,
	          pointRadius: 0,
	          borderColor: "#5e72e4",
	          backgroundColor: gradientStroke1,
	          borderWidth: 3,
	          fill: true,
	          data: userTotal,
	          maxBarThickness: 6

	        }],
	      },
	      options: {
	        responsive: true,
	        maintainAspectRatio: false,
	        plugins: {
	          legend: {
	            display: false,
	          }
	        },
	        interaction: {
	          intersect: false,
	          mode: 'index',
	        },
	        scales: {
	          y: {
	            grid: {
	              drawBorder: false,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: false,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              padding: 10,
	              color: '#344767',
	              font: {
	                size: 11,
	                family: "Open Sans",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	          x: {
	            grid: {
	              drawBorder: false,
	              display: false,
	              drawOnChartArea: false,
	              drawTicks: false,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              color: '#344767',
	              padding: 20,
	              font: {
	                size: 11,
	                family: "Open Sans",
	                style: 'normal',
	                lineHeight: 2
	              },
	            }
	          },
	        },
	      },
	    });
	    
	  });
  </script>
  <style>
  	.card-item {
  		height: 200px;
		font-size: 40px;
		border-radius: 30px;
		display: flex;
		align-items: center;
		justify-content: center;
  	}
  </style>
</head>
<body class="g-sidenav-show bg-gray-100">
  <jsp:include page="adminList.jsp" />
  <main class="main-content position-relative border-radius-lg ">
  <jsp:include page="adminNavbar.jsp" />
    <!-- End Navbar -->
    <div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                관리자 메인페이지
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="container-fluid py-4">
		<div class="row">
			<div class="row mt-4">
			<div class="col-lg-7 mb-lg-0 mb-4">
				<div class="card z-index-2 h-300">
					<div class="card-header pb-0 pt-3 bg-transparent">
						<h6 class="text-capitalize">일일 총 유저수</h6>
						<p class="text-sm mb-0">
							<i class="ni ni-chart-bar-32 text-success"></i>
							<span class="font-weight-bold">10월</span> in 2023
						</p>
	            	</div>
		            <div class="card-body p-3">
		            	<div class="chart">
		            		<canvas id="chart-line" class="chart-canvas" height="600"></canvas>
		            	</div>
		            </div>
				</div>
	        </div>
	        <div class="col-lg-5">
	          <div class="card overflow-hidden h-100 p-0 d-flex flex-column">
				<div class="card-item text-center" style="background: #F9F871;
				 margin-bottom: 10px; margin-top: 40px;">
					<i class="fa fa-question" aria-hidden="true"></i>&nbsp;&nbsp;신규 QNA 등록 : ${qnaDailyCount}
				</div>
				<div class="card-item text-center" style="background: #C8F37D; margin-bottom: 10px;">
					<i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;신규 판매회원 신청 : ${sellerDailyCount}
				</div>
				<div class="card-item text-center" style="background: #99EB8F;">
					<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;&nbsp;신규 신고 수 : ${problemDailyCount}
				</div>
	          </div>
			</div>
			</div>
		</div>
		<div style="display: none;">
			<table>
				<tbody>
				<c:forEach var="u" items="${userTotalData}" varStatus="loop">
					<tr>
						<td class="userTotal${loop.index + 1}">${u.userTotal}</td>
						<c:choose>
						    <c:when test="${not empty u.creDate}">
						        <c:set var="Date" value="${fn:substring(u.creDate, 0, 10)}" />
						        <td class="creDate${loop.index + 1}"><div><c:out value="${Date}" /></div></td>
						    </c:when>
						</c:choose>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  </main>
</body>
</html>