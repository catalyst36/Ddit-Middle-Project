<%@page import="kr.or.studdit.vo.StudyMainBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateToStudyBoard</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type ="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

</head>

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
.date{
	margin: 2px;
}

</style>

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
		
		/* $("#register").on('click',function(){
			
			var str="";
			str += $("input[name='inlineRadioOptions']:checked").val()+'게시판 ';
			str += $("input[name='inlineRadioOptions2']:checked").val() +'에 게시글을 등록하시겠습니까?<br>';
			
			document.getElementById('output').innerHTML = str;
		}) */
		
		$("#save").on('click', function(){
			let title = $('#floatingTextarea1').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');//제목
			let content = $('#floatingTextarea2').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');//내용
			
			
			location.href="<%=request.getContextPath()%>/insertToStudyBoard.do?title="+title+"&content="+content;
				
			
		})
		
	
		
	});
	
	
	
</script>
<body>
	<div id="main_wrapper">
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<a href="<%=request.getContextPath()%>/main/index.jsp"><img alt="main_logo" src="<%=request.getContextPath()%>/images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id="container">
			<!--  -->
			<div id="NM_INT_LEFT" class="column_left main_section">

				<div>
					<textarea class="form-control " placeholder="제목" id="floatingTextarea1"></textarea>
				</div>
				
				<div class ="row" id="margin_top">
					<div class="col-2 ">&nbsp 게시판 </div>
					<div class="col-10 ">
						<!--  -->
						<div class="form-check">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1" value="option" checked >
							<label class="form-check-label" for="flexRadioDefault1" >스터디</label>
						</div>
						
					</div>
					<!--  -->

					
					<div class="col-2 ">&nbsp 프로그래밍 언어</div>
					<div class="col-10">
						<!--  -->
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio1" value="JAVA" >
							<label class="form-check-label" for="inlineRadio1" >JAVA</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio2" value="DATABASE">
							<label class="form-check-label" for="inlineRadio2" >DB</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio3" value="HTML&CSS">
							<label class="form-check-label" for="inlineRadio3" >HTML&CSS</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio4" value="JSP">
							<label class="form-check-label" for="inlineRadio4" >JSP</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio5" value="PYTHON">
							<label class="form-check-label" for="inlineRadio5" >PYTHON</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="inlineRadioOptions1" id="inlineRadio6" value="SPRING">
							<label class="form-check-label" for="inlineRadio6" >SPRING</label>
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
				
					<div class="col-2 offset-10">
						<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" id="">
  							작성완료
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
					        <h5 class="modal-title" id="exampleModalLabel">스터디 모집글</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        게시글을 추가하시겠습니까?
					        
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
				
			</div>
			<!--  -->
			
			<nav class="main_nav">
				<div id="NM_INT_RIGHT" class="column_right">
					<a href="<%=request.getContextPath() %>/main/index.jsp" class="logo_wrapper"><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_nav_logo"></a>
					<div id="user_info">
						<div class="profile-wrapper">
							<div class="profile-img-wrapper">
								<img src="" class="profile-img">
							</div>
							<div class="profile-content">
								<%-- <a><%=vo.getStd_nname() %></a><br>
								<a><%=vo.getStd_mil() %>점</a><br>
								<a><%=vo.getStd_tier() %></a> --%>
							</div>
						</div>
						<button>로그아웃</button>
					</div>
					
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action" aria-current="true">HOME</a>
						<button class="list-group-item list-group-item-action" id="study_side_nav">스터디</button>
							<ul id="study_inner_nav" style="display:none;">
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=모집" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디모집</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=진행" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디진행중</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=마감" class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">스터디종료</li></a>
							</ul>
						<button class="list-group-item list-group-item-action" id="help_side_nav">도와주세요</button>
							<ul id="help_inner_nav" style="display:none;">
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">질문</li></a>
								<a class="list-group-item list-group-item-action"><li><img src="../images/hash.svg">답변</li></a>
							</ul>
						<button class="list-group-item list-group-item-action">자유게시판</button>
						<button class="list-group-item list-group-item-action">랭킹</button>
					</div>
				</div>
			</nav>
		</div>
		<footer>
				<div id="foot">이곳은 footer 입니다.</div>
		</footer>
	</div>
</body>
</html>