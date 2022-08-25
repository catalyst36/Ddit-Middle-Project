<%@page import="java.util.List"%>
<%@page import="kr.or.studdit.vo.MyProfileVO"%>
<%@page import="kr.or.studdit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Studdit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</head>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-3.6.0.min.js"></script>

<style>


/* .b {
	border: solid 1px black;
} */
/*  */

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
</style>

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
			
	});

</script>
<body>
	<div id="main_wrapper">
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<a><img alt="main_logo" src="../images/studdit_logo.JPG" class="studdit_main_logo"></a>
		</div>
		<div id= "container">
			<div id="NM_INT_LEFT" class="column_left main_section">
				<h2>스터디게시판</h2>
				<div class ="container">
				
					<div class= "row ">
						<div class="col-3 b" id="divFirst">시작한 스터디</div>
						<div class="col-9 b">
							<ul class="padding-top navlu">
								<li class="nav_item navli"><a href="" class=""data-clk="svc.dic">JAVA</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.news">HTML&CSS</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.stock">JSP</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.land">DB</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">PHYTHON</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">더보기</a></li>
							</ul>
						</div>
					</div>
					
					<!-- 시작한 스터디  -->
					
					<!-- 시작한 스터디$  -->
					<!-- textSlide -->	
					<div id="carouselExampleDark1" class="carousel carousel-dark slide" data-bs-ride="carousel">
						<!-- <div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleDark1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleDark1" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleDark1" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div> -->
					<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<!-- 카드의 첫페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card " id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<!-- <div class="col-2 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div> -->
						
						
						<!--  -->
						</div>						
						<!-- 카드의 첫페이지내용$ -->
					
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 2번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							
						
						
						<!--  -->
						</div>						
						
						<!-- 카드의 2번째페이지내용$ -->
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 3번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div>
						
						
						<!--  -->
						</div>						
					<!-- 카드의 3번째페이지내용$ -->
					</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark1" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
					</button>
					</div>				
					<!-- textSlide$ -->					
					
					
				
				
			</div>
			<!-- 두번째 줄: 스터디 모집 중 -->
			
			<div class ="container">
				
					<div class= "row ">
						<div class="col-3 b" id="divFirst">스터디원 모집 중</div>
						<div class="col-9 b">
							<ul class="padding-top navlu">
								<li class="nav_item navli"><a href="" class=""data-clk="svc.dic">JAVA</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.news">HTML&CSS</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.stock">JSP</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.land">DB</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">PHYTHON</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">더보기</a></li>
							</ul>
						</div>
					</div>
					
					<!-- 시작한 스터디  -->
					
					<!-- 시작한 스터디$  -->
					<!-- textSlide -->	
					<div id="carouselExampleDark2" class="carousel carousel-dark slide" data-bs-ride="carousel">
						<!-- <div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleDark2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleDark2" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleDark2" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div> -->
					<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<!-- 카드의 첫페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card " id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬인다. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<!-- <div class="col-2 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div> -->
						
						
						<!--  -->
						</div>						
						<!-- 카드의 첫페이지내용$ -->
					
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 2번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬인다. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							
						
						
						<!--  -->
						</div>						
						
						<!-- 카드의 2번째페이지내용$ -->
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 3번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div>
						
						
						<!--  -->
						</div>						
					<!-- 카드의 3번째페이지내용$ -->
					</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark2" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark2" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
					</button>
					</div>				
					<!-- textSlide$ -->					
					
					
				
				
			</div>
			
			<!-- 두번째 줄: 스터디 모집 중$ -->
			
			<!-- 세번째 줄: 마감된 스터디 -->
			
			<div class ="container">
				
					<div class= "row ">
						<div class="col-3 b" id="divFirst">마감된 스터디</div>
						<div class="col-9 b">
							<ul class="padding-top navlu">
								<li class="nav_item navli"><a href="" class=""data-clk="svc.dic">JAVA</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.news">HTML&CSS</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.stock">JSP</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.land">DB</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">PHYTHON</a></li>
								<li class="nav_item navli"><a href="" class="nav" data-clk="svc.map">더보기</a></li>
							</ul>
						</div>
					</div>
					
					<!-- 시작한 스터디  -->
					
					<!-- 시작한 스터디$  -->
					<!-- textSlide -->	
					<div id="carouselExampleDark3" class="carousel carousel-dark slide" data-bs-ride="carousel">
						<!-- <div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleDark3" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleDark3" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleDark3" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div> -->
					<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<!-- 카드의 첫페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card " id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<!-- <div class="col-2 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div> -->
						
						
						<!--  -->
						</div>						
						<!-- 카드의 첫페이지내용$ -->
					
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 2번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬인다. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							
						
						
						<!--  -->
						</div>						
						
						<!-- 카드의 2번째페이지내용$ -->
					</div>
					<div class="carousel-item" data-bs-interval="10000">
					<!-- 카드의 3번째페이지내용 -->
						<div class= "row firstCard">
						<!--  -->
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											개발 엄청 잘하고싶다.
										</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">
											나도 잘할 수 있다.
										</p>
									</div>
								</a>
							</div>
							
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ꼬였네. ㅅ</p>
									</div>
								</a>
							</div>
							<div class="col-3 b card" id="marginLeft" style="width: 10rem;">
								<a href="#" class="stretched-link">
									<img src="../images/studdit_logo.JPG" class="img-thumbnail card-img-top" alt="...">
									
									<div class="card-body">
										<p class="card-text">해보자 .무곤</p>
									</div>
								</a>
							</div>
						
						
						<!--  -->
						</div>						
					<!-- 카드의 3번째페이지내용$ -->
					</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark3" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark3" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
					</button>
					</div>				
					<!-- textSlide$ -->					
					
					
				
				
			</div>
			
			<!-- 세번째 줄: 마감된 스터디 중$ -->
			
			
		</div>	
		<div>
			<nav class="main_nav">
				<div id="NM_INT_RIGHT" class="column_right">
					<a href="<%=request.getContextPath() %>/main/index.jsp" class="logo_wrapper"><img alt="main_logo" src="<%=request.getContextPath() %>/images/studdit_logo.JPG" class="studdit_nav_logo"></a>
					<div id="user_info">
						<div class="profile-wrapper">
							<div class="profile-img-wrapper">
								<img src="" class="profile-img">
							</div>
							<div class="profile-content">
								<a><%=vo.getStd_nname() %></a><br>
								<a><%=vo.getStd_mil() %>점</a><br>
								<a><%=vo.getStd_tier() %></a>
							</div>
						</div>
						<button>로그아웃</button>
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
								<a class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">질문</li></a>
								<a class="list-group-item list-group-item-action"><li><img src="<%=request.getContextPath() %>/images/hash.svg">답변</li></a>
							</ul>
						<button class="list-group-item list-group-item-action">자유게시판</button>
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