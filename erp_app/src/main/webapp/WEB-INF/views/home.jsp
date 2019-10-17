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
<!-- Custom styles for this template -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet">


<!-- js placed at the end of the document so the pages load faster -->
<script src="resources/lib/jquery/jquery.min.js"></script>
<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="resources/lib/jquery.backstretch.min.js"></script>
<!--네이버 로그인-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$.backstretch("img/login-bg.jpg", {
		speed : 500
	});

	function check() {

		$("#chkLogin").empty();

		if ($("#id").val() == "") {
			$("#chkLogin").append("User ID를 입력해주세요.");
			return;
		}
		if ($("#password").val() == "") {
			$("#chkLogin").append("Password를 입력해주세요.");
			return;
		}

		$.ajax({
			url : "login",
			type : "POST",
			async : false,
			data : {
				"id" : $("#id").val(),
				"password" : $("#password").val(),
			},
			dataType : "json",
			success : function(data) {

				var val = data.result;

				if (val == null || val == "") {
					window.frm.submit();
				} else {
					$("#chkLogin").append(val);
					return;
				}

			},
			error : function() {
				alert("error");
			}

		});
	}

	function findInfo() {

		if ($("#userId").val() == "") {
			alert("User ID를 입력하세요.");
			return;
		}
		if ($("#email").val() == "") {
			alert("Email을 입력하세요.");
			return;
		}

		$.ajax({
			url : "ex/findUserInfo",
			type : "POST",
			async : false,
			data : {
				"id" : $("#userId").val(),
				"email" : $("#email").val(),
			},
			dataType : "json",
			success : function(data) {

				if (!data.result) {
					alert("일치하는 계정이 없습니다.");
					return;
				} else {
					alert("임시 비밀번호가 입력하신 Email로 발송되었습니다.");
					$('#myModal').modal('hide');
					return;
				}

			},
			error : function() {
				alert("error");
			}

		});
	}

	function initUserInfo() {
		$("#userId").val('');
		$("#email").val('');
	}
</script>

</head>

<body>
	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
	<div id="login-page">
		<div class="container">
			<form class="form-login" name="frm" onsubmit="return false;" method="post" action="/main">
				<h2 class="form-login-heading">sign in now</h2>
				<div class="login-wrap">
					<input type="text" id="id" class="form-control" placeholder="User ID" autofocus> <br> <input type="password" id="password" class="form-control" placeholder="Password"> <br>	
					<div id="chkLogin" style="text-align: center; color: red;"></div>
					<label class="checkbox"> <span class="pull-right"> <a data-toggle="modal" href="#myModal"> Forgot Password?</a>
					</span>
					</label>
					<button class="btn btn-theme btn-block" type="submit" onclick="check();">
						<i class="fa fa-lock"></i> SIGN IN
					</button>
					<hr>
					 <div id="naver_id_login"></div>
					<div class="login-social-link centered"></div>
					<div class="registration">
						Don't have an account yet?<br /> <a class="" href="/signUp"> Create an account </a>
					</div>
				</div>

				<!-- Modal -->
				<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="initUserInfo();">&times;</button>
								<h4 class="modal-title">Forgot Password ?</h4>
							</div>
							<div class="modal-body">
								<p>Enter your e-mail address below to reset your password.</p>
								<input type="text" id="userId" name="userId" placeholder="User ID" autocomplete="off" class="form-control placeholder-no-fix"> <br> <input type="text" id="email" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
							</div>
							<div class="modal-footer">
								<button data-dismiss="modal" class="btn btn-default" type="button" onclick="initUserInfo();">Cancel</button>
								<button class="btn btn-theme" onsubmit="return false;" onclick="findInfo();">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<!-- modal -->
			</form>
		</div>
	</div>
	
 <script type="text/javascript">
  	var naver_id_login = new naver_id_login("fGvqQeu3TXCKjACImfsx", "http://localhost:8080/navercallback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
  </script>
</body>

</html>
