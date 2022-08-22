<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"  %>
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
		
		String mode = request.getParameter("mode");//변수 초기화
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "";
			
			switch(mode){
				case "insert":
					sql = "Insert into member_tbl_02 values("+custno+",'"+custname+"','"+phone+"','"+address+"',TO_DATE('"+joindate+"', 'YYYY-MM-DD'),'"+grade +"','"+city+"')";
					stmt.executeQuery(sql);
	%>
	<jsp:forward page="join.jsp"></jsp:forward>
	<% 		
				break;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>

</body>
</html>