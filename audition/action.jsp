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
	String id = request.getParameter("attid");
	String name = request.getParameter("attname");
	String birth_year = request.getParameter("attyear");
	String birth_month = request.getParameter("attmonth");
	String birth_day = request.getParameter("attday");
	String gender = request.getParameter("gender");
	String strong = request.getParameter("strong");
	String enter = request.getParameter("enter");
	String birth = birth_year + birth_month + birth_day;
	try{
		Connection con = Utils.getConnection();
		Statement stmt = con.createStatement();
		String sql = "insert into tbl_artist_201905(artist_id, artist_name, birth, gender, talent, agency)"
				+ " values('"+id+"','"+name+ "','"+birth+"','"+gender+"','"+strong+"','"+enter+"')";
		int rs = stmt.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>