<%@page import="DBPKG.Utils"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>참가자 목록 조회</h1>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>특기</td>
			<td>소속사</td>
		</tr>
		<%
			try{
				Connection con = Utils.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from tbl_artist_201905");
				while(rs.next()){
					String birth = rs.getString("birth");
					String gender = rs.getString("gender").equals("F")?"여":"남";
					String talent = rs.getString("talent").equals("1")?"보컬" : ( rs.getString("talent").equals("2") ? "댄스":"랩");
					
			%>
			<tr>
				<td><%= rs.getString("artist_id") %></td>
				<td><%= rs.getString("artist_name") %></td>
				<td><%= birth.substring(0,4) %>년<%= birth.substring(4,6) %>월<%= birth.substring(6,8) %>일</td>
				<td><%= gender %></td>
				<td><%= talent %></td>
				<td><%= rs.getString("agency") %></td>		
			</tr>
			<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>