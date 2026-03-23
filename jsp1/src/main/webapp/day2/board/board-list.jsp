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
	<form action="board-list.jsp" method="get" name="list">
		<%@ include file="../../db.jsp" %>
		<%
			String keyword = request.getParameter("keyword");
		%>
		<div class="search-area">
			<label>검색어 : <input name="keyword" 
							value ="<%= keyword != null ? keyword : " " %>"> <!-- 삼항연산자 -->
			</label>
			<input type="submit" value="검색">
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		<% 
			String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
						+ " FROM TBL_BOARD B WHERE 1=1 ";
			if(keyword != null){
				sql += " AND TITLE LIKE '%" + keyword + "%'"; 
			}
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("BOARDNO") %></td>
				<td><a href="javascript:;" onclick="fnView(<%= rs.getString("BOARDNO") %>)"><%= rs.getString("TITLE") %></a></td>
				<td><%= rs.getString("USERID") %></td>
				<td><%= rs.getString("CNT") %></td>
				<td><%= rs.getString("CDATE") %></td>
			</tr>
		<%		
			}
			
		%>
		</table>
		<div>
			<input type="button" value="글쓰기" onclick="fnAdd()">
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		location.href = "board-add.jsp";
	}
	function fnView(boardNo){
		alert(boardNo);
		location.href = "board-view.jsp?boardNo=" + boardNo;
	}
</script>