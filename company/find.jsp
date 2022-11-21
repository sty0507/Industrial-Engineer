<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="check.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>좌석예약조회</h1>
	<form name="frm" action="list.jsp">
		<table border="1">
			<tr>
				<td>사원번호를 입력하시오.</td>
				<td><input type="text" name="question"/></td>
			</tr>
			<tr>
				<td colspan = "2">
				
					<input type="submit" value="좌석예약조회" onclick="return Reserve()"/>
					<input type="button" value="홈으로" onclick="Go()"/>				
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>