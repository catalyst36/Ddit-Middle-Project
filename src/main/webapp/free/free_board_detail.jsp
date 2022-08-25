<%@page import="kr.or.studdit.vo.RecruitVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.studdit.vo.CommentVO"%>
<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@page import="kr.or.studdit.vo.BoardVO"%>
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
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/free.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

<%
	BoardVO boardVo = (BoardVO)request.getAttribute("boardInfo");
	MyProfileVO vo = (MyProfileVO)session.getAttribute("myprofile");
	
	String bor_code = boardVo.getBor_code();
	String std_id = vo.getStd_id();
	int check = 0;
	if(std_id.equals(boardVo.getStd_id())){
		check = 1;
	}
%>

<script type="text/javascript">

	$(function(){
		
		commentList(<%=boardVo.getBor_code()%>,'',<%=check%>,'<%=std_id%>');
		
		$(document).on('click','.cmt-delete', function(){
			let cmt_code = $(this).val();
			$.ajax({
				url : '/studditproject/commentDelete.do',
				type : 'get',
				data : {"code" : cmt_code},
				success : function(){
					console.log("success")
					commentList(<%=boardVo.getBor_code()%>,'',<%=check%>,'<%=std_id%>');
				},
				error : function(xhr){
					alert(xhr.status);
				}
			});
			alert("삭제가 완료되었습니다.");
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
		
		$("#btn-reply").on('click', function(){
			let reply = $('#floatingTextarea').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
			console.log(reply);
			let cmt_code = $('#cmt-code').text();
			location.href="<%=request.getContextPath()%>/comment.do?reply="+reply+"&cmt_code="+cmt_code+"&bor_code=<%=bor_code%>&std_id=<%=std_id%>&nav=자유";
		});
			
		$(document).on('mouseover','.comment-box',function(){
			$('.comment-box-right',this).css('visibility','visible')
		});
		
		$(document).on('mouseout','.comment-box',function(){
			$('.comment-box-right',this).css('visibility','hidden')
		});
		
		$(document).on('click','.cmt-update',function(){
			let cmt_code = $(this).val();
			console.log(cmt_code);
			commentList(<%=boardVo.getBor_code()%>, cmt_code,<%=check%>,'<%=std_id%>');
		});
		
		$(document).on('click','.cmt-back',function(){
			commentList(<%=boardVo.getBor_code()%>, '',<%=check%>,'<%=std_id%>');
		});
		
		$(document).on('click','.cmt-inner-update',function(){
			let cmt_code = $(this).val();
			let cmt_con = $('#reply-update-box').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
			console.log(cmt_con);
			$.ajax({
				url : '/studditproject/commentUpdate.do',
				type : 'get',
				data : {"code" : cmt_code, "con" : cmt_con},
				success : function(){
					console.log("success")
					commentList(<%=boardVo.getBor_code()%>,'',<%=check%>,'<%=std_id%>');
				},
				error : function(xhr){
					alert(xhr.status);
				}
			});
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
		
		$('#boardDelete').on('click',function(){
			alert("삭제가 완료되었습니다.");
			location.href="<%=request.getContextPath()%>/deleteBoard.do?code=<%=boardVo.getBor_code()%>&nav=자유";
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
				
				<div class="content">
					<div class="content-title">
						<h4><%= boardVo.getBor_tit() %></h4>
						<div class="content-title-right">
							<div class="content-title-writer">작성자 : <%=boardVo.getStd_nname() %></div>
							<div class="content-title-view">조회수 : <%=boardVo.getBor_hit() %></div>
							<div class="content-title-date">날짜 : <%=boardVo.getBor_rpd().substring(0,10) %></div>
						</div>
					</div>
					
					<div class="content-content">
						<p><%= boardVo.getBor_con() %></p>
					</div>
					
					<div class="content-footer">
						<div class="button-wrapper">
							<button onclick="location.href='<%=request.getContextPath()%>/free/free_board.jsp'" class="btn btn-outline-secondary">돌아가기</button>
							<div class="button-right-wrapper">
							</div>
						</div>
					</div>	
					<div class="content-reply">
						<div class="form-floating">
							<textarea class="form-control" placeholder="댓글 입력하기" wrap="hard" id="floatingTextarea"></textarea>
						</div>
						<button type="button" id="btn-reply" class="btn btn-secondary">댓글달기</button>
					</div>
					
					<div id="reply-box">
						
					</div>	
					<%
						if(boardVo.getStd_id().equals(vo.getStd_id())){
							%> 
								<button id="boardDelete" class="btn btn-danger">게시글삭제</button>
							<%
						}
					%>
						
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
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=모집" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디모집</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=진행" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디진행중</li></a>
								<a href="<%=request.getContextPath() %>/board/board.jsp?nav=마감" class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">스터디종료</li></a>
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