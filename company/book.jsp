<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>근무좌석예약</h1>
	<form name="frm" method="post" action="action.jsp">
		<input type="hidden" name="mode" value="reserve">
		<table border="1">
			<tr>
				<td>예약번호</td>
				<td><input type="text" name="bno"/></td>
			</tr>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="pno"/></td>
			</tr>
			<tr>
				<td>근무일자</td>
				<td><input type="text" name="date"/></td>
			</tr>
			<tr>
				<td>좌석번호</td>
				<td><input type="text" name="seatno"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" onclick="return Check()"/>
					<input type="reset" value="다시쓰기" onclick = "Re()"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>