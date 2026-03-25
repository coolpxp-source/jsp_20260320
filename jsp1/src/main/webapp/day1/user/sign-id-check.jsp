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
		String sql = "SELECT * FROM TBL_USER WHERE USERID = '" + userId + "' ";
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			out.println("이미 사용 중인 아이디입니다.");
			out.println("<input id='check' value='N' hidden>");
		}else{
			out.println("사용 가능한 아이디입니다.");
			out.println("<input id='check' value='Y' hidden>");
		}
	%>
	Systemout.println(userId);
	<input type="button" value="돌아가기" onclick="fnClose()">

</body>
</html>
<script>
	function fnClose(){
		let flg = document.querySelector("#check").value;
		window.opener.fnReturn(flg);
		window.close();
	}
</script>