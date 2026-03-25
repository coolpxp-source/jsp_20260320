<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin : 30px;
	}
	table, th, tr, td{
		border : 1px solid black;
		padding : 5px 5px;
		border-collapse : collapse;
	}
	
	
	th{
		width : 50px;
	}
	td{
		width : 300px;
	}
	input[type="text"]{
		width : 200px;
	}
	input[readOnly]{
		background-color: #ccc;
		border-style: none;
	}
</style>
</head>
<body>
	<%@ include file="../../db.jsp" %>
	<form action="stu-add-result.jsp" method="get" name="form">
		<table>
			<tr>
				<th>학번</th>
				<td>
					<input type="text" name="stuNo">
					<input type="button" onclick="fnCheck()" value="중복체크">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="stuName"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<input type="radio" name="stuDept" value="기계" checked>기계
					<input type="radio" name="stuDept" value="전기전자">전기전자
					<input type="radio" name="stuDept" value="컴퓨터정보">컴퓨터정보
				</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<input type="radio" name="stuGrade" value="1" checked>1학년
					<input type="radio" name="stuGrade" value="2">2학년
					<input type="radio" name="stuGrade" value="3">3학년
				</td>
			</tr>
			<tr>
				<th>반</th>
				<td>
					<input type="radio" name="stuClass" value="A" checked>A반
					<input type="radio" name="stuClass" value="B">B반
					<input type="radio" name="stuClass" value="C">C반
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="stuGender" value="M" checked>남
					<input type="radio" name="stuGender" value="F">여
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="작성완료" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="stu-add.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
</body>
</html>
<script>
	let addFlg = "N";
	function fnAdd(){
		let form = document.form;
		if(form.stuNo.value.length == 0 || form.stuName.value.length == 0){
			alert("학번과 이름은 빈 값일 수 없습니다.");
			return;
		}
		if(addFlg == "N"){
			alert("중복체크 후 추가해주세요");
			return;
		}
		form.submit();
	}
	function fnCheck(){
		/* student-check.jsp */
		let form = document.form;
		let stuNo = form.stuNo.value;
		if(form.stuNo.value.length != 8){
			alert("학번은 8자리여야합니다.");
			return;
		}
		window.open("student-check.jsp?stuNo="+stuNo,"check","width=400, height=400");
	}
	function fnReturn(flg){
		let form = document.form;
		if(flg == "Y"){
			form.stuNo.readOnly = true;
			addFlg = flg;
		}
	}
</script>