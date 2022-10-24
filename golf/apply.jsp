<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>수강신청</h1>
	<form name="frm" action="insert.jsp">
	<table border="1">
			<tr>
				<td>수강월</td>
				<td><input type="text" name="month"/> ?????</td>
			</tr>
			<tr>
				<td>회원명</td>
				<td>
				<select id="cname" name="cname" onchange ="changeNameHandler()">
					<option value="10001">홍길동</option>
					<option value="10002">장발장</option>
					<option value="10003">임꺽정</option>
					<option value="20001">심춘향</option>
					<option value="20002">이을룡</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="cno" id="cno" readonly/></td>
			</tr>
			<tr>
				<td>강의장소</td>
				<td>
				<select name="place">
					<option value="10001">서울분원</option>
					<option value="10002">성남분원</option>
					<option value="10003">대전분원</option>
					<option value="20001">부산분원</option>
					<option value="20002">대구분원</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>강좌명</td>
				<td>
				<select id="className" name="classname" onChange= "init()">
					<option value="1">초급반</option>
					<option value="2">중급반</option>
					<option value="3">고급반</option>
					<option value="4">심화반</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>수강료</td>
				<td><input type="text" name ="price"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="수강신청" onclick="Check()"/></td>
				<td><input type="button" value="다시쓰기" onclick="rewrite()"/></td>
			</tr>
	</table>
	</form>
	
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="check.js"></script>
</body>
</html>