<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="./style.css">
<title>Insert title here</title>
<script type="text/javascript" src="./check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	String id = request.getParameter("id");
	String name = "";
	String score = "";
	int lecter = 0;
	int week = 0;
	String start = "";
	String end = "";
	
%>

<%
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
%>
<h1>교과목 수정</h1>
<form name="frm" method="post" action = "action.jsp">
<input type="hidden" name="mode" value="insert">
<table border="1">
	<tr>
		<td>과목 코드</td>	
		<td><input type="text" name="classid" ></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" name="classname"></td>	
	</tr>
	<tr>
		<td>학점</td>	
		<td><input type="text" name="classscore"></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
		<select name="lecter">
			<option value="0" >담당강사
			<option value="1" >김교수
			<option value="2" >이교수
			<option value="3" >박교수
			<option value="4" >우교수
			<option value="5" >최교수
			<option value="6" >임교수
		</select>
		</td>	
	</tr>
	<tr>
		<td>요일</td>
		<td colspan="5">
			월<input type="radio" name="week" value="1">
			화<input type="radio" name="week" value="2">
			수<input type="radio" name="week" value="3">
			목<input type="radio" name="week" value="4">
			금<input type="radio" name="week" value="5">
		</td>	
	</tr>

	<tr>
		<td>시작 시간</td>
		<td><input type="text" name="start"	></td>	
	</tr>
	<tr>
		<td>종료 시간</td>
		<td><input type="text" name="finish"></td>	
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="추가" onclick = "return Insert()">
			<input type="button" value="목록" onclick="golist()">
		</td>
	</tr>
	<%
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>