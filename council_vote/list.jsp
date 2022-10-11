<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
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
<h1>후보조회</h1>
<table border="1">
	<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>소속정당</td>
		<td>학력</td>
		<td>주민번호</td>
		<td>지역구</td>
		<td>대표전화</td>
	</tr>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection con = null;
		Statement stmt = null;
		String grade = "";
		String period = "";
		String num = "";
		String num1 = "";
		String num2 = "";
		try{
			con = Util.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT tm.M_NO, tm.M_NAME, tp.P_NAME, tm.P_SCHOOL, tm.M_JUMIN, tm.M_CITY, tp.P_TEL1, tp.P_TEL2, tp.P_TEL3 FROM TBL_MEMBER_202005 tm, TBL_PARTY_202005 tp WHERE tm.P_CODE = tp.P_CODE";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				period = rs.getString("P_TEL1") + "-" + rs.getString("P_TEL2") + "-" + rs.getString("P_TEL3");
				num = rs.getString("M_JUMIN");
				num1 = num.substring(0,6);
				num2 = num.substring(6,13);
				num = num1 + "-" + num2;
				
				switch(rs.getString("P_SCHOOL")){
				case "1":
					grade = "고졸";
					break;
				case "2":
					grade = "학사";
					break;
				case "3":
					grade = "석사";
					break;
				case "4":
					grade = "박사";
					break;
				}
				%>
				<tr>
					<td><%= rs.getString("M_NO") %></td>
					<td><%= rs.getString("M_NAME") %></td>
					<td><%= rs.getString("P_NAME") %></td>
					<td><%= grade %></td>
					<td><%= num %></td>
					<td><%= rs.getString("M_CITY") %></td>
					<td><%= period %></td>
				</tr>
				<%
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	%>


</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>