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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>오디션 참가 신청</h1>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<%
		try{
			Connection con = Utils.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select a.artist_id as aid,  a.artist_name as aname, sum(p.score) as 총점, round(avg(p.score), 2) as avgscore, rank() over (order by avg(p.score) desc) as ranking"
					+ " from tbl_artist_201905 a, tbl_point_201905 p"
					+ " where a.artist_id = p.artist_id"
					+ " group by a.artist_id, a.artist_name";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				%>
				<tr>
					<td><%= rs.getString("aid") %></td>
					<td><%= rs.getString("aname") %></td>
					<td><%= rs.getString("총점") %></td>
					<td><%= rs.getString("avgscore") %></td>
					<td><%= rs.getString("ranking") %></td>
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