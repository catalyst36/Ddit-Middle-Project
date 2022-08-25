<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset='utf-8'>
<title>Studdit</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<style>
body {
	background:#FD9F28;
}

form {
	width: 15%;
	margin: 180px auto;
	background: #efefef;
	padding: 60px 120px 80px 120px;
	text-align: center;
	-webkit-box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1);
	border-radius: 40px 40px 40px 40px;
}

label {
	display: block;
	position: relative;
	margin: 40px 0px;
}

.label-txt {
	position: absolute;
	top: -1.6em;
	padding: 10px;
	font-family: sans-serif;
	font-size: .8em;
	letter-spacing: 1px;
	color: rgb(120, 120, 120);
	transition: ease .3s;
}

.input {
	width: 100%;
	padding: 10px;
	background: transparent;
	border: none;
	outline: none;
}

.line-box {
	position: relative;
	width: 100%;
	height: 2px;
	background: #BCBCBC;
}

.line {
	position: absolute;
	width: 0%;
	height: 2px;
	top: 0px;
	left: 50%;
	transform: translateX(-50%);
	background: #0000FF;
	transition: ease .6s;
}

.input:focus+.line-box .line {
	width: 100%;
}

.label-active {
	top: -3em;
}

button {
	display: inline-block;
	padding: 12px 24px;
	background: rgb(220, 220, 220);
	font-weight: bold;
	color: rgb(120, 120, 120);
	border: none;
	outline: none;
	border-radius: 3px;
	cursor: pointer;
	transition: ease .3s;
	border-radius: 40px 40px 40px 40px;
}

button:hover {
	background: #0000FF;
	color: #ffffff;
}

</style>
</head>
<body>
<!-- 아이디찾기 -LWG- -->
<form>
	<label>
		<p class="label-txt">ENTER YOUR NAME</p><br> <input type="text"
		class="input" name="name">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<label>
		<p class="label-txt">ENTER YOUR E-MAIL</p><br> <input type="e-mail"
		class="input" name="e-mail">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<button type="button" id="btn-findId">Find Your Id</button><br><br>
	
	
	
	
	
<!-- 비밀번호찾기 -LWG- -->	
	<label>
		<p class="label-txt">ENTER YOUR NAME</p><br> <input type="text"
		class="input" name="name2">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<label>
		<p class="label-txt">ENTER YOUR ID</p><br> <input type="text"
		class="input" name="id">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<label>
		<p class="label-txt">ENTER YOUR E-MAIL</p><br> <input type="e-mail"
		class="input" name="e-mail2">
		<div class="line-box">
			<div class="line"></div>
		</div>
	</label>
	<button type="button" id="btn-findpass">Find Your Password</button><br>
	
	
	
</form>
<script>
$(function() {
	$('.input').focus(function() {
		$(this).parent().find(".label-txt").addClass('label-active');
	});

	$(".input").focusout(function() {
		if ($(this).val() == '') {
			$(this).parent().find(".label-txt").removeClass('label-active');
		}
	});
				
				
	$("#btn-findId").on("click",function() {
		$.ajax({
			url : "/studditproject/find.do",
			type : "post",
			data : {"id" : $("input[name='name']").val(), "e-mail" : $("input[name='e-mail']").val()},
			success : function(res) {
					if (res == null) {
						alert("Not Found Your Id");
					} else {
						alert("Find Your Id : " + res);
					}
				},
			error : function(xhr) {
					alert("오류코드 = " + xhr.status);
				},
			dataType : "json"
		});
	});
		
	$("#btn-findpass").on("click",function() {
		$.ajax({
			url : "/studditproject/findPass.do",
			type : "post",
			data : {"name" : $("input[name='name2']").val(), "e-mail" : $("input[name='e-mail2']").val(),
			"id" : $("input[name='id']").val()},
			success : function(res) {
					if (res == null) {
						alert("Not Found Your Information");
					} else {
						alert("Success Send E-mail");
					}
				},
			error : function(xhr) {
					alert("오류코드 = " + xhr.status);
				},
			dataType : "json"
		});
	});
});
	
		
	
	
</script>
</body>
</html>