<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="check.js"></script>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href= "style.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	String custno = "";
	
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select max(custno)+1 as custno from member_tbl_02";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		custno = rs.getString("custno");
	}catch(Exception e){
	e.printStackTrace();
	}
%>

<jsp:include page="header.jsp"/>
	<section>
		<h1>홈쇼핑 회원 등록</h1>
		<form name="frm" method="post" action="action.jsp" >
			<input type="hidden" name="mode" value="insert">
			<table border="1">
					<tr>
						<td>회원번호(자동발생)</td>
						<td><input type=text name="custno" value="<%= custno %>" readonly/></td>
					</tr>
					<tr><td>회원성명</td>
						<td><input type=text name="custname"></input></td>
					</tr>
					<tr>
						<td>회원전화</td>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td>회원주소</td>
						<td><input type=text name="address"></input></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><input type=text name="joindate"></input></td>
					</tr>
					<tr>	
						<td>고객등급[A:VIP, B:일반, C:직원]</td>
						<td><input type=text name="grade"></input></td>
					</tr>
					<tr>
						<td>도시</td>
						<td><input type=text name="city"></input></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" onclick="return joinCheck()"/>
							<input type="button" value="조회" onclick="return search()"/>
						</td>
					</tr>
			</table>
		</form>
	</section>

<jsp:include page="footer.jsp"/>
</body>
</html>