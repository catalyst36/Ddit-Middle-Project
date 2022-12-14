<%@page import="kr.or.studdit.vo.ActMemberVO"%>
<%@page import="kr.or.studdit.vo.StudyActVO"%>
<%@page import="kr.or.studdit.vo.RecruitVO"%>
<%@page import="kr.or.studdit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Studdit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<%
	MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
	BoardVO currentStudy = (BoardVO)request.getAttribute("boardInfo");
	List<RecruitVO> memberList = (List<RecruitVO>)request.getAttribute("memberList");
	List<StudyActVO> actList = (List<StudyActVO>)request.getAttribute("actList");
	List<String[]> actMemberList = (List<String[]>)request.getAttribute("actMemberList");
%>

<script type="text/javascript">

	$(function(){
		
		$("#study_side_nav").on('click',function(){
			
			if($('#study_inner_nav').is(":visible")){
				$("#study_inner_nav").slideUp();
			}else{
				$("#study_inner_nav").slideDown();
			}
			
		});
		
		$("#help_side_nav").on('click',function(){
			
			if($('#help_inner_nav').is(":visible")){
				$("#help_inner_nav").slideUp();
			}else{
				$("#help_inner_nav").slideDown();
			}
			
		});
		
		$('.profile-content').on('click',function(){
			location.href="<%=request.getContextPath()%>/create/myPage.jsp";
		});
		
		$('.main-study').on('click',function(){
			location.href="<%=request.getContextPath()%>/board/board.jsp?nav=??????";
		});
		
		$(document).on('click','#study-end',function(){
			location.href="<%=request.getContextPath()%>/studyState.do?code=<%=currentStudy.getBor_code()%>&state=??????&id=<%=vo.getStd_id()%>";			
		});
		
		$('#free_board').on('click',function(){
			location.href="<%=request.getContextPath()%>/free/free_board.jsp";
		});
		
		$('#logout').on('click',function(){
			location.href="<%=request.getContextPath()%>/logout.do";
		});
		
		$('.profile-content').on('click',function(){
			location.href="<%=request.getContextPath()%>/create/myPage.jsp";
		});
		
		$('#goRank').on('click',function(){
			location.href="<%=request.getContextPath()%>/getRank.do";
		});
	});

