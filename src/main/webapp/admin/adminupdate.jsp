<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/astyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<%
	String sat_num = request.getParameter("sat_num");
	String std_id = request.getParameter("std_id");
%>
<script type="text/javascript">
function toEnabled() {
    $("input[name=upid]").attr("disabled", false);
}

$(function(){
	$('.deleteStd').on('click',function(){
		location.href="<%=request.getContextPath()%>/adminDelete.do?id=<%=std_id%>";
		
		$(document).on('click','.deleteStd',function(){
			alert("Delete Success")
		});
	});
});
</script>
</head>
<body>
<!-- 회원정보 수정 테이블 -->		
			<div class="container">
				<div id="">
					<div id="">
						<p class=""></p>
					</div>
				<div id="">
					<p class="" id="">회 원 정 보</p>
				</div>
				<form action="/studditproject/adminupdate.do" method="post" onsubmit="toEnabled()">
							<table>
								<tr>
									<td> Information </td>
									<td></td></td>
								</tr>
								<tr>
									<td>고유번호</td>
									<td><%=sat_num %></td>
								</tr>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="upid" value="<%=std_id %>" disabled></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" id="uppass" name="uppass"></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" id="upnname" name="upnname"></td>
								</tr>
								
							</table>
						<div>													

						</div>
						<div class="d-grid gap-2"><br>
							<button type="submit" class="btn1">수정완료</button>
							<button type="button" class="deleteStd">회원삭제</button>
						</div>					
					</form>
				</div>
			</div>
</div>


</body>
</html>