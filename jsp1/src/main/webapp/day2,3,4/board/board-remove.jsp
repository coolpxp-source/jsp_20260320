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
	<!-- 삭제  -->
		<%
			String boardNo = request.getParameter("boardNo");
			String sql = "DELETE FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
			
			int result = stmt.executeUpdate(sql);
			
			if(result > 0){
				out.println("삭제되었습니다.");
		%>
			<a href="board-list.jsp"><button>되돌아가기</button></a>
		<%
			}else{
				out.println("오류 발생.");
			}
			out.println(boardNo);
		%>
</body>
</html>