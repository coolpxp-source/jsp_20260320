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
		text-align : center;
	}
	.search-area{
		margin : 10px 10px;
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<form action="stu-list.jsp" method="get" name="stu">
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>반</th>
				<th>성별</th>
			</tr>
			<%
				String sql = "SELECT * FROM STUDENT";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
			%>
			<tr>
				<td><%= rs.getString("STU_NO") %></td>
				<td><%= rs.getString("STU_NAME") %></td>
				<td><%= rs.getString("STU_DEPT") %></td>
				<td><%= rs.getString("STU_GRADE") %></td>
				<td><%= rs.getString("STU_CLASS") %></td>
				<td><%= rs.getString("STU_GENDER") %></td>
			</tr>
			<%
			}
			%>
		</table>
		<div>
			<input type="button" value="학생추가" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		location.href = "stu-add.jsp";
	}
</script>