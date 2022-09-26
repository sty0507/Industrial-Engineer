<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="./style.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="check.js"></script>
<section>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	String id = request.getParameter("id");
	String name = "";
	String score = "";
	int lecter = 0;
	int week = 0;
	String start = "";
	String end = "";
	
%>

<%
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select * from course_tbl where id = "+ id;
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			week = rs.getInt("week");
			lecter = rs.getInt("lecturer");
%>
<h1>교과목 수정</h1>
<form name="frm" method="post" action = "action.jsp">
<input type="hidden" name="mode" value="modify">
<table border="1">
	<tr>
		<td>과목 코드</td>	
		<td><input type="text" name="classid" value = <%=id %> ></td>
	</tr>
	<tr>
		<td>과목명</td>
		<td><input type="text" name="classname" value = <%=rs.getString("name") %>></td>	
	</tr>
	<tr>
		<td>학점</td>	
		<td><input type="text" name="classscore" value = <%=rs.getInt("credit") %>></td>
	</tr>
	<tr>
		<td>담당강사</td>
		<td>
		<select name="lecter">
			<option value="0" <% if(lecter == 0) out.println("selected");%>>담당강사
			<option value="1" <% if(lecter == 1) out.println("selected");%>>김교수
			<option value="2" <% if(lecter == 2) out.println("selected");%>>이교수
			<option value="3" <% if(lecter == 3) out.println("selected");%>>박교수
			<option value="4" <% if(lecter == 4) out.println("selected");%>>우교수
			<option value="5" <% if(lecter == 5) out.println("selected");%>>최교수
			<option value="6" <% if(lecter == 6) out.println("selected");%>>임교수
		</select>
		</td>	
	</tr>
	<tr>
		<td>요일</td>
		<td colspan="5">
			월<input type="radio" name="week" value="1" <% if(week == 1)out.println("checked"); %>>
			화<input type="radio" name="week" value="2" <% if(week == 2)out.println("checked"); %>>
			수<input type="radio" name="week" value="3" <% if(week == 3)out.println("checked"); %>>
			목<input type="radio" name="week" value="4" <% if(week == 4)out.println("checked"); %>>
			금<input type="radio" name="week" value="5" <% if(week == 5)out.println("checked"); %>>
		</td>	
	</tr>
	<%
	int starth = rs.getInt("start_hour");
	if(starth / 100 > 9){
		if(starth%100 == 0)
			start = "" + starth + ""; 
		else
			start = "" +starth/100+"" + "" +starth%100 + ""; 
	}
	else{
		if(starth%100 == 0)
			start = "0"+starth/100 + "" + starth%100 + "0";
		else
			start = "0"+starth/100+ "" + starth%100+ "";
	}
	
	
	int endh = rs.getInt("end_hour");
	if(endh / 100 > 9){
		if(endh%100 == 0)
			end = "" +endh/100 +"" + endh%100 + "0"; 
		else
			end = "" + endh/100+ "" + "" + endh%100 + "";
	}
	else{
		
		if(endh%100 == 0)
			end = "0"+endh/100+ ""+ endh%100 + "0";
		else
			end = "0"+endh/100+ ""+ endh%100 + "";
	}
	%>
	<tr>
		<td>시작 시간</td>
		<td><input type="text" name="start" value = <%=start %>></td>	
	</tr>
	<tr>
		<td>종료 시간</td>
		<td><input type="text" name="finish" value = <%= end%>></td>	
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정" onclick = "return Check()">
			<input type="submit" value="취소" onclick = "return fail()">
		</td>
	</tr>
	<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>