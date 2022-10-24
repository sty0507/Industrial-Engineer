
<%@page import="DBPKG.Utils"%>
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
	try{
		request.setCharacterEncoding("UTF-8");
		Connection con = Utils.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String month = request.getParameter("month");
		String cname = request.getParameter("cname");
		String cno = request.getParameter("cno");
		String place = request.getParameter("place");
		String classname = request.getParameter("classname");
		String price = request.getParameter("price");
		
		int classNo = Integer.parseInt(classname);
		
		int d[] = {100, 200, 300,400};
			
		
		String sql = "insert into tbl_class_202201 values('"
		+ month + "','" + cno +  "','" + place + "'," + price +",'"
		+ d[classNo-1] + "')";
		
		stmt.executeQuery(sql);		
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>