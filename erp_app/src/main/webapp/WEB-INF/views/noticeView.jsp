<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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
			<div class="content-panel">
				<h4>
					<i class="fa fa-angle-right"></i>공지사항
				</h4>
				<hr>

				<section class="panel">
					<div class="panel-body ">
						<div class="mail-header row">
							<div class="col-md-8">
								<h4 class="pull-left">${noticeView.subject}</h4>
							</div>
							<div class="col-md-4">
								<div class="compose-btn pull-right">
									<button class="btn  btn-sm tooltips" data-original-title="Edit"
										type="button" data-toggle="tooltip" data-placement="top"
										title="" onclick="location.href='/noticeEdit?no='+${noticeView.no}">
										<i class="fa fa-edit"></i>
									</button>
									<button class="btn btn-sm tooltips" data-original-title="Trash"
										data-toggle="tooltip" data-placement="top" title="" onclick="notice_delete()" >
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="mail-sender">
							<div class="row">
								<div class="col-md-8">
									<strong>${noticeView.name}</strong>
								</div>
								<div class="col-md-4">
									<p class="date">${noticeView.make_date}</p>
								</div>
								<div class="col-md-4">
									<p class="count">조회수: ${noticeView.view_count}</p>
								</div>
							</div>
						</div>
						<div class="view-mail">
							<p>${noticeView.contents}</p>
						</div>
					</div>
				</section>

				<div class="chat-room mt" id=reqWin>
					<aside class="mid-side">
						<div class="chat-room-head">
							<h3>댓글</h3>
						</div>
						<div class="group-rom">
 							<INPUT TYPE="hidden" NAME="session_id" id="session_id" VALUE="${sessionScope.LoginInfo.no}"/>
							<INPUT TYPE="hidden" NAME="no" id="no" VALUE="${noticeView.no}"/> 
							<input type="hidden" value="${list.reply_no}" id="reply_no" NAME="reply_no"> 
							<c:forEach items="${noticeReqView}" var="list">	
								<%-- <INPUT TYPE="hidden" NAME="member_no" id="member_no" VALUE="${list.req_memberNo}"/> --%>
								<div class="first-part odd" id="req_name">${list.req_name}</div>
								<div class="second-part" id="req_contentsList" >${list.req_contents}
								<c:if test="${sessionScope.LoginInfo.no eq list.req_memberNo}">
								<button type="button" class="btn btn-white" onclick="req_update(${list.reply_no});">
									수정
								</button>
								<button type="button" class="btn btn-white" onclick="req_delete(this);">
									삭제</i>
								</button>																	
								</c:if>
								</div>
								
								<div class="third-part" id="req_makeDate" >${list.req_makeDate}</div>
							</c:forEach>
						</div>
											
											
<!-- 						<div class="group-rom">
							<div class="first-part odd">Sam Soffes</div>
							<div class="second-part">Hi Mark, have a minute?</div>
							<div class="third-part">12:30</div>
						</div>
						<div class="group-rom">
							<div class="first-part">Mark Simmons</div>
							<div class="second-part">Of course Sam, what you need?</div>
							<div class="third-part">12:31</div>
						</div> -->

						
						<div class="chat-txt">
								<input type="text" class="form-control" id="req_contents">
							</div>

							<button class="btn btn-theme" onclick="send();" >Send</button>
					</aside>
				</div>
			</div>

		</section>
	</section>
	<!--main content end-->
	<!--footer start-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!--footer end-->
</body>
<script type="text/javascript">
$(document).ready(function() {
	var update_check =false;

 })
 
 //댓글 추가
 function send(){
//	alert("send"+update_check+"::::reply_no::::"+$('#reply_no').val());
 	var reply_no=$('#reply_no').val(); 
 	alert("send"+reply_no+ "update_check"+update_check);
 	if(update_check!=true){
 		document.getElementById("reply_no").value=-1;
		alert("send_replyNo"+$('#reply_no').val());
	}   
 	
	$.ajax({
        url: "noticeReqSend",
        type: "POST",
        data: {
				"no" : $("#no").val(),
				"member_no" : $("#session_id").val(),
				"req_contents" : $("#req_contents").val(),
				"reply_no" : $("#reply_no").val()
			},
        success: function(data){
        	$('#reqWin').load(document.URL +  ' #reqWin');
        	
        	//location.reload();
        },
        error: function(){
            alert("에러가 발생하였습니다.");
        }
    }); 
	}

//댓글 업데이트
function req_update(reply_no){
	//alert("수정할 내용 입력해주세요.");
	document.getElementById("reply_no").value=reply_no; 
	update_check= true;
	 alert("수정내용업데이트"+$('#reply_no').val() + "::::check:::::"+update_check);
	$('#req_contents').focus();
}

//댓글 삭제
function req_delete(){
	//alert("delete_replyNo"+$("#reply_no").val());
	if(!confirm("삭제하시겠습니까?")){
		return 0;
	}
 	 $.ajax({
        url: "noticeReqDelete",
        type: "POST",
        data: {
				"no" : $("#no").val(),
				"reply_no" : $("#reply_no").val() ,
				"member_no" : $("#session_id").val(),
				
			},
        success: function(data){
        	 location.reload();
        	//alert("success"+ data); 
        	// $('#list').append("<p>"+data+"</p>") 
        },
        error: function(){
            alert("에러가 발생하였습니다.");
        }
    });   
}
	
//글 삭제
function notice_delete(){
	var session_id=$("#session_id").val();
	var no=$("#no").val();
	
	if(!confirm("삭제하시겠습니까?")){
		return 0;
	}
	
	location.href = "/noticeDelete?no=" + no +"&member_no="+ session_id;
	
}
</script>

</html>