</script>
<body>
	<div id="main_wrapper">
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<a href="<%=request.getContextPath()%>/main/index.jsp"><img alt="main_logo" src="<%=request.getContextPath()%>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id= "container">
			<div id="NM_INT_LEFT" class="column_left main_section">
					<div class="content">
					<div class="content-title">
						<h5><%= currentStudy.getBor_tit() %> | <%=currentStudy.getBor_area() %></h5>
					</div>
					
					<div class="content-content">
						<p><%= currentStudy.getBor_con() %></p>
					</div>
					
					<%
						for(int i=0;i<actList.size();i++){
					%>
						<div class="content-content content-act">
							<div class="act-header">
								<h5><%=actList.get(i).getAct_tit() %></h5>
								<div class="act-date"><%=actList.get(i).getAct_date() %></div>
							</div>
							<div class="act-con">>><%=actList.get(i).getAct_con() %></div>
							<div class="act-mem">
							<span>?????? ??????</span>
							 <table>
						            	<tr>
						            <%
						            	for(int k=0;k<actMemberList.get(i).length;k++){
						            %>
						            			<td>&nbsp;<&nbsp;<%=actMemberList.get(i)[k] %>&nbsp;>&nbsp;</td>
						            <%			
								            if(i == 2){
						            			%></tr><tr><%
						            		}
						            	}
						            %>
						            </tr>
						            </table>
							</div>
						</div>
					<%		
						}
					%>
					
					<div class="content-footer">
						<h4>????????? ??????</h4>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">?????????</th>
									<th scope="col">??????</th>
									<th scope="col">??????/??????</th>
								</tr>
							</thead>
							<tbody>
							<%
								for(int i=0;i<memberList.size();i++){
							%>
								<tr class="cancel-hover">
									<th scope="row"><%=i+1 %></th>
									<td><%=memberList.get(i).getStd_nname() %></td>
									<td><%=memberList.get(i).getStd_tier() %></td>
							<%
									if(currentStudy.getStd_nname().equals(memberList.get(i).getStd_nname()) ){
							%>
									<td>??????</td>	
							<%	
									}else{
							%>		
									<td>??????</td>		
							<%		
									}
							%>
								</tr>
							<%		
								}
							%>
									
							</tbody>
							</table>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">New Activity</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <form action="/studditproject/myStudyAct.do" method="get">
						        <input name="bor_code" type="text" value="<%=currentStudy.getBor_code() %>" id="saveborcode">
					            <div class="mb-3">
						            <label for="recipient-name" class="col-form-label">?????? ??????</label><br>
						            <table>
						            	<tr>
						            <%
						            	for(int i=0;i<memberList.size();i++){
						            %>
						            	<td><input type="checkbox" class="form-check-input" value="<%=memberList.get(i).getStd_id() %>" name="member">&nbsp;<%=memberList.get(i).getStd_nname() %>&nbsp;&nbsp;</td>
						            <%		
								            if(i == 2){
						            			%></tr><tr><%
						            		}
						            	}
						            %>
						            </tr>
						            </table>
					            </div>
						          <div class="mb-3">
						            <label for="recipient-name" class="col-form-label">?????? ??????</label>
						            <input type="text" name="act_tit" class="form-control" id="recipient-name">
						          </div>
						          <div class="mb-3">
						            <label for="message-text" class="col-form-label">?????? ??????</label>
						            <textarea class="form-control" name="act_con" id="message-text"></textarea>
						          </div>
						          <div class="btn-right-wrapper">
						          	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
						            <button type="submit" class="btn btn-primary">??????</button>
						            </div>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>
						<div class="button-wrapper">
							<button onclick="location.href='<%=request.getContextPath()%>/myStudyInfo.do?id=<%=vo.getStd_id() %>'" class="btn btn-outline-secondary">????????????</button>
							<div class="button-right-wrapper">
								<%
									if(currentStudy.getStd_id().equals(vo.getStd_id())){
										%>
											<button type="button" id="study-end" class="btn btn-danger">????????? ??????</button>
										<%
									}
								%>
								<button type="button" onclick="location.href='https://www.ddit.or.kr/room'" id="study-application" class="btn btn-primary">????????? ??????</button>
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">?????? ??????</button>
							</div>
						</div>
					</div>	
				</div>
				
				
				
				
			</div>
			<nav class="main_nav">
				<div id="NM_INT_RIGHT" class="column_right">
					<a href="<%=request.getContextPath() %>/main/index.jsp" class="logo_wrapper"><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_nav_logo"></a>
					<div id="user_info">
						<div class="profile-wrapper">
							<div class="profile-img-wrapper">
								<img src="<%=request.getContextPath()%>/imgSrcView.do?id=<%=vo.getStd_id() %>" class="profile-img">
							</div>
							<div class="profile-content">
								<a><%=vo.getStd_nname() %></a><br>
								<a><%=vo.getStd_mil() %>???</a><br>
								<a><%=vo.getStd_tier() %></a>
							</div>
						</div>
						<button id="logout" class="btn btn-warning">????????????</button>
						<button class="btn btn-warning" type="button" onclick="location.href='<%=request.getContextPath()%>/myStudyInfo.do?id=<%=vo.getStd_id()%>'">??? ?????????</button>
					</div>
					
					<div class="list-group">
						<a href="<%=request.getContextPath() %>/main/index.jsp" class="list-group-item list-group-item-action" aria-current="true">HOME</a>
						<button class="list-group-item list-group-item-action" id="study_side_nav">?????????</button>
							<ul id="study_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">???????????????</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">??????????????????</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">???????????????</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">???????????????</button>
							<ul id="help_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/help/help.jsp" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">??????</li></a>
							</ul>
						<button id="free_board" class="list-group-item list-group-item-action">???????????????</button>
						<button class="list-group-item list-group-item-action">??????</button>
					</div>
				</div>
			</nav>
		</div>
		<footer>
				<div id="foot">
					<h6 class="footer-title">COPYRIGHT &copy; 2022 STUDDIT PROJECT</h6>
					<h6 class="footer-title">Team 403 member >> ????????? / ????????? / ????????? / ?????????</h6>				
				</div>
		</footer>
	</div>
</body>
</html>