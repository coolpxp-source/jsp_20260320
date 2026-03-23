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
		text-align : center;
	}
	th{
		width : 50px;
	}
	td{
		width : 300px;
	}
	input[type='text']{
		width : 280px;
	}
</style>
</head>
<body>
	<form action="board-add-result.jsp" name="form">
		<table>
			<tr>
				<th>종류</th>
				<td>
					<label><input name="kind" value="1" type="radio" checked>공지사항</label>
					<label><input name="kind" value="2" type="radio">자유게시판</label>
					<label><input name="kind" value="3" type="radio">문의 게시판</label>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="40" name="contents"></textarea></td>
			</tr>
		</table>
		<div>
			<input type="button" value="작성" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="board-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd(){
		let form = document.form;
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목과 내용은 빈 값일 수 없습니다.");
			return;
		}
		form.submit();
	}
</script>