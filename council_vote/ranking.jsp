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
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>후보자등수</h1>
	<table border="1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
		<%
		try{
			request.setCharacterEncoding("UTF-8");
			Connection con = Utils.getConnection();
			Statement stmt = con.createStatement();
			
			String sql = "select m.m_no as no, m.m_name as name, count(v.m_no) as count"
					+ " from tbl_vote_202005 v, tbl_member_202005 m"
					+ " where v.m_no = m.m_no"
					+ " group by m.m_no, m.m_name"
					+ " order by count desc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				%>
				<tr>
					<td><%= rs.getString("no") %></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("count") %></td>
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