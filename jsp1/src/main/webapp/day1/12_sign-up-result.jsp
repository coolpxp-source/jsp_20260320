<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userId = request.getParameter("userId");
	String pwd1 = request.getParameter("pwd1");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	String[] hobby = request.getParameterValues("hobby"); // 값을 여러개 받기
	
	for(int i=1; i<hobby.length; i++){
		out.println(hobby[i]);
	}
	
	%>
	<!-- div는 밖에서 작성 -->
	<div>아이디 : <%= userId %></div>
	<div>이름 : <%= name %></div>

</body>
</html>
