<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login-result.jsp" name="login" method="get">
		<div>
			<label>아이디 : <input name="USERID"></label> <!-- form태그 내에서 테이터를 넘기기 위해서는 name 속성이 필수 -->
		</div>
		<div>
			<label>비밀번호 : <input name="PWD" type="password"></label>
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
	
</body>
</html>
