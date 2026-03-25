
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sign-up-result.jsp" name="join" method="get">
		<div>
			<label>아이디 : <input name="userId"></label> <!-- form태그 내에서 테이터를 넘기기 위해서는 name 속성이 필수 -->
			<input type="button" onclick="fnCheck()" value="중복체크">
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
			성별 : 
			<label><input type="radio" value="M" name="gender" checked>남자</label>
			<label><input type="radio" value="F" name="gender">여자</label>
		</div>
		<div>
			<input type="button" value="회원가입" onclick="fnJoin()">  <!-- input type="button" 으로 하면 바로 넘어가지 않는다. -->
		</div>
	</form>

</body>
</html>
<script>
	let addFlg = "N";
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
		if(addFlg == "N"){
			alert("중복체크 후 추가해주세요");
			return;
		}
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		join.submit();
	}
	function fnCheck(){
		/* sign-id-check.jsp */
		let join = document.join;
		let userId = join.userId.value;
		
		window.open("sign-id-check.jsp?userId="+userId,"check","width=400, height=400"); /* 팝업창 띄우기 */
	}
	function fnReturn(flg){
		let join = document.join;
		if(flg == "Y"){
			join.userId.readOnly = true;
			addFlg = flg;
		}
	}
</script>