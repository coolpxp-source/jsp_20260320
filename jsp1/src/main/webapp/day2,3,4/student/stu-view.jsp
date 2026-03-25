<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin : 30px;
	}
	table, th, tr, td{
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse : collapse;
		text-align: center;
	}
	th{
		width : 50px;
		background-color : #eee;
	}
	td{
		width : 200px;
	}
	.contents{
		height : 200px;
	}
	.btn-area{
		margin : 10px auto;	
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<form action="" name="form">
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
	
		// 있냐 없냐 둘 중 하나라서 IF문
		if(rs.next()){
	%>	
		<table>
			<tr>
				<th>학번</th>
				<td><%= rs.getString("STU_NO") %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= rs.getString("STU_NAME") %></td>
			</tr>
			<tr>
				<th>학과</th>
				<td><%= rs.getString("STU_DEPT") %></td>
			</tr>
			<tr>
				<th>학년</th>
				<td><%= rs.getString("STU_GRADE") %></td>
			</tr>
			<tr>
				<th>반</th>
				<td><%= rs.getString("STU_CLASS") %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%= rs.getString("STU_GENDER") %></td>
			</tr>
		</table>
		
	<%		
		}else{
			out.println("해당 학번을 가진 학생이 없습니다.");
		}
	%>
	<div class="btn-area">
		<input type="button" value="수정" onclick="fnEdit()">
		<input type="button" value="삭제" onclick="fnRemove()">
		<a href="stu-list.jsp"><input type="button" value="돌아가기"></a>
	</div>

</body>
</html>
<script>
	function fnEdit(){
		location.href = "stu-edit.jsp?stuNo=<%= stuNo %>"
	}
	function fnRemove(){
		location.href = "stu-remove.jsp?stuNo=<%= stuNo %>"
	}
</script>