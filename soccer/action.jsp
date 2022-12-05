<%@page import="DBPKG.Util"%>
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
	String mode = request.getParameter("mode");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String position = request.getParameter("po");
	String day = request.getParameter("day");
	String team = request.getParameter("team");
	String sql ="";
	int rs;
	
	try{
		Connection con = Util.getConnection();
		Statement stmt = con.createStatement();
		switch(mode){
		case "add":
			
			sql = "insert into tbl_player_20221205 values('"+id+"','"+name+"','"+position+"','"+day+"','"+team+"')";
			rs = stmt.executeUpdate(sql);
			%>
			<jsp:forward page="list.jsp"></jsp:forward>
			<%
		case "modify":
			sql = "update tbl_player_20221205 set player_name ='"+name
			+"', player_position = '"+position+"', player_date ='"+day+"', team_id = '"+team + "'"
			+ " where player_id = '"+id + "'";
			System.out.println(sql);
			rs = stmt.executeUpdate(sql);
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