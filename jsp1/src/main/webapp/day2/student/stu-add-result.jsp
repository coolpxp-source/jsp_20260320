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
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade"); 
		String stuClass = request.getParameter("stuClass");
		String stuGender = request.getParameter("stuGender");
		
		String sql = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS, STU_GENDER) "
		        + "VALUES ( "
				+ "'" + stuNo + "', "
		        + "'" + stuName + "', "
		        + stuDept + ", "
		        + stuGrade + ", "
		        + stuClass + ", "
		        + stuGender + " )";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			response.sendRedirect("stu-list.jsp"); // 해당 페이지로 이동
			out.println("등록되었습니다.");
		} else {
			out.println("오류가 발생했습니다.");
		}
	%>
</body>
</html>