<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<%-- <%String rw =(String) request.getAttribute("rw"); %> --%>
   <meta charset="utf-8">
   <title>공지사항</title>
   
	<script type="text/javascript" src="smarteditor/js/service/HuskyEZCreator.js" charset="utf-8">

	</script>
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
	<!-- <section id="main-content">
		<section class="wrapper">
		
		<div id="editor">
		
            <textarea name="test" id="test" rows="10" cols="10" style="width:100%;">에디터 테스트 입니다.</textarea>
      	</div>
		</section>
	</section> -->
	
	<section id="main-content">
      <section class="wrapper">
         <div class="content-panel">
            <h4>
			  <%--  <% if (rw=="write") %>
               <i class="fa fa-angle-right"></i>글쓰기
               <%else %> --%>
               <i class="fa fa-angle-right"></i>글수정
            </h4>
            <hr>
            <section class="panel">
               <div class="panel-body ">
	           <form id="noticeSave" name="noticeSave" action="/noticeSave" method="post">
	<%-- 			<% if ((String) request.getAttribute("rw")!="write") {%> --%>
 				<input type="hidden" value="${noticeView.no}" name="no" id="no"/> 
				<input type="hidden" value="${sessionScope.LoginInfo.no}" name="member_no" id="member_no"/> 
			<%-- 	<%}%> --%>
				<div class="mail-header row">
							<div class="col-md-8">
								<h4 class="pull-left"><input type="text" placeholder="글제목을 입력해주세요." value="${noticeView.subject}" name="subject" id="subject"/></h4>
							</div>
							<div class="col-md-4">
								<div class="compose-btn pull-right">
								</div>
							</div>
						</div>
						<div class="mail-sender">
							<div class="row">
								<div class="col-md-8">
									<strong name="id">${sessionScope.LoginInfo.id}</strong>
								</div>
							</div>
						</div>              
                  <div id="editor">
                     <textarea name="contents" id="contents" rows="10" cols="10" style="width:100%; height:400px"/>${noticeView.contents}</textarea>
                    <%--  <input type="button" value="수정" onclick="location.href='/noticeSave?no='+${noticeView.no}"/> --%>
                     <input type="button" value="저장" id="savebutton"/>
                     <input type="button" value="취소" onclick=""/>
                  </div>

               </div>
            </section>
            </form>
         </div>
      </section>
   </section>
	
	
	
	<!--main content end-->
	<!--footer start-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!--footer end-->
	
</body>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
   	elPlaceHolder: "contents",
	sSkinURI: "smarteditor/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

//전송버튼 클릭이벤트
$("#savebutton").click(function (){
	//if(confirm("저장하시겠습니까?")){	
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		var no = $('#no').val();
		//alert("Edit_n1o:"+no);
		if(no=="")
			document.getElementById("no").value=-1;
		if($('#subject').val()==""){a
			alert("제목을 입력하세요.");
			return false;}
		else
			validation();
		noticeSave.submit();
				
		
})


// 필수값 Check 
function validation(){
	var content = $.trim(oEditors[0].getContents());
	if(content === '<p>&bnsp;</p>' || content === ''){// 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음.
		alert("내용을 입력하세요.");
		oEditors.getById['contents'].exec('FOCUS');
		return false;
		}
	return true;
	}
	
	
	


</script>
</html>


