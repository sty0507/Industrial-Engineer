<%@page import= "DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String id = request.getParameter("id");
		String sql = "delete from course_tbl where id = "+ "'" +id+ "'";
		stmt.executeQuery(sql);
	 %>
	 <jsp:forward page="list.jsp"></jsp:forward>
	 <%
	}catch(Exception e){
		 e.printStackTrace();
	 }
%>
</body>
</html>