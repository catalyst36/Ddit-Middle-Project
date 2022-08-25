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
						<p>산업현장에서 요구하는 이론과 실무를 겸비한 신기술 핵심 실무인재를 양성하여<br> 
						지역 청년들의 취업을 지원하고 지역 중소기업 재직자의 직무능력향상연수를 실시하여 <br>
						중소기업의 경쟁력을 강화시킴으로써 지역사회와 국가산업발전에 기여하고자 설립</p>
						<h3>"당신도 지옥에서 돌아온 개발자가 될 수 있습니다."</h3>
					</div>
				</div>
				
				<div class="main-content main-study">
					<div class="ddit-content">
						<img alt="team.png" src="<%=request.getContextPath() %>/images/team.png" class="team-logo">
						<p>누구든지 스터디를 만들어 사람을 모집할 수 있습니다.<br>
						프로그래밍 지식을 팀원들에게 배우거나 공유하며 실력향상을 노려보세요.<br>
						잘 이루어진 스터디는 포트폴리오로써도 효과가 있습니다!</p>
						<h3>"팀원들과 스터디를 이루며 실력향상을 도모하세요!"</h3>
					</div>
				</div>
				
				<div class="main-content main-help">
					<div class="ddit-content">
						<img alt="도아주세요.png" src="<%=request.getContextPath() %>/images/도아주세요.png" class="help-logo">
						<p>실생활에서 초면인 사람에게 도움을 청하는것은 어려운일입니다.<br>
						하지만 인터넷이라면 그리 어려운일이 아닙니다. 잘 이해가 되지 않는 프로그래밍 지식을 질문하세요.<br>
						모든 사람이 질문하고 답변할 수 있으며 이곳에서의 활동으로 높은 랭킹을 얻을 수 있습니다.</p>
						<h3>"개발자는 질문을 통해 성장합니다!"</h3>
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
						<a href="#" class="list-group-item list-group-item-action" aria-current="true">HOME</a>
						<button class="list-group-item list-group-item-action" id="study_side_nav">스터디</button>
							<ul id="study_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=모집" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디모집</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=진행" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디진행중</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=마감" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디종료</li></a>
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