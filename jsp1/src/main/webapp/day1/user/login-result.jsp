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
		 String userId = request.getParameter("USERID");
		 String pwd = request.getParameter("PWD");
		/* TBL_USER 테이블의 USERID, PWD 컬럼과 값을 비교하여 */
		/* 동일한 데이터 있으면 로그인 성공 출력 */
		/* 둘 중 하나라도 다르면 로그인 실패 출력 */
		
		String sql = "SELECT * FROM TBL_USER "
					+ "WHERE USERID = '" + userId + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			/* 아이디는 있는 경우 */
/* 			out.println(rs.getString()); */
			if(pwd.equals(rs.getString("PWD"))){
				/* 비밀번호도 같을 때 */
				out.println("로그인 성공");
			}else{
				/* 비밀번호는 다를 때 */
				out.println("비밀번호를 확인해주세요");
			}
		}else{
			out.println("해당 아이디는 존재하지 않습니다");
		}
		/* 아이디가 없는 경우 : '해당 아이디는 존재하지 않습니다' */
		/* 아이디는 있는데 비밀번호가 다른 경우 : '비밀번호를 확인해주세요' */

	%>
</body>
</html>