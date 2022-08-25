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
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/help.js"></script>

<%
	String nav = "전체";
	MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
%>

<script type="text/javascript">

	$(function(){
		listPageServer('', '', '', '', 1);
		
		
		$(document).on('click','#btn-previous',function(){
			let currentPage = parseInt($('.page-inner').first().text()) - 1;
			let word = $('.active').first().text();
			let search = $('#search-val').val();
			let tit = "";
			let area = "";
			if(word == '전체') word = "";
			else {
				area = "bor_area";
			}
			if(search != "") {
				tit = "bor_tit";
			}
			listPageServer(area, tit, word, search, currentPage);
		});
		
		$(document).on('click','.page-inner', function(){
			let currentPage = parseInt($(this).text());
			let word = $('.active').first().text();
			let search = $('#search-val').val();
			let area = "";
			let tit = "";
			if(word == '전체') word = "";
			else {
				area = "bor_area";
			}
			if(search != "") {
				tit = "bor_tit";
			}
			listPageServer(area, tit, word, search, currentPage);
		});
		
		$(document).on('click','#btn-next',function(){
			let currentPage = parseInt($('.page-inner').last().text()) + 1;
			let word = $('.active').first().text();
			let search = $('#search-val').val();
			let area = "";
			let tit = "";
			if(word == '전체') word = "";
			else {
				area = "bor_area";
			}
			if(search != "") {
				tit = "bor_tit";
			}
			listPageServer(area, tit, word, search, currentPage);
		});
		
		$(document).on('click','.move-item', function(){
			let currentPage = parseInt($('.pagination .active').text());	
			let word = $(this).text();
			let search = $('#search-val').val();
			let area = "";
			let tit = "";
			if(word == '전체') word = "";
			else {
				area = "bor_area";
			}
			if(search != ""){
				tit = "bor_tit";
			}
			listPageServer(area, tit, word, search, currentPage);
		});
		
		$(document).on('click','#btn-search',function(){
			let currentPage = 1;
			let word = $('.active').first().text();
			let search = $('#search-val').val();
			let area = "";
			let tit = "";
			if(word == '전체') word = "";
			else {
				area = "bor_area";
			}
			if(search != "") {
				tit = "bor_tit";
			}
			listPageServer(area, tit, word, search, currentPage);
		});
		
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
		
		$(document).on('click','.move-detail', function(){
			console.log(($('td',this).first().text()));
			let code = $('td',this).first().text();
			let word = $('.active').first().text();
			location.href="/studditproject/boardDetail.do?code="+code+"&nav=질문";
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
			<a href="<%=request.getContextPath()%>/main/index.jsp"><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id= "container">
			<div id="NM_INT_LEFT" class="column_left main_section">
				
				<!-- 네비게이션 부분 -->
				<nav class="navbar navbar-expand-lg bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">HELP</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							
						</div>
					</div>
				</nav>
				
				<!-- 게시판 부분 -->
				<div>
					<div id="board-section">
						
					</div>
					<div class="page">
						<div class="page-section">
						</div>
						<button onclick="location.href='<%=request.getContextPath() %>/main/updateToBoard.jsp'" id="newBoard" class="btn btn-outline-primary">글쓰기</button>
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
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=모집" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디모집</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=진행" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디진행중</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=마감" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디종료</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">도와주세요</button>
							<ul id="help_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/help/help.jsp" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">질문</li></a>
							</ul>
						<button id="free_board" class="list-group-item list-group-item-action">자유게시판</button>
						<button id="goRank" class="list-group-item list-group-item-action">랭킹</button>
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
