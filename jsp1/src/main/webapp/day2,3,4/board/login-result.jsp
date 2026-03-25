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
	<!-- login-result.jsp -->
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		/* 		String sql = "SELECT *FROM TBL_USER "
					+ "WHERE USERID = '" + userId + "'"
					+ "AND PWD = '" + pwd + "'"; */
		
		String sql= String.format("SELECT * FROM TBL_USER WHERE USERID = '%s' AND PWD = '%s'", userId, pwd );
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.println("로그인 성공");
			String sessionId = rs.getString("USERID");
			String sessionRole = rs.getString("ROLE");
			
			session.setAttribute("sessionId", sessionId);
			session.setAttribute("sessionRole", sessionRole);// 데이터 넣을 때는 거의 set
			//키값이라 문자열로, value라 그냥 씀
			session.setMaxInactiveInterval(60 * 30); // 세션 유지시간 ->초단위로 (60초 * 원하는 min)
			
			response.sendRedirect("board-list.jsp");
		}else{
			out.println("로그인 실패");
		}
	%>

</body>
</html>