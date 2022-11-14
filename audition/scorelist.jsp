<%@page import="DBPKG.Utils"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css"/>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>멘토 점수 조회</h1>
	<table border="1">
		<tr>
			<td>채점번호</td>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>생년월일</td>
			<td>점수</td>
			<td>평점</td>
			<td>멘토명</td>
		</tr>
		<%
		try{
			Connection con = Utils.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select distinct p.serial_no as pno, a.artist_id as aid, a.artist_name as aname, a.birth as abirth, p.score as pscore, m.mento_name as mname"
					+ " from tbl_artist_201905 a, tbl_mento_201905 m, tbl_point_201905 p"
					+ " where p.mento_id = m.mento_id and p.artist_id = a.artist_id"
					+ " order by pno asc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				int score = rs.getInt("pscore");
				String grade = "";
				String birth = rs.getString("abirth");
				if(score >= 90){
					grade = "A";
				}
				else if(score >=80){
					grade = "B";
				}
				else if(score >=70){
					grade = "C";
				}
				else if(score >=60){
					grade = "D";
				}
				else{
					grade = "F";
				}
				%>
				<tr>
					<td><%=rs.getString("pno") %></td>
					<td><%=rs.getString("aid") %></td>
					<td><%=rs.getString("aname") %></td>
					<td><%= birth.substring(0,4) %>년<%= birth.substring(4,6) %>월<%= birth.substring(6,8) %>일</td>
					<td><%=rs.getString("pscore") %></td>
					<td><%=grade%></td>
					<td><%=rs.getString("mname") %></td>
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