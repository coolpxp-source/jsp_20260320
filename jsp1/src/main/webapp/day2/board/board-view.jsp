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
	}
	th{
		width : 50px;
		background-color : #eee;
	}
	td{
		width : 300px;
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
			String boardNo = request.getParameter("boardNo");
		%>
		<input name="boardNo" value="<%= boardNo %>" hidden>
		<table>
		<%
			String sql = "UPDATE TBL_BOARD SET CNT = CNT + 1 "
						+ "WHERE BOARDNO = " + boardNo;
			stmt.executeUpdate(sql);
		
			sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
		%>
			<tr>
				<th>제목</th>
				<td colspan="3"><%= rs.getString("TITLE") %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= rs.getString("USERID") %></td>
				<th>조회수</th>
				<td><%= rs.getString("CNT") %></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td colspan="3"><%= rs.getString("CDATETIME") %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" class="contents"><%= rs.getString("CONTENTS") %></td>
			</tr>
		<%	
			}else{
				out.println("존재하지 않는 게시글 입니다.");
			}
		%>
		</table>
		<div class="btn-area">
			<input type="button" value="수정" onclick="fnEdit()">
			<input type="button" value="삭제" onclick="fnRemove()">
			<input type="button" value="돌아가기">
		</div>
	</form>
</body>
</html>
<script>
	function fnEdit(){
		let form = document.form;
		form.action = "board-edit.jsp";
		form.submit();
	}
	function fnRemove(){
		console.log(<%= boardNo %>);
		location.href = "board-remove.jsp?boardNo=" + <%= boardNo %>;
	/* 	let form = document.form;
		form.action = "board-remove.jsp";
		form.submit(); */

		
	}
</script>