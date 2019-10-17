<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<!--header start-->

	<jsp:include page="header.jsp"></jsp:include>
	<!--header end-->


	<!--sidebar end-->
<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <!-- page start-->
        <div class="row mt">
          <div class="col-sm-9">
            <section class="panel">
              <header class="panel-heading wht-bg">
                <h4 class="gen-case"> 결제 </h4>
              </header>
              <form id="orderform" action="order" method="POST">
              <div class="panel-body minimal">
              	<input type="hidden" id="tour_no" name="tour_no" value="${seatCheck.tour_no}"/>
              	<button id="btn" onclick="btn()">버튼</button>
              	<input type="hidden" id="date_no" name="date_no" value="${seatCheck.date_no}"/>
              	<input type="hidden" id="seat_no" name="seat_no" value="${seatCheck.no}"/>
              	<input type="hidden" id="seat_no" name="member_no" value="${sessionScope.LoginInfo.no}"/>
              	<h6>주문자아이디: ${sessionScope.LoginInfo.id}</h6>
              	<h6>여행 일자: ${seatCheck.date}</h6>
              	<!-- <h6>성별:
              		<input type='radio' name="gender" value="male"/> 남자
              		<input type='radio' name="gender" value="female"/> 여자 </h6> -->     	
				<h6>이름: <input type="text" id="name" name="name" value="${sessionScope.LoginInfo.name}"/></h6>
              	<h6>생년월일: <input type="text" id="birth" name="birth"/></h6>
				<h6>여권번호: <input type="text" id="passport" name="passport"/></h6>
              	<h6>first name: <input type="text" id="first_name" name="first_name"/></h6>
              	<h6>last name: <input type="text" id="last_name" name="last_name"/></h6>
              	<h6>전화번호: <input type="text" id="phone" name="phone"/></h6>
              	<h6>이메일:
              		<input type="text" id="email" name="email" value="${sessionScope.LoginInfo.email}"/> </h6> 
<!--               	<h6>위탁수하물:
              		<input type='radio' name="luggages" value="10"/>10kg
              		<input type='radio' name="luggages" value="15"/>15kg
              		<input type='radio' name="luggages" value="25"/>25kg </h6>
              	<h6>기내식: 
              		<input type='radio' name="foods" value="yes"/>yes
              		<input type='radio' name="foods" value="no"/>no </h6> -->
              	<h6>결제수단</h6>   
              	<input type='radio' name="pay" value="card"/>신용카드
              	<input type='radio' name="pay" value="account"/>계좌이체
              	<input type='radio' name="pay" value="phone"/>휴대폰 결제
              	<input type='radio' name="pay" value="deposit"/>무통장 입금       	
              </div>
            </section>
          </div>
          
          <div class="col-sm-3">
            <section class="panel">
              <div class="panel-body">
                <ul class="nav nav-pills nav-stacked mail-nav">
                
                	<li> <i class="fa fa-envelope-o"></i>기본가: <span id="price">${seatCheck.price}</span> </li>
                	<li><i class="fa fa-trash-o"></i> 수수료: <span id="commission ">35000</script></span> </li>
                  <li><i class="fa fa-exclamation-circle"></i>수하물:<span id="luggage">0</span>  </li>
                  <li><i class="fa fa-file-text-o"></i> 기내식: <span id="food">0</span>  </li>
                  <li class="active"><i class="fa fa-inbox"></i> 총결제금액: <span id="totalprice">0</span>  </li>
                </ul>
                <a href="#" class="btn btn-compose" onclick="document.getElementById('orderform').submit()">
                  <i class="fa fa-pencil"></i>  결제하기
                  </a>
              </div>
            </section>
            
          </div>
          </form>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
	<!--footer start-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!--footer end-->
</body>
<script type = "text/javascript">
$(document).ready(function(){
	$("input:radio[name=luggages]").click(function(){
		if($("input:radio[name=luggages]:checked").val() == '10'){
			document.getElementById('luggage').value= 10000;
		}else if($("input:radio[name=luggages]:checked").val() == '15kg'){
			document.getElementById('luggage').value= 15000;
		}else document.getElementById('luggage').value= 25000;
	})
	
	$( "#birth" ).datepicker();
});
function btn(){
	alert($("#tour_no").val());
}


</script>
</html>
