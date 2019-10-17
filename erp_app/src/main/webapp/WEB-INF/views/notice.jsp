<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<style type:text/css">
A:hover{color : #000000;}
</style>
<Script>

	function paging(curPage){
		location.href = "/notice?curPage=" + curPage;
	}
	
	function noticeView(no){
		location.href = "/noticeView?no=" + no;
	}
		
</Script>
  
<body>
	<!--header start-->

	<jsp:include page="header.jsp"></jsp:include>
	<!--header end-->


	<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper site-min-height">
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">공지사항</a></li>
							<li><a data-toggle="tab" href="#contact">문의하기</a></li>
							<li><a data-toggle="tab" href="#edit">자주하는질문</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="compose-btn pull-right">
							<button class="btn  btn-sm tooltips" data-original-title="Edit"
								type="button" data-toggle="tooltip" data-placement="top"
								title="" onclick="location.href='/noticeEdit?rw=write'">
								<i class="fa fa-edit"> 글쓰기</i>
							</button>
						</div>
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
							
								<div class="row">
									<div class="col-md-12">
										<table class="table table-striped table-advance table-hover">
										
											<colgroup>
												<col width="70px"><col><col width="100px">
											</colgroup>
											<thead>
												<tr>
													<th class="text-center">No</th>
													<th class="text-center"><i class="fa fa-edit"></i> 제목</th>
													<th class="text-center"><i class=" fa fa-calendar"></i> 작성일</th>
													<th class="text-center">조회수</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${list}" var="noticeList">												
												<tr>
													<td>${noticeList.no}</td>
 													<td><a href="#"  onClick="noticeView('${noticeList.no}')">${noticeList.subject}  (${noticeList.reply_cnt})</td>
													<td>${noticeList.make_date}</td> 
													<td>${noticeList.view_count}</td> 
												</tr>					
											</c:forEach>	
											</tbody>
										</table>

										<div class="row-fluid">
											<div class="span6">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<ul>
														
                        								<li class="prev disabled"><a href="#" onClick="paging('${notice.prev}')">이전</a></li>  
														<c:forEach var="pageNum" begin="1" end="${listCnt}">
															<li><a href="#" onClick="paging('${pageNum}')">${pageNum}</li>
									                    </c:forEach>
														 <c:if test="${notice.curPage ne listCnt && listCnt > 0}"> 
															 <li class="next"><a href="#" onClick="paging('${notice.next}')">다음</a></li> 
														 </c:if> 
													</ul>
												</div>
											</div>
										</div>
										<!-- /content-panel -->
									</div>
									<!-- /col-md-12 -->
								</div>
								<!-- /row -->
								<!-- /OVERVIEW -->
							</div>
							<!-- /tab-pane -->
							<div id="contact" class="tab-pane">
								<div class="row">
									<div class="col-md-12">
										<table class="table table-striped table-advance table-hover">
											<thead>
												<tr>
													<th><i class="fa fa-bullhorn"></i> Company</th>
													<th class="hidden-phone"><i class="fa fa-question-circle"></i> Descrition</th>
													<th><i class="fa fa-bookmark"></i> Profit</th>
													<th><i class=" fa fa-edit"></i> Status</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><a href="basic_table.html#">Company Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12000.00$</td>
													<td><span class="label label-info label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#"> Dashio co </a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>17900.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#"> Another Co </a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>14400.00$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Dashio ext</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>22000.50$</td>
													<td><span class="label label-success label-mini">Paid</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Total Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12120.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Total Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12120.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Total Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12120.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Total Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12120.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
												<tr>
													<td><a href="basic_table.html#">Total Ltd</a></td>
													<td class="hidden-phone">Lorem Ipsum dolor</td>
													<td>12120.00$</td>
													<td><span class="label label-warning label-mini">Due</span></td>
													<td>
														<button class="btn btn-success btn-xs">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-primary btn-xs">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>
											</tbody>
										</table>

										<div class="row-fluid">
											<div class="span6">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<ul>
														<li class="prev disabled"><a href="#">이전</a></li>
														<li class="active"><a href="#">1</a></li>
														<li><a href="#">2</a></li>
														<li><a href="#">3</a></li>
														<li><a href="#">4</a></li>
														<li><a href="#">5</a></li>

														<li class="next"><a href="#">다음</a></li>
													</ul>
												</div>
											</div>
										</div>
										<!-- /content-panel -->
									</div>
									<!-- /col-md-12 -->
								</div>
								<!-- /row -->
							</div>
							<!-- /tab-pane -->
							<div id="edit" class="tab-pane">
								<div class="row">
									<div class="col-md-12">
										<div class="accordion" id="accordion2">
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="faq.html#collapseOne"> <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>How to purchase this template?
													</a>
												</div>
												<div id="collapseOne" class="accordion-body collapse in">
													<div class="accordion-inner">
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
													</div>
												</div>
											</div>
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="faq.html#collapseTwo"> <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>How can I install my server?
													</a>
												</div>
												<div id="collapseTwo" class="accordion-body collapse">
													<div class="accordion-inner">
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
													</div>
												</div>
											</div>
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="faq.html#collapseThree"> <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>How to change color schemes?
													</a>
												</div>
												<div id="collapseThree" class="accordion-body collapse">
													<div class="accordion-inner">
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
													</div>
												</div>
											</div>
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="faq.html#collapseFour"> <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>How to integrate Revolution Slider?
													</a>
												</div>
												<div id="collapseFour" class="accordion-body collapse">
													<div class="accordion-inner">
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
													</div>
												</div>
											</div>
											<div class="accordion-group">
												<div class="accordion-heading">
													<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="faq.html#collapseFive"> <em class="glyphicon glyphicon-chevron-right icon-fixed-width"></em>How Can I get Support?
													</a>
												</div>
												<div id="collapseFive" class="accordion-body collapse">
													<div class="accordion-inner">
														<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
													</div>
												</div>
											</div>
											<!-- end accordion -->
										</div>
										<!-- col-md-10 -->
									</div>
									<!--  /row -->
								</div>
								<!-- /row -->
							</div>
							<!-- /tab-pane -->
						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /col-lg-12 -->
			</div>

		</section>
	</section>
	<!--main content end-->
	<!--footer start-->
	<jsp:include page="footer.jsp"></jsp:include>

	<!--footer end-->
</body>

</html>
