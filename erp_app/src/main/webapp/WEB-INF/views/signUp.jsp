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
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap-daterangepicker/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap-timepicker/compiled/timepicker.css" />
<!-- Custom styles for this template -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	var check = false;

	function id_check() {

		var id = $("#id").val();

		if (id == "" || id == null) {
			alert("아이디를 입력해주세요");
			return;
		}

		$.ajax({
			url : "ex/idCheck",
			type : "post",
			async : false,
			data : id,
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if (!data.result) {
					alert("이미 있는 아이디 입니다.");
					return;
				} else {
					alert("사용가능한 아이디 입니다.");
					check = true;
					return;
				}
			},
			error : function() {
				alert("error");
			}

		});

	}

	function join() {

		//- 유효성 체크
		if (!check) {
			alert("아이디 중복체크를 해주세요");
			return;
		}

		var pw1 = $("#password").val();
		var pw2 = $("#confirm_password").val();
		if (pw1 != pw2) {
			alert("입력한 두 비빌번호가 다릅니다");
			return;
		}

		$.ajax({
			url : "ex/RegisterMember",
			type : "post",
			async : false,
			data : {
				"Id" : $("#id").val(),
				"Password" : $("#confirm_password").val(),
				"Name" : $("#username").val(),
				"Email" : $("#email").val(),
				"Phone" : $("#phone").val(),
				"Birth" : $("#birthDate").val(),
				"ZipCode" : $("#zipCode").val(),
				"Address1" : $("#address1").val(),
				"Address2" : $("#address2").val(),
				"Gender" : $('input[name="gender"]:checked').val(),

			},
			dataType : "json",
			success : function(data) {
				if (data.result) {
					alert("회원가입 되었습니다.");
					window.signupForm.submit();
				}
			},
			error : function() {
				alert("error");
			}

		});

	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('zipCode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').focus();
					}
				}).open();
	}
</script>



</head>

<body>


	<!--sidebar end-->

	<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<section class="wrapper" style="margin-top: 0px;">
		<h3>
			<i class="fa fa-angle-right"></i> 회원가입
		</h3>
		<!-- BASIC FORM VALIDATION -->
		<!-- /row -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<div class="form">
						<form class="cmxform form-horizontal style-form" id="signupForm" onsubmit="return false;" method="post" action="/">
							<div class="form-group ">
								<label for="id" class="control-label col-lg-2">아이디</label>
								<div class="col-lg-10">
									<input class=" form-control" style="width: 30%; display: inline" id="id" name="id" type="text"> <input type="button" class="btn btn-theme04" onclick="id_check();" value="중복확인">
								</div>
							</div>
							<div class="form-group " style="">
								<label for="password" class="control-label col-lg-2">비밀번호</label>
								<div class="col-lg-10">
									<input class="form-control " style="width: 30%;" id="password" name="password" type="password">
								</div>
							</div>
							<div class="form-group " style="">
								<label for="confirm_password" class="control-label col-lg-2">비밀번호 재입력</label>
								<div class="col-lg-10">
									<input class="form-control " style="width: 30%;" id="confirm_password" name="confirm_password" type="password">
								</div>
							</div>
							<div class="form-group ">
								<label for="username" class="control-label col-lg-2">이름</label>
								<div class="col-lg-10">
									<input class="form-control " style="width: 30%;" id="username" name="username" type="text">
								</div>
							</div>

							<div class="form-group ">
								<label for="email" class="control-label col-lg-2">이메일</label>
								<div class="col-lg-10">
									<input class="form-control " style="width: 30%;" id="email" name="email" type="email">
								</div>
							</div>

							<div class="form-group ">
								<label for="phone" class="control-label col-lg-2">휴대전화번호</label>
								<div class="col-lg-10">
									<input class="form-control " style="width: 30%;" id="phone" name="phone" type="text" placeholder="010-0000-0000">
								</div>
							</div>

							<div class="form-group" class="col-lg-12">
								<label for="birthDate" class="control-label col-lg-2">생년월일</label>
								<div class="col-md-3 col-xs-11">
									<div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="2018-01-01" class="input-append date dpYears">
										<input type="text" id="birthDate" value="2018-01-01" size="16" class="form-control" readonly /> <span class="input-group-btn add-on">
											<button class="btn btn-theme" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
							</div>

							<div class="form-group ">
								<label for="gender" class="control-label col-lg-2 col-sm-3">성별</label>
								<div class="col-lg-10 col-sm-9">
									<input type="radio" name="gender" value="M" /> 남자 <input type="radio" name="gender" value="F" checked="checked" /> 여자
								</div>
							</div>

							<div class="form-group">
								<label for="addr" class="control-label col-lg-2 col-sm-3">주소</label> 
								<input class="form-control " style="width: 20%; display: inline" type="text" id="zipCode" placeholder="우편번호" readOnly /> 
								<input type="button" class="btn btn-theme" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
								<label for="addr" class="control-label col-lg-2 col-sm-3"></label>
								<div style="margin-top: 3px;">
									<input class="form-control " style="width: 25%; display: inline-block" type="text" id="address1" placeholder="주소" readOnly> 
									<input class="form-control " style="width: 25%; display: inline-block" type="text" id="address2" placeholder="상세주소">
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-theme" type="submit" onclick="join();">가입</button>
									<button class="btn btn-theme04" type="button" onclick="location.href='/'">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /form-panel -->
			</div>
			<!-- /col-lg-12 -->
		</div>
		<!-- /row -->
	</section>
	<!--main content end-->

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="resources/lib/jquery/jquery.min.js"></script>
	<script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
	<script src="resources/lib/jquery.scrollTo.min.js"></script>
	<script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
	<!--common script for all pages-->
	<script src="resources/lib/common-scripts.js"></script>
	<!--script for this page-->
	<script src="resources/lib/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="resources/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="resources/lib/advanced-form-components.js"></script>

</body>

</html>

