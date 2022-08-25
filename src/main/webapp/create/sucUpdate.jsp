<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int res = (Integer)request.getAttribute("newInfo");
	if(res > 0){
%>
	<script>
		alert('정보수정 성공!')
		location.href='<%=request.getContextPath()%>/create/myPage.jsp';
	</script>

<%
	}else{
%>
	<script>
		alert('정보수정 실패ㅠ')
		location.href='<%=request.getContextPath()%>/create/updateMyInfo.jsp';
	</script>

<%
	}
%>