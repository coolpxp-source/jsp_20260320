<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
	    width: 50px;
		text-align: center;	
	}
	body{
		margin : 30px;
	}
	table, th, tr, td{
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse : collapse;
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
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String stuGrade = rs.getString("STU_GRADE");
	%>
	<form action="stu-edit-result.jsp">
		<input name="stuNo" value="<%= rs.getString("STU_NO") %>" hidden>
		<table>
			<tr>
				<th>학번</th>
					<td>
						<label>
							<input name="stuNo" value="<%= rs.getString("STU_NO") %>" disabled>
						</label>
					</td>
			</tr>
			<tr>
				<th>이름</th>
					<td>
						<label>
							<input name="stuName" value="<%= rs.getString("STU_NAME") %>">
						</label>
					</td>
			</tr>
			<tr>
				<th>학과</th>
					<td>
						<label>
							<div>
								<input type="radio" name="stuDept" value="기계" checked>기계
							</div>
							<div>
								<input type="radio" name="stuDept" value="전기전자">전기전자
							</div>
							<div>
								<input type="radio" name="stuDept" value="컴퓨터정보">컴퓨터정보
							</div>
						</label>
					</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<label>
							<input type="radio" name="stuGrade" value="1" checked>1학년
							<input type="radio" name="stuGrade" value="2">2학년
							<input type="radio" name="stuGrade" value="3">3학년
					</label>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="수정">
			<a href="stu-list.jsp"><input type="button" value="돌아가기"></a>
		</div>
	</form>
</body>
</html>