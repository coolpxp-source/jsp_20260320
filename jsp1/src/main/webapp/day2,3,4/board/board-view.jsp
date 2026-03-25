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
		width : 80px;
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
	.line{
		margin : 10px auto;
		color : gray;
	}
	.cmt{
		width : 670px;
	}
	.btn{
		width: 18px;
	}
	.ctn-size{
		width : 670px;
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<form action="" name="form">
		<%
			String sessionId = (String)session.getAttribute("sessionId");
			String boardNo = request.getParameter("boardNo");
			String sessionRole =(String)session.getAttribute("sessionRole");
		%>
		<input name="boardNo" value="<%= boardNo %>" hidden>
		<table>
		<%
			String sql = "UPDATE TBL_BOARD SET CNT = CNT + 1 "
						+ "WHERE BOARDNO = " + boardNo;
			stmt.executeUpdate(sql);
		
			sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
			ResultSet rs = stmt.executeQuery(sql);
			String userId = "";
			
			if(rs.next()){
				 userId = rs.getString("USERID");
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
		<%
			if(userId.equals(sessionId) || sessionRole.equals("A")){
		%>
			<input type="button" value="수정" onclick="fnEdit()">
			<input type="button" value="삭제" onclick="fnRemove()">
		<%	
			}
		%>
			<a href="board-list.jsp"><input type="button" value="돌아가기"></a>
		</div>
		<div>
			<hr class="line">
		</div>
		<div class="comment-area">
		<table>
			<%
				sql = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo;
				rs = stmt.executeQuery(sql);
				while(rs.next()){
			%>
				<tr>
					<th><%= rs.getString("USERID") %> </th>
					<td class ="cmt"><%= rs.getString("CONTENTS") %> </td>
				</tr>					
			<%	} %>
		</table>
		<table class="ctn-size">
			<tr>
				<th>댓글 등록</th>
				<td><textarea name="contents" cols="80" rows ="5"></textarea></td>
				<td class="btn"><input type="button" value="등록하기" onclick="fnCommentAdd()"></td>
			</tr>
		</table>
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
	function fnCommentAdd(){
		form.action="board-comments.jsp?boardNo=" + <%= boardNo %>;
	}
</script>