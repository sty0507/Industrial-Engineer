<%@page import="java.sql.*"%>
<%@page import="DBPKG.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css"/>
<title>Insert title here</title>
</head>
<body><jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>강사조회</h1>
	<%
	
	try{
		request.setCharacterEncoding("UTF-8");
	
	Connection con = Utils.getConnection();
	Statement stmt = con.createStatement();
	String sql = "select * from tbl_teacher_202201";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<td>강사코드</td>
			<td>강사명</td>
			<td>강의명</td>
			<td>수강료</td>
			<td>강사자격취득일</td>
		</tr>
	<% 
		while(rs.next()){
%>
<tr>
<td><%=rs.getString("teacher_code") %></td>
<td><%=rs.getString("teacher_name") %></td>
<td><%=rs.getString("class_name") %></td>
<td><%=rs.getInt("class_price") %></td>
<td><%=rs.getString("teacher_regist_date") %></td>
</tr>			
<%			}

	%>
	
	</table><%
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
	%>
	
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>