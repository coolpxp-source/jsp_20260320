<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<%
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String kind = request.getParameter("kind");
		String boardNo = request.getParameter("boardNo");
		
		String sql = "UPDATE TBL_BOARD SET "
				+ "TITLE = '" + title + "',"
				+ "CONTENTS = '" + contents + "',"
				+ "kind = '" + kind + "',"
				+ "UDATETIME = SYSDATE "
				+ "WHERE BOARDNO = " + boardNo;
		int result = stmt.executeUpdate(sql);
	%>
	
</body>
</html>
<script>
	let result = <%= result %>
	if(result > 0){
		alert("수정 됨");
	}else{
		alert("실패 함");
	}
	location.href = "board-list.jsp";

</script>
