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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>선수조회</h1>
	<table border="1">
		<tr>
			<td>선수ID</td>
			<td>선수이름</td>
			<td>포지션</td>
			<td>선수등록일</td>
			<td>팀ID</td>
		</tr>
		<%
		try{
			request.setCharacterEncoding("UTF-8");
			Connection con = Util.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select player_id, player_name, player_position, player_date, team_name from tbl_player_20221205 p, tbl_team_20221205 t where p.team_id = t.team_id order by player_id";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String position = rs.getString("player_position");
				String day = rs.getString("player_date");
				switch(position){
				case "GF":
					position = "골키퍼";
					break;
				case "DF":
					position = "수비수";
					break;
				case "MF":
					position = "미드필더";
					break;
				case "FW":
					position = "공격수";
					break;
				}
				%>
				<tr>
					<td><a href="modify.jsp?pid=<%= rs.getString("player_id") %>"><%= rs.getString("player_id") %></a></td>
					<td>☞<%= rs.getString("player_name") %></td>
					<td><%= position %></td>
					<td><%= day.substring(0,4)%>년<%=day.substring(4,6) %>월<%= day.substring(6,8) %>일</td>
					<td><%= rs.getString("team_name") %></td>
				</tr>
				<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>