<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DBPKG.Util" %>
<%@ page import = "java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href= "style.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement stmt = null;
	
		String mod_custno = request.getParameter("mod_custno");
		String custname = "";
		String phone = "";
		String address = "";
		Date joindate;
		String grade = "";
		String city = "";
		String joindateStr="";
		
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from member_tbl_02 where custno =" + mod_custno;
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("adrress");
			joindate = rs.getDate("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
			SimpleDateFormat transformat = new SimpleDateFormat("yyyy-MM-dd");
			joindateStr = transformat.format(joindate);
		}catch(Exception e){
		e.printStackTrace();
		}
	%>
		<h1>홈쇼핑 회원 정보 수정</h1>
		<form name="frm" method="post" action="action.jsp" >
			<input type="hidden" name="mode" value="modify">
			<table border="1">
					<tr>
						<td>회원번호</td>
						<td><input type=text name="custno" value="<%= mod_custno %>" readonly/></td>
					</tr>
					<tr><td>회원성명</td>
						<td><input type=text name="custname" value="<%= custname %>"></input></td>
					</tr>
					<tr>
						<td>회원전화</td>
						<td><input type="text" name="phone" value="<%= phone %>"></td>
					</tr>
					<tr>
						<td>회원주소</td>
						<td><input type=text name="address" value="<%= address %>"></input></td>
					</tr> 
					<tr>
						<td>가입일자</td>
						<td><input type=text name="joindate" value="<%= joindateStr %>"></input></td>
					</tr>
					<tr>	
						<td>고객등급[A:VIP, B:일반, C:직원]</td>
						<td><input type=text name="grade" value="<%= grade %>"></input></td>
					</tr>
					<tr>
						<td>도시</td>
						<td><input type=text name="city" value="<%= city %>"></input></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" onclick="return joinCheck()"/>
							<input type="button" value="조회" onclick="return search()"/>
						</td>
					</tr>
			</table>
		</form>
	</section>

<jsp:include page="footer.jsp"/>
</body>
</html>