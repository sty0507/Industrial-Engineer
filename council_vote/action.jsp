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
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String vno = request.getParameter("vno");
	String time = request.getParameter("vtime");
	String vplace = request.getParameter("vplace");
	String check = request.getParameter("check");
	try{
		Connection con = Utils.getConnection();
		Statement stmt = con.createStatement();
		String sql = "insert into TBL_VOTE_202005(v_jumin, v_name, m_no, v_time, v_area, v_confirm)"
				+ " values('"+no+"','"+name+"','"+vno+"','"+time+"','"+vplace+"','"+check+"')";
		int rs = stmt.executeUpdate(sql);
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>