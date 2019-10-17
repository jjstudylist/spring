<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Sod Tour ::</title>

<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
<!-- Custom styles for this template -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet">
<script src="resources/lib/chart-master/Chart.js"></script>

</head>

<section id="container">
	<!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right"></div>
		</div>
		<!--logo start-->
		<a href="/main" class="logo"><b>Sod<span> Tour</span></b></a>
		<!--logo end-->
		<div class="top-menu">
			<ul class="nav pull-right top-menu">
				<li><a class="logout" href="/logout">Logout</a></li>
			</ul>
		</div>
	</header>
	<!--header end-->
	<!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
	<!--sidebar start-->
	<aside>
		<div id="sidebar" class="nav-collapse ">
			<!-- sidebar menu start-->
			<ul class="sidebar-menu" id="nav-accordion">
				<p class="centered">
					<a href="/profile">
						<img src="${pageContext.request.contextPath}/upload/profile/${sessionScope.LoginInfo.no}.jpg" class="img-circle" height="80" width="80" style="object-fit: cover;" onerror="this.src='resources/img/friends/fr-05.jpg';">

					</a>
				</p>
				<h5 class="centered">${sessionScope.LoginInfo.name}</h5>
				<li class="mt"><a href="/tour"> <i class="fa fa-plane"></i> <span>여행상품</span>
				</a></li>
				<li class="sub-menu"><a href="/review"> <i class="fa fa-pencil-square-o"></i> <span>여행후기</span>
				</a></li>
				<li class="sub-menu"><a href="/community"> <i class="fa fa-comments-o"></i> <span>커뮤니티</span>
				</a></li>
				<li class="sub-menu"><a href="javascript:;"> <i class="fa fa-desktop"></i> <span>고객센터</span>
				</a>
					<ul class="sub">
						<li><a href="/notice">공지사항</a></li>
						<li><a href="/fnq">자주하는질문</a></li>
						<li><a href="/qna">문의하기</a></li>
					</ul></li>
				
			</ul>
			<!-- sidebar menu end-->
		</div>
	</aside>
	<!--sidebar end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="resources/lib/jquery/jquery.min.js"></script>

<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="resources/lib/jquery.scrollTo.min.js"></script>
<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="resources/lib/jquery.sparkline.js"></script>
<!--common script for all pages-->
<script src="resources/lib/common-scripts.js"></script>
<script type="text/javascript" src="resources/lib/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="resources/lib/gritter-conf.js"></script>
<!--script for this page-->
<script src="resources/lib/sparkline-chart.js"></script>
<script src="resources/lib/zabuto_calendar.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<script type="application/javascript">
	
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
      
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  
</script>