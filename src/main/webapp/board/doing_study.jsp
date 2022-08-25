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
	List<BoardVO> doingStudy = (List<BoardVO>)request.getAttribute("doingStudy");
	List<BoardVO> endStudy = (List<BoardVO>)request.getAttribute("endStudy");
	List<BoardVO> appStudy = (List<BoardVO>)request.getAttribute("appStudy");
	
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
			location.href="<%=request.getContextPath()%>/board/board.jsp?nav=모집";
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
				<h4>내 스터디</h4>
				<h4 class="study-state-tit">| 모집중인 스터디 |</h4>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">카테고리</th>
							<th scope="col">스터디명</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i=0;i<appStudy.size();i++){
					%>
						<tr class="cancel-hover">
							<th scope="row"><%=i+1 %></th>
							<td><%=appStudy.get(i).getBor_area() %></td>
							<td><a href="<%=request.getContextPath()%>/myStudyDetail.do?code=<%=appStudy.get(i).getBor_code()%>&ani=1"><%=appStudy.get(i).getBor_tit() %></a></td>
						</tr>
					<%		
						}
					%>
					</tbody>
				</table>
				
				<h4 class="study-state-tit">| 진행중인 스터디 |</h4>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">카테고리</th>
							<th scope="col">스터디명</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i=0;i<doingStudy.size();i++){
					%>
						<tr class="cancel-hover">
							<th scope="row"><%=i+1 %></th>
							<td><%=doingStudy.get(i).getBor_area() %></td>
							<td><a href="<%=request.getContextPath()%>/myStudyDetail.do?code=<%=doingStudy.get(i).getBor_code()%>"><%=doingStudy.get(i).getBor_tit() %></a></td>
						</tr>
					<%		
						}
					%>
					</tbody>
				</table>
				
				<h4 class="study-state-tit">| 종료된 스터디 |</h4>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">카테고리</th>
							<th scope="col">스터디명</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i=0;i<endStudy.size();i++){
					%>
						<tr class="cancel-hover">
							<th scope="row"><%=i+1 %></th>
							<td><%=endStudy.get(i).getBor_area() %></td>
							<td><a href="<%=request.getContextPath()%>/myStudyDetail.do?code=<%=endStudy.get(i).getBor_code()%>&any=1"><%=endStudy.get(i).getBor_tit() %></a></td>
						</tr>
					<%		
						}
					%>
					</tbody>
				</table>
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
								<a><%=vo.getStd_mil() %>점</a><br>
								<a><%=vo.getStd_tier() %></a>
							</div>
						</div>
						<button id="logout" class="btn btn-warning">로그아웃</button>
						<button class="btn btn-warning" type="button" onclick="location.href='<%=request.getContextPath()%>/myStudyInfo.do?id=<%=vo.getStd_id()%>'">내 스터디</button>
					</div>
					
					<div class="list-group">
						<a href="<%=request.getContextPath() %>/main/index.jsp" class="list-group-item list-group-item-action" aria-current="true">HOME</a>
						<button class="list-group-item list-group-item-action" id="study_side_nav">스터디</button>
							<ul id="study_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=모집" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">스터디모집</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=진행" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">스터디진행중</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=마감" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath()%>/images/hash.svg">스터디종료</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">도와주세요</button>
							<ul id="help_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/help/help.jsp" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">질문</li></a>
							</ul>
						<button id="free_board" class="list-group-item list-group-item-action">자유게시판</button>
						<button class="list-group-item list-group-item-action">랭킹</button>
					</div>
				</div>
			</nav>
		</div>
		<footer>
				<div id="foot">
					<h6 class="footer-title">COPYRIGHT &copy; 2022 STUDDIT PROJECT</h6>
					<h6 class="footer-title">Team 403 member >> 윤정식 / 이원걸 / 홍무곤 / 강은비</h6>				
				</div>
		</footer>
	</div>
</body>
</html>