<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css"/>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="check.js"></script>
<section>
	<h1>오디션 등록</h1>
	<form name="frm" action="action.jsp" method="post">
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="attid">*참가번호는(A000) 4자리입니다.</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="attname"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="3">
					<input type="text" name="attyear">년
					<input type="text" name="attmonth">월
					<input type="text" name="attday">일
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td colspan="2"> 
					<input type="radio" name="gender" value="M">남성
					<input type="radio" name="gender" value="F">여성
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name="strong">
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="enter"/></td>	
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="오디션 등록" onclick="return Check()"/>
					<input type="reset" value="다시쓰기" onclick="Re()"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>