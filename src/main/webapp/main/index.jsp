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

<%
	MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
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
			location.href="<%=request.getContextPath()%>/studyMainBoard.do";
		});
		
		$('.main-help').on('click',function(){
			location.href="<%=request.getContextPath() %>/help/help.jsp";
		});
		
		$('#free_board').on('click',function(){
			location.href="<%=request.getContextPath()%>/free/free_board.jsp";
		});
		
		$('#logout').on('click',function(){
			location.href="<%=request.getContextPath()%>/logout.do";
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
				
				<div class="main-content main-ddit">
					<div class="ddit-content">
						<img alt="ddit_logo" src="<%=request.getContextPath() %>/images/ddit_logo01.png" class="ddit-logo">
						<p>?????????????????? ???????????? ????????? ????????? ????????? ????????? ?????? ??????????????? ????????????<br> 
						?????? ???????????? ????????? ???????????? ?????? ???????????? ???????????? ??????????????????????????? ???????????? <br>
						??????????????? ???????????? ????????????????????? ??????????????? ????????????????????? ??????????????? ??????</p>
						<h3>"????????? ???????????? ????????? ???????????? ??? ??? ????????????."</h3>
					</div>
				</div>
				
				<div class="main-content main-study">
					<div class="ddit-content">
						<img alt="team.png" src="<%=request.getContextPath() %>/images/team.png" class="team-logo">
						<p>???????????? ???????????? ????????? ????????? ????????? ??? ????????????.<br>
						??????????????? ????????? ??????????????? ???????????? ???????????? ??????????????? ???????????????.<br>
						??? ???????????? ???????????? ???????????????????????? ????????? ????????????!</p>
						<h3>"???????????? ???????????? ????????? ??????????????? ???????????????!"</h3>
					</div>
				</div>
				
				<div class="main-content main-help">
					<div class="ddit-content">
						<img alt="???????????????.png" src="<%=request.getContextPath() %>/images/???????????????.png" class="help-logo">
						<p>??????????????? ????????? ???????????? ????????? ??????????????? ?????????????????????.<br>
						????????? ?????????????????? ?????? ??????????????? ????????????. ??? ????????? ?????? ?????? ??????????????? ????????? ???????????????.<br>
						?????? ????????? ???????????? ????????? ??? ????????? ??????????????? ???????????? ?????? ????????? ?????? ??? ????????????.</p>
						<h3>"???????????? ????????? ?????? ???????????????!"</h3>
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
						<a href="#" class="list-group-item list-group-item-action" aria-current="true">HOME</a>
						<button class="list-group-item list-group-item-action" id="study_side_nav">?????????</button>
							<ul id="study_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">???????????????</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">??????????????????</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=??????" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">???????????????</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">???????????????</button>
							<ul id="help_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/help/help.jsp" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">??????</li></a>
							</ul>
						<button id="free_board" class="list-group-item list-group-item-action">???????????????</button>
						<button id="goRank" class="list-group-item list-group-item-action">??????</button>
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