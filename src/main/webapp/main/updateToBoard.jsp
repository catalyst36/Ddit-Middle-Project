<%@page import="java.util.List"%>
<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@page import="kr.or.studdit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateToBoard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type ="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<style>
.d{
	float: right;
}
.form-control {
	resize: none;
	width: 95%;
}
hr{
	width:95%;
}
#floatingTextarea1{
	margin-top: 2px;
	font-size: 3.0ex;
}
#margin_top{
	margin-top: 10px;
}
#paddingLeft{
	padding-left: 30px;
}
.a{
	padding-left: 16px;
}

</style>
<%
	MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
%>

<script type="text/javascript">
	$(function() {
		

		$("#study_side_nav").on('click', function() {

			if ($('#study_inner_nav').is(":visible")) {
				$("#study_inner_nav").slideUp();
			} else {
				$("#study_inner_nav").slideDown();
			}

		});

		$("#help_side_nav").on('click', function() {

			if ($('#help_inner_nav').is(":visible")) {
				$("#help_inner_nav").slideUp();
			} else {
				$("#help_inner_nav").slideDown();
			}

		});
	 	$("#register").on('click',function(){
							
			var str="";
			str += '게시글을 등록하시겠습니까?<br>';
			
			document.getElementById('output').innerHTML = str;
		})
		
		$("#save").on('click', function(){
			let title = $('#floatingTextarea1').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
			let content = $('#floatingTextarea2').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
			let category = $("input[name='inlineRadioOptions']:checked").val();
			let lan = $("input[name='inlineRadioOptions2']:checked").val();
			
			console.log(title, content, category, lan);
			location.href="<%=request.getContextPath()%>/insertToBoard.do?title="+title+"&content="+content+"&category="+category+"&lan="+lan;
		})
		
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
</head>
<body>
	<div id="main_wrapper">
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<a href="<%=request.getContextPath()%>/main/index.jsp"><img alt="main_logo" src="<%= request.getContextPath()%>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id="container">
			<!--  -->
			
			<div id="NM_INT_LEFT" class="column_left main_section">
		<form>	
				
				<div>
				
					<!--  -->
						<textarea class="form-control " placeholder="제목" id="floatingTextarea1"></textarea>
						<!--  -->
				</div>
				
				<div class ="row" id="margin_top">
					<div class="col-2 ">&nbsp 게시판 </div>
					<div class="col-10 ">
						<!--  -->
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio3" value="스터디">
							<label class="form-check-label" for="inlineRadio3">스터디</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio1" value="질문">
							<label class="form-check-label" for="inlineRadio1">도와주세요</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions" id="inlineRadio2" value="자유">
							<label class="form-check-label" for="inlineRadio2">자유게시판</label>
						</div>
					</div>
					
				
							
					<div class="row">
					<div class="col-2 ">&nbsp 프로그래밍 언어</div>
						<div class="col-10 a">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio4" value="JAVA">
								<label class="form-check-label" for="inlineRadio4">JAVA</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio5" value="DATABASE">
								<label class="form-check-label" for="inlineRadio5">DB</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio6" value="HTML&CSS">
								<label class="form-check-label" for="inlineRadio6">HTML&CSS</label>
							</div> 
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio7" value="JSP">
								<label class="form-check-label" for="inlineRadio7">JSP</label>
							</div> 
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio8" value="PYTHON">
								<label class="form-check-label" for="inlineRadio8">PYTHON</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions2" id="inlineRadio9" value="SPRING">
								<label class="form-check-label" for="inlineRadio9">SPRING</label>
							</div>
						</div>
					</div>
				</div>
				
				<hr>
				<div class="col-12">
					<div>	
						<textarea class="form-control" placeholder="내용" id="floatingTextarea2" style="height: 575px"></textarea>
					</div>
				</div>
				<hr>
				<div class="row">
					<!--  -->
					<!-- <div class="col-10" >
						<div class="input-group" id="paddingLeft">
							<input type="file" class="form-control" id="inputGroupFile02">
							<label class="input-group-text" for="inputGroupFile02">Upload</label>
						</div>
					</div> -->
				<!--  -->
					<div class="col-2 offset-10">
						<button type="button" class="btn  btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" id="register">
  							등록
						</button>
						<br>
						<br>
						<br>
						<br>
					</div>
				
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" id="output">
					        <p>등록하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-warning" id="save">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- Modal$ -->
				
				</div>
				
				</form>
			</div>
			<!--  -->
			
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