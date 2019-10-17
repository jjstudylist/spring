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
<script type="text/javascript">

	var oldPw = true;
	var newPw = true;
	var Pw = true;
	
    
	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#loadImg').attr('src', e.target.result);

				imgResult = e.target.result; // byte 형식
			}
			reader.readAsDataURL(value.files[0]);
		}
	}

    
	// 현재 비밀번호 체크
	function checkOldPw() {
		
		// 비밀번호 없을 시 return
		if($("#old_Password").val() == "")
			return;
		
		if("${sessionScope.LoginInfo.password}" != $("#old_Password").val()) {
			$("#checkOldPw").show();
			oldPw = false;
		}
		else {
			$("#checkOldPw").hide();
			oldPw = true;
		}
	}

	// 변경 비밀번호 체크
	function checkNewPw() {

		// 비밀번호 없을 시 return
		if($("#new_Password").val() == "")
			return;
		
		$("#checkNewPw").empty();
		
		if($("#new_Password").val().includes(" ")) {
			$("#checkNewPw").show();
			$("#checkNewPw").append("비밀번호에 공백 문자가 들어갈 수 없습니다.");
			newPw = false;
		}
		else if($("#new_Password").val().length < 6) {

			$("#checkNewPw").show();
			$("#checkNewPw").append("비밀번호 6자리 이상 입력하세요.");
			newPw = false;
		}
		else {
			$("#checkNewPw").hide();
			newPw = true;
		}
	}
	
	// 변경 비밀번호 확인 체크
	function checkPw() {

		// 비밀번호 없을 시 return
		if($("#password").val() == "")
			return;

		$("#checkPw").empty();
		
		if($("#new_Password").val() != $("#password").val()) {
			$("#checkPw").show();
			$("#checkPw").append("비밀번호가 동일하지 않습니다.");
			Pw = false;
		}
		else {
			$("#checkPw").hide();
			Pw = true;
		}
	}
	
	function updateProfile() {

		if(!($("#old_Password").val() == "" && $("#new_Password").val() == "" && $("#password").val() == "")) {
			if(!(oldPw && newPw && Pw)) {
				alert("비밀번호를 확인하세요.");
				return;
			}
		}
		
		var formData = new FormData($("#myForm")[0]);
		
		$.ajax({
            url: 'updateProfile',
            type : "post",
            async : false,
            contentType: false,
            processData: false,
            dataType : "json",
            data:formData,
            success: function() {
                alert('success');
            },
			 error : function() {
				 alert("error");
			 }
        });
	}
</script>
<body>
	<!--header start-->

	<jsp:include page="header.jsp"></jsp:include>
	<!--header end-->

	<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

	<section id="main-content">
		<section class="wrapper site-min-height">
			<div class="profile-pic" align="center">
				<p>
					<img src="${pageContext.request.contextPath}/upload/profile/${sessionScope.LoginInfo.no}.jpg" class="img-circle" id="loadImg" onerror="this.src='resources/img/friends/fr-05.jpg';">

				</p>
				<h3>${sessionScope.LoginInfo.name}</h3>
			</div>

			<div id="edit" class="tab-pane">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2 detailed">
						<h4 class="mb">Personal Information</h4>
						<form role="form" id="myForm" class="form-horizontal" enctype="multipart/form-data" method="post" onsubmit="return false;">
							
							<input type="text" id="no" name="No" class="form-control" style="display:none" value="${sessionScope.LoginInfo.no}">
							
							<div class="form-group">
								<label class="col-lg-2 control-label"> 프로필 이미지</label>
								<div class="col-lg-6">
									<input type="file" id="fileUpload" name="FileUpload" class="file-pos" onchange="LoadImg(this);">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">비밀번호</label>
								<div class="col-lg-6">
									<input type="password" placeholder="현재 비밀번호" id="old_Password" class="form-control" maxlength="50" onblur="checkOldPw()"> 
									<label id="checkOldPw" style="color:red; display:none;">비밀번호를 확인하세요.</label>
									<input type="password" placeholder="변경 비밀번호" id="new_Password" class="form-control" maxlength="50" onblur="checkNewPw()"> 
									<label id="checkNewPw" style="color:red; display:none;"></label>
									<input type="password" placeholder="변경 비밀번호 확인" id="password" name="Password" class="form-control" maxlength="50" onblur="checkPw()">
									<label id="checkPw" style="color:red; display:none;"></label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">생년월일</label>
								<div class="col-md-3 col-xs-11">
									<div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="2018-01-01" class="input-append date dpYears">
										<input type="text" id="birthDate" name="Birth" value="2018-01-01" size="16" class="form-control" readonly /> 
										<span class="input-group-btn add-on">
											<button class="btn btn-theme" type="button">
												<i class="fa fa-calendar"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">이메일</label>
								<div class="col-lg-6">
									<input type="text" placeholder=" " id="email" name="Email" class="form-control" value="${sessionScope.LoginInfo.email}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">휴대전화번호</label>
								<div class="col-lg-6">
									<input type="text" placeholder=" " id="phone" name="Phone" class="form-control" value="${sessionScope.LoginInfo.phone}">
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-2 control-label">주소</label>
								<div class="col-lg-6">
									<input class="form-control " style="width: 71%; display: inline" type="text" id="zipCode" name="ZipCode" placeholder="우편번호" value="${sessionScope.LoginInfo.zipCode}" readOnly /> 
									<input type="button" class="btn btn-theme" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<div style="margin-top: 3px;">
										<input class="form-control " style="display: inline-block" type=text id="Address1" placeholder="주소" value="${sessionScope.LoginInfo.address1}" readOnly> 
										<input class="form-control " style="display: inline-block" type="text" id="Address2" value="${sessionScope.LoginInfo.address2}" placeholder="상세주소">
									</div>
								</div>

							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-theme" type="submit" onclick="updateProfile();">Save</button>
									<button class="btn btn-theme04" type="button">Cancel</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</section>

	<!--footer start-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!--footer end-->
</body>

</html>
