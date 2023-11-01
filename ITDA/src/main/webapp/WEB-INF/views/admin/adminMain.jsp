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
	  let userTotalData = ${userTotalData};
	    console.log(userTotalData);
	    console.log(userTotalData[0].creDate);
	    let userTotal = [];
	    let creDate = [];
		
	    for (let i = 0; i < 10; i++) {
	    	  userTotal.push(userTotalData[i].userTotal);
	    	  let timestamp = userTotalData[i].creDate;
	    	  let date = new Date(timestamp);
	    	  let formattedDate = date.toISOString().split('T')[0]; // "yyyy-MM-dd" 형식으로 변환
	    	  creDate.push(formattedDate);
	    	}
	  	
	  	userTotal = userTotal.reverse();
	  	creDate = creDate.reverse();
	  	
	    var ctx1 = document.getElementById("chart-line").getContext("2d");
	    var ctx2 = document.getElementById("chart-line2").getContext("2d");

	    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

	    gradientStroke1.addColorStop(1, 'rgba(255, 199, 97, 0.6)');
	    gradientStroke1.addColorStop(0.5, 'rgba(255, 199, 97, 0.4)');
	    gradientStroke1.addColorStop(0.2, 'rgba(255, 199, 97, 0.2)');
	    
	    new Chart(ctx1, {
	      type: "line",
	      data: {
	        labels: creDate,
	        datasets: [{
	          label: "총 유저수",
	          tension: 0.2,
	          borderWidth: 0,
	          pointRadius: 1,
	          borderColor: "#6BFBCE",
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
	        	max: 300,
	            grid: {
	              drawBorder: true,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: true,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              padding: 5,
	              color: '#464555',
	              font: {
	                size: 14,
	                family: "Open Sans",
	                style: 'normal',
	                lineHeight: 1
	              },
	            }
	          },
	          x: {
	            grid: {
	              drawBorder: true,
	              display: true,
	              drawOnChartArea: true,
	              drawTicks: true,
	              borderDash: [5, 5]
	            },
	            ticks: {
	              display: true,
	              color: '#464555',
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
	    });	//Chart end
  
	  let totalSalesData = ${totalSalesData};
	  console.log(totalSalesData);
	  console.log(totalSalesData[0].creDate);
	  let salesTotal = [];
	  let creDate2 = [];
		
	  for (let i = 0; i < 10; i++) {
	    	  salesTotal.push(totalSalesData[i].salesTotal);
	    	  let timestamp = totalSalesData[i].creDate;
	    	  let date = new Date(timestamp);
	    	  let formattedDate = date.toISOString().split('T')[0]; // "yyyy-MM-dd" 형식으로 변환
	    	  creDate2.push(formattedDate);
	  }
	  	
	  salesTotal = salesTotal.reverse();
	  creDate2 = creDate2.reverse();
	  
  	  var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
  	  
	  gradientStroke2.addColorStop(1, 'rgba(255, 199, 97, 0.6)');
	  gradientStroke2.addColorStop(0.5, 'rgba(255, 199, 97, 0.4)');
	  gradientStroke2.addColorStop(0.2, 'rgba(255, 199, 97, 0.2)');
	  
	  new Chart(ctx2, {
	    type: "line",
	    data: {
	      labels: creDate2,
	      datasets: [{
	        label: "일일 매출",
	        tension: 0.2,
	        borderWidth: 0,
	        pointRadius: 1,
	        borderColor: "#6BFBCE",
	        backgroundColor: gradientStroke2,
	        borderWidth: 3,
	        fill: true,
	        data: salesTotal,
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
	      	max: 4000000,
	          grid: {
	            drawBorder: true,
	            display: true,
	            drawOnChartArea: true,
	            drawTicks: true,
	            borderDash: [5, 5]
	          },
	          ticks: {
	            display: true,
	            padding: 5,
	            color: '#464555',
	            font: {
	              size: 14,
	              family: "Open Sans",
	              style: 'normal',
	              lineHeight: 1
	            },
	          }
	        },
	        x: {
	          grid: {
	            drawBorder: true,
	            display: true,
	            drawOnChartArea: true,
	            drawTicks: true,
	            borderDash: [5, 5]
	          },
	          ticks: {
	            display: true,
	            color: '#464555',
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
	  });//Chart end
	  
	});//Ready end
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
							<span class="font-weight-bold">11월</span> in 2023
						</p>	            	
			            <div class="card-body p-3">
			            	<div class="chart">
			            		<canvas id="chart-line" class="chart-canvas" height="300"></canvas>
			            	</div>
			            </div>
		            </div>
		            <div class="card-header pb-0 pt-3 bg-transparent">
						<h6 class="text-capitalize">일일 총 매출</h6>
						<p class="text-sm mb-0">
							<i class="ni ni-chart-bar-32 text-success"></i>
							<span class="font-weight-bold">11월</span> in 2023
						</p>	            	
			            <div class="card-body p-3">
			            	 <div class="chart">
			            		<canvas id="chart-line2" class="chart-canvas" height="300"></canvas>
			            	</div>
			            </div>
		            </div>
				</div>
	        </div>
	       
	        <div class="col-lg-5">
	          <div class="card overflow-hidden h-100 p-0 d-flex flex-column" style="background: #f0f0f0; justify-content: space-between;">
				<div class="card-item text-center" style="background: #49D7B9;
				 margin-bottom: 50px; margin-top: -7px; color: white;">
					<i class="fa fa-question" aria-hidden="true"></i>&nbsp;&nbsp;신규 QNA 등록 : 
					<a href="${pageContext.request.contextPath}/admin/FAQ">&nbsp;${qnaDailyCount}</a>
				</div>
				<div class="card-item text-center" style="background: #76E7B1; margin-bottom: 50px; color: white;">
					<i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;신규 판매회원 신청 : 
					<a href="${pageContext.request.contextPath}/admin/sellerApprove">&nbsp;${sellerDailyCount}</a>
				</div>
				<div class="card-item text-center" style="background: #A2F6A8; color: white;">
					<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;&nbsp;신규 신고 수 : 
					<a href="${pageContext.request.contextPath}/admin/problem">&nbsp;${problemDailyCount}</a>
				</div>
	          </div>
			</div>
			</div>
		</div>
	</div>
  </main>
</body>
</html>