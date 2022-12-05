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
	<h1>선수별 홈그라운드 조회</h1>
	<table border="1">
		<tr>
			<td>선수이름</td>
			<td>포지션</td>
			<td>팀이름</td>
			<td>경기장 이름</td>
			<td>좌석 수</td>
		</tr>
		<%
			try{
				Connection con = Util.getConnection();
				Statement stmt = con.createStatement();
				String sql = "select p.player_name, p.player_position, t.team_name, s.stadium_name, s.seat_count"
						+ " from tbl_player_20221205 p, tbl_team_20221205 t, tbl_stadium_20221205 s"
						+ " where s.stadium_id = t.stadium_id and t.team_id = p.team_id and seat_count >= 30000"
						+ " order by seat_count";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					String position = rs.getString("player_position");
					String seat = rs.getString("seat_count");
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
						<td>☞<%= rs.getString("player_name") %></td>
						<td><%= position %></td>
						<td><%= rs.getString("team_name") %></td>
						<td><%= rs.getString("stadium_name") %></td>
						<td><%= seat.substring(0,2) %>,<%= seat.substring(2,5) %>개</td>
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