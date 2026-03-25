<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- login.jsp  -->
	<form action="login-result.jsp" method="get" name="login">
		<div>
			아이디 : <input name="userId">
		</div>
		<div>
			비밀번호 : <input name="pwd" type="password">
		</div>
		<div>
			<input type="button" value="로그인" onclick="fnLogin()">
		</div>
	</form>
</body>
</html>
<script>
	function fnLogin(){
		let obj = document.login; // form태그의 객체 만들기.
		if(obj.userId.value.length == 0){
			alert("id를 입력하세요.");
			return;
		}
		if(obj.pwd.value.length == 0){
			alert("pwd를 입력하세요.");
			return;
		}
		obj.submit();
	}

</script>




