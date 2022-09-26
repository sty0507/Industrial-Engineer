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
	String mode = request.getParameter("mode");
	String classid = request.getParameter("classid");
	String name = request.getParameter("classname");
	String score = request.getParameter("classscore");
	String lecter = request.getParameter("lecter");
	String week = request.getParameter("week");
	String start = request.getParameter("start");
	String last = request.getParameter("finish");
	String sql = "";
%>
<%
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String id = request.getParameter("id");
		switch(mode){
			case "delete":
				sql = "delete from course_tbl where id = "+ "'" +id+ "'";
				stmt.executeQuery(sql);
%>
				<jsp:forward page="list.jsp"></jsp:forward>
<%
				break;
			case "modify":
				sql = String.format("update course_tbl set name='%s', credit=%d, lecturer=%d, week=%d, start_hour=%d, end_hour=%d where id='%s'",
				name, Integer.parseInt(score), Integer.parseInt(lecter), Integer.parseInt(week), Integer.parseInt(start),Integer.parseInt(last), classid);  
				stmt.executeUpdate(sql);
%>
				 <jsp:forward page="list.jsp"></jsp:forward>
<%
				break;
			case "insert":
				sql = String	.format("insert into course_tbl(id, name, credit, lecturer, week, start_hour, end_hour) values('%s', '%s', %d, %d, %d, %d, %d)",
						classid,name, Integer.parseInt(score), Integer.parseInt(lecter), Integer.parseInt(week), Integer.parseInt(start),Integer.parseInt(last));
				stmt.executeQuery(sql);
%>
				<jsp:forward page="list.jsp"></jsp:forward>
<%
}
	}catch(Exception e){
		 e.printStackTrace();
	 }
%>
</body>
</html>