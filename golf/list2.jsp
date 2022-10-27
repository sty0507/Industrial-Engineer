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
<h1>회원정보조회</h1>
	<table border="1">
		<tr>
			<td>수강월</td>
			<td>회원번호</td>
			<td>회원명</td>
			<td>강좌명</td>
			<td>강의 장소</td>
			<td>수강료</td>
			<td>등급</td>
		</tr>
		<%
			try{
				request.setCharacterEncoding("UTF-8");
				Connection con = Utils.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				String sql = "select c.regist_month as month, c.c_no as no, m.c_name as name, c.class_area as area, c.tuition as tuition, m.grade as grade, t.class_name as cname from tbl_member_202201 m, tbl_class_202201 c, tbl_teacher_202201 t where c.C_NO = m.C_NO and t.teacher_code = c.teacher_code";
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					%>
				<tr>
					<td><%= rs.getString("month")%></td>
					<td><%= rs.getString("no")%></td>
					<td><%= rs.getString("name")%></td>
					<td><%= rs.getString("area")%></td>
					<td><%= rs.getInt("tuition")%></td>
					<td><%= rs.getString("grade")%></td>
					<td><%= rs.getString("cname")%></td>
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