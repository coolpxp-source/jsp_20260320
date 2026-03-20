<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="9_LoginResult.jsp" name="login" method="get">
		<div>
			<label>아이디 : <input name="userId"></label> <!-- form태그 내에서 테이터를 넘기기 위해서는 name 속성이 필수 -->
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<input type="button" value="로그인" onclick="fnCheck()">  <!-- input type="button" 으로 하면 바로 넘어가지 않는다. -->
		</div>
	</form>
	
</body>
</html>
<script>
	function fnCheck(){
		let login = document.login; // form 태그의 name과 같은 이름이어야한다.
		/* console.log(login.userId.value); */
		if(login.userId.value.length == 0){
			alert("id를 입력하세요");
			login.userId.focus();
			return;
		}
		if(login.pwd.value.length == 0){
			alert("password를 입력하세요");
			login.pwd.focus();
			return;
		}
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		login.submit();
	}

</script>
