<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form id="frm" action="/naverInfo" method="POST">
		<input type="hidden" id="name" name="name"/>
		<input type="hidden" id="email" name="email"/>
	</form>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("fGvqQeu3TXCKjACImfsx", "http://localhost:8080/navercallback");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	var email=naver_id_login.getProfileData('email');	
	var name=naver_id_login.getProfileData('name');
	document.getElementById("email").value=email;
	document.getElementById("name").value=name;
	document.getElementById("frm").submit();
/*     alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('name'));
    alert(naver_id_login.getProfileData('age'));
    console.log("email"+ naver_id_login.getProfileData('email')); */
    
/*     $.ajax({
    	url:"naverInfo",
    	type:"POST",
    	async: false,
    	data:{"email": email},
    	dataType:"json",
    	success: function(data){
    		alert("success"); 
    	},
    	error: function(){
    		alert("error");
    	}
    }); */
  }
</script>
</body>
</html>
