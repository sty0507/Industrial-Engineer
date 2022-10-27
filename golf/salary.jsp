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
	<h1>강사매출현황</h1>
	<table border="1">
		<tr>
			<td>강사코드</td>
			<td>강의명</td>
			<td>강사명</td>
			<td>총매출</td>
		</tr>
		<%
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				Statement stmt = con.createStatement();
				String sql = "select t.teacher_code as code, t.teacher_name as tname, t.class_name as cname, sum(c.tuition) as price from tbl_teacher_202201  t, tbl_class_202201 c where t.teacher_code = c.teacher_code group by (t.teacher_code, t.teacher_name, t.class_name) order by t.teacher_code";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					%>
					<tr>
						<td><%= rs.getString("code") %></td>
						<td><%= rs.getString("tname") %></td>
						<td><%= rs.getString("cname") %></td>
						<td>₩<%= rs.getInt("price") %></td>
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