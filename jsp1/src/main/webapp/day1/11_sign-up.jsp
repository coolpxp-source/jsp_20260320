<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="12_sign-up-result.jsp" name="join" method="get">
		<div>
			<label>아이디 : <input name="userId"></label> <!-- form태그 내에서 테이터를 넘기기 위해서는 name 속성이 필수 -->
		</div>
		<div>
			<label>비밀번호 : <input name="pwd1" type="password"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input name="pwd2" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="name"></label>
		</div>
		<div>
			<label>나이 : <input name="age"></label>
		</div>
		<div>
			<input type="button" value="회원가입" onclick="fnJoin()">  <!-- input type="button" 으로 하면 바로 넘어가지 않는다. -->
		</div>
	</form>

</body>
</html>
<script>
	function fnJoin(){
		let join = document.join; // form 태그의 name과 같은 이름이어야한다.
		if(join.userId.value.length == 0){
			alert("id는 비워둘 수 없습니다.");
			join.userId.focus();
			return;
		}
		if(join.pwd1.value.length == 0){
			alert("password는 비워둘 수 없습니다.");
			join.pwd1.focus();
			return;
		}
		if(join.pwd1.value != join.pwd2.value){
			alert("password가 다릅니다.");
			join.pwd1.focus();
			return;
		}
		if(join.name.value.length == 0){
			alert("이름은 비워둘 수 없습니다.");
			join.name.focus();
			return;
		}
		if(join.age.value.length == 0){
			alert("나이는 비워둘 수 없습니다.");
			join.age.focus();
			return;
		}
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		join.submit();
	}
		

</script>