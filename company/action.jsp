<%@page import="java.sql.*"%>
<%@page import="DBPKG.Utils"%>
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
	Connection con = Utils.getConnection();
	Statement stmt = con.createStatement();
	String mode = request.getParameter("mode");
	switch(mode){
	case "reserve":
		String bno = request.getParameter("bno");
		String pno = request.getParameter("pno");
		String date = request.getParameter("date");
		String seatno = request.getParameter("seatno");
		try{
			String sql = "insert into tbl_resv_202108 values('"+bno+"','"+pno+"','"+date+"','"+seatno+"')";
			int rs = stmt.executeUpdate(sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
%>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>