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
		request.setCharacterEncoding("UTF-8");
		
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		String stuClass = request.getParameter("stuClass");
		String stuGender = request.getParameter("stuGender");

		// ✅ stuClass와 stuGender에 작은따옴표 추가!
		String sql = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS, STU_GENDER) "
		        + "VALUES ("
				+ "'" + stuNo + "', "
		        + "'" + stuName + "', "
		        + "'" + stuDept + "', "
		        + stuGrade + ", "
		        + "'" + stuClass + "', "
		        + "'" + stuGender + "')";

		int result = stmt.executeUpdate(sql);
	%>
</body>
</html>
<script>
	let result = <%= result %>;
	if(result > 0){
		alert("등록되었습니다!");
		location.href = "stu-list.jsp";
	} else {
		alert("등록 실패!");
		history.back();
	}
</script>