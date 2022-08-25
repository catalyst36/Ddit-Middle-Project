<%@page import="java.util.List"%>
<%@page import="kr.or.studdit.dao.IStudditDao"%>
<%@page import="kr.or.studdit.vo.SatisVO"%>
<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Studdit admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/astyle.css">
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
		
		$(document).on('click','#btn-send',function(){
			alert("Send Success")
		});
		
		$('.profile-content').on('click',function(){
			location.href="<%=request.getContextPath()%>/create/myPage.jsp";
		});
		
			
		$("#admin1").on("click",function() {
			$.ajax({
				url : "/studditproject/adminSatis.do",
				type : "get",
				success : function(res) {
					
					let adminsat = '<form action="/studditproject/adminSendMail.do" method="get">'
					adminsat +=		'<table class="table">';
					adminsat +=		'<thead>';
					adminsat +=				   '<tr>';
					adminsat +=						'<th>고유번호</th>';
					adminsat +=						'<th>이름</th>';
					adminsat +=						'<th>메일</th>';
					adminsat +=						'<th>기수</th>';
					adminsat +=						'<th>메일발송선택</th>';
					adminsat +=						'<button id="btn-send" class="send btn btn-outline-success" type="submit">Send Mail</button>';					
					adminsat +=				    '</tr>';
					adminsat +=				    '</thead>';
					
					adminsat +=					'<tbody>';	
			$.each(res,function(i, v){
				
				
	
				
	adminsat +=					'<tr>';
	adminsat +=						'<td>' + res[i].sat_num + '</td>';
	adminsat +=						'<td>' + res[i].sat_name + '</td>';
	adminsat +=						'<td>' + res[i].sat_mail + '</td>';
	adminsat +=						'<td>' + res[i].sat_no + '</td>';
	adminsat +=						'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="chk_mail form-check-input" name="val" value="' + res[i].sat_mail + '"></td>';
	adminsat +=					'</tr>';
	
	
	// 체크박스 위치
				
			});	
			adminsat +=					'</tbody>';
			adminsat +=	'</table>';
			$('#test').html(adminsat);		
					
										
				},
				error : function(xhr) {
						alert("오류코드 = " + xhr.status);
					},
				dataType : "json"
			});
		});
		
		// select student
		
		$("#admin2").on("click",function() {
			$.ajax({
				url : "/studditproject/adminStudent.do",
				type : "get",
				success : function(res) {
					
				let	adminsat = '<form>'
					adminsat +=		'<table class="table">';
					adminsat +=				   '<tr>';
					adminsat +=						'<th>고유번호</th>';
					adminsat +=						'<th>아이디</th>';
					adminsat +=						'<th>비밀번호</th>';
					adminsat +=						'<th>닉네임</th>';
					adminsat +=				    '</tr>';
					
					
			$.each(res,function(i, v){
				
				
	
						
	adminsat +=					'<tr>';
	adminsat +=						'<td><a href="adminupdate.jsp?sat_num=' + res[i].sat_num + '&std_id=' + res[i].std_id + '">' + res[i].sat_num + '</td>';
	adminsat +=						'<td>' + res[i].std_id + '</td>';
	adminsat +=						'<td>' + res[i].std_pass + '</td>';
	adminsat +=						'<td>' + res[i].std_nname + '</td>';
	adminsat +=					'</tr>';
	
	// 리스트
				
			});	
			adminsat +=	'</table>';
			$('#test').html(adminsat);		
					
										
				},
				error : function(xhr) {
						alert("오류코드 = " + xhr.status);
					},
				dataType : "json"
			});
		});
		
		$('#logout').on('click',function(){
			location.href="<%=request.getContextPath()%>/logout.do";
		});
	});

</script>
<body>
	<div id="main_wrapper">
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<a><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id= "container">
			<div id="NM_INT_LEFT" class="column_left main_section">
				<button class="admin-button btn btn-outline-primary" id="admin1">메일발송</button>
				<button class="admin-button btn btn-outline-primary" id="admin2">회원관리</button>
				<div id="test"></div>				
			</div>
			<nav class="main_nav">
				<div id="NM_INT_RIGHT" class="column_right">
					<a href="#" class="logo_wrapper"><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_nav_logo"></a>
					<div id="user_info">
						<div class="profile-wrapper">
							<div class="profile-img-wrapper">
								<img src="<%=request.getContextPath()%>/images/profilePic/<%=vo.getSat_phot() %>" class="profile-img">
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
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디모집</li></a>
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디진행중</li></a>
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디종료</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">도와주세요</button>
							<ul id="help_inner_nav" style="display:none;">
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">질문</li></a>
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">답변</li></a>
							</ul>
						<button class="list-group-item list-group-item-action">자유게시판</button>
						<button class="list-group-item list-group-item-action">랭킹</button>
						<button class="list-group-item list-group-item-action">관리자페이지</button>
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