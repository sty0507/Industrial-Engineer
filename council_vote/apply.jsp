<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>투표하기</h1>
	<form name="frm" method="post" action="action.jsp">
		<table border="1">
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="no"/></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>후보번호</td>
				<td>
					<select name="vno">
						<option value="0" hidden></option>
						<option value="1">김후보</option>
						<option value="2">이후보</option>
						<option value="3">박후보</option>
						<option value="4">조후보</option>
						<option value="5">최후보</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>투표시간</td>
				<td><input type="text" name="vtime"/></td>
			</tr>
			<tr>
				<td>투표장소</td>
				<td><input type="text" name="vplace"/></td>
			</tr>
			<tr>
				<td>유권자확인</td>
				<td>
					<input type="radio" name="check" value="Y"/>확인
					<input type="radio" name="check" value="Ns"/>미확인
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="투표하기" onclick="return Check()"/>
					<input type="reset" value="다시하기" onclick="Re()"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>