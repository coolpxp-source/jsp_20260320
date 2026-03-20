<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp의 핵심=> form 태그 -->
	<!-- form태그 내의 submit 버튼 클릭 시 action 페이지로 이동 -->
	<!-- 이때, form 태그 내부에 있는 input에 있는 값을 request 객체에 담아서 이동 -->
	<!-- input의 name 속성이 키(key), 입력 받은 값이 value 역할 -->
	
	<!-- metod는 옵선, get방식과 post방식, 디폴트는 get -->
	<!-- get방식은 url(주소)에 값을 담아서 보낸다. *보안에 취약하지만 빠른 처리가 가능하다. -->
	<!-- 사용자 개인정보나 패드워드 등을 전송할 때는 사용하면 안된다. -->
	
	<!-- post방식은 데이터를 숨겨서 보낸다. -->
	
	<!-- 실습할 때는 데이터 확인을 위해 get을 주소 쓰겠습니다. -->
	<form action="9_LoginResult.jsp" method="get">
		<div>
			<label>아이디 : <input name="userId"></label> <!-- form태그 내에서 테이터를 넘기기 위해서는 name 속성이 필수 -->
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<!-- submit 버튼을 클릭하면 form태그의 action에 있는 페이지로 이동한다. -->
			<input type="submit" value="로그인">
		</div>
	</form>
	
</body>
</html>