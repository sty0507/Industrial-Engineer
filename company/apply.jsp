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
	<h1>부서별근무일수징계</h1>
	<table border="1">
		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>부서명</td>
			<td>근무일수</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
		try{
			Connection con = Utils.getConnection();
			Statement stmt = con.createStatement();
			
			String sql = "select e.empno, e.empname, e.deptcode, count(r.resvdate) resvdate"
					+ " from tbl_emp_202108 e, tbl_resv_202108 r"
					+ " where e.empno = r.empno"
					+ " group by e.empno, e.empname, e.deptcode"
					+ " order by e.deptcode";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				String dept = rs.getString("deptcode");
				switch(dept){
				case "10":
					dept = "영업팀";
					break;
				case "20":
					dept = "총무팀";
					break;
				case "30":
					dept = "구매팀";
					break;
				}
				%>
				<tr>
					<td><%= rs.getString("empno") %></td>
					<td><%= rs.getString("empname") %></td>
					<td><%= dept %></td>
					<td><%= rs.getString("resvdate") %></td>
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