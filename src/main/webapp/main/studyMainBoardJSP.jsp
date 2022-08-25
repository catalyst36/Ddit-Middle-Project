<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.studdit.vo.StudyMainBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디메인페이지</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<%-- <script src="<%=request.getContextPath() %>/js/studyMainBoard.js"></script> --%>


</head>

<style>
a{
text-decoration: none;
color: #000000;
}
h2{
	padding-top: 5px;
	text-align : center;
}
.navlu{
	list-style: none;
}
.navli{
	float: left;
	margin-right: 20px;
	padding-top: 4px;
	font-size: 1.2em;
	
}

#marginLeft{
	margin-left: 15px;
}
.firstCard{
	padding-left: 60px;
}
#divFirst{
	
	padding-top: 5px;
	text-align: right;
	font-size: 1.1em;
}
#carouselExampleDark1, #carouselExampleDark2, #carouselExampleDark3{
	margin-bottom: 8px;
	padding-top: 8px;
}

#myBackGround{
	opacity: 0.4;
    filter: alpha(opacity=40); /* msie *
}

</style>
	<% 	List<StudyMainBoardVO> list = (List<StudyMainBoardVO>)request.getAttribute("studyBoardAllList"); 
		MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");	
	
		List<StudyMainBoardVO> findList = new ArrayList<>();
		List<StudyMainBoardVO> foundList = new ArrayList<>();
		List<StudyMainBoardVO> endList = new ArrayList<>();
		List<StudyMainBoardVO> find = new ArrayList<>();
		
		for(int i =0; i<list.size();i++){
			StudyMainBoardVO vo1 = list.get(i);
			if("모집".equals(vo1.getStr_cst())){
					findList.add(vo1);
			}
			if("진행".equals(vo1.getStr_cst())){
				foundList.add(vo1);
			}
			if("마감".equals(vo1.getStr_cst())){
				endList.add(vo1);
			}
		}
	
	
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
		
		$("#findJava").on('click',function(){
			/*  location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardJava.do";
			
		});
		$("#JSP").on('click',function(){
			/* location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardJSP.do"
		});
		$("#DB").on('click',function(){
			/* location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardDB.do"
		});
		$("#PYTHON").on('click',function(){
			/* location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardPYT.do"
		});
		$("#findHC").on('click',function(){
			/* location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardHTML.do"
		});
		$("#SPRING").on('click',function(){
			/* location.href="/studditproject/studyMainBoardJava.do?id="+area; */
			location.href="/studditproject/studyMainBoardSpring.do"
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
			<a><img alt="main_logo" src="<%= request.getContextPath()%>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id= "container">
			<div id="NM_INT_LEFT" class="column_left main_section">
				<h2>스터디게시판</h2>
				<div class ="container">
				
					<div class= "row ">
						<div class="col-3 b" id="divFirst">모집중인 스터디</div>
						<div class="col-9 b">
							<ul class="padding-top navlu">
					
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.dic" id="findJava">JAVA</a></li>
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.news"id="findHC">HTML&CSS</a></li>
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.stock" id="JSP">JSP</a></li>
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.land" id="DB">DB</a></li>
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.map"id="PYTHON">PYTHON</a></li>
								<li class="nav_item navli"><a href="#" class="nav" data-clk="svc.map"id="SPRING">SPRING</a></li>
								<li class="nav_item navli"><a href="<%= request.getContextPath()%>/board/board.jsp?nav=모집" class="nav" data-clk="svc.map">더보기</a></li>
							</ul>
						</div>
					</div>
				<!--  -->	

					<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
					
					  <div class="carousel-inner">
						  <%	for(int i = 0; i< findList.size(); i++){
							  
								  	if(i== 0){
						  %>
									<div class="carousel-item active" data-bs-interval="10000">
										<img src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="d-block w-100" alt="..." id="myBackGround">
										<div class="carousel-caption d-none d-md-block">
												<h3><%=findList.get(i).getBor_tit() %></h3>
												<br>
												<br>
												<br>
												<h5><%=findList.get(i).getBor_con() %></h5>
												<br>
												<br>
												<br>
										</div>
										
									</div>				
						  <% 		
							  		}else{
						  %>	
								    <div class="carousel-item" data-bs-interval="10000">
								      <img src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="d-block w-100" alt="..." id="myBackGround">
								      <div class="carousel-caption d-none d-md-block">
												<h3><%=findList.get(i).getBor_tit() %></h3>
												<br>
												<br>
												<br>
												<h5><%=findList.get(i).getBor_con() %></h5>
												<br>
												<br>
												<br>
		 	  						  </div>
							    	</div>
						  <%					
							  		}
							  }
						  %>		
						  			
					  </div>
					  
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
						  		
					  
					</div>
				<!--  -->	
					
			
			
		</div>	
	</div>	
		<div>
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
	</div>
		<footer>
				<div id="foot">
					<h6 class="footer-title">COPYRIGHT &copy; 2022 STUDDIT PROJECT</h6>
					<h6 class="footer-title">Team 403 member >> 윤정식 / 이원걸 / 홍무곤 / 강은비</h6>				
				</div>
		</footer>
</body>
</html>