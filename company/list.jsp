<%@page import="java.sql.*"%>
<%@page import="DBPKG.Utils"%>
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
<script type="text/javascript" src="check.js"></script>
<section>
<%
	request.setCharacterEncoding("UTF-8");
	String q = request.getParameter("question");
	try{
		Connection con = Utils.getConnection();
		Statement stmt = con.createStatement();
		String somethingsql = "select e.empno, e.empname, r.resvdate, r.seatno, s.office, s.callno from tbl_emp_202108 e, tbl_seat_202108 s, tbl_resv_202108 r where e.empno=r.empno and s.seatno=r.seatno and e.empno='%s' group by e.empno, e.empname, r.resvdate, r.seatno, s.office, s.callno";
		ResultSet rs = stmt.executeQuery(String.format(somethingsql, q));
		if(!rs.next()) {
			%>
			<h1>좌석예매 정보가 존재하지 않습니다.</h1>
			<%
		} else {
			%>
			<h1>사원번호: <%= q%>님의 좌석예약조회</h1>
			<table border="1" style="margin:auto;">
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>근무일자</td>
					<td>좌석번호</td>
					<td>좌석위치</td>
					<td>내선번호</td>
				</tr>
				<tr>
				<%
				while(true){
					String date = rs.getString("resvdate");
					
				%>
					<td><%= rs.getString("empno")%></td>
					<td><%= rs.getString("empname")%></td>
					<td><%= date.substring(0,4)%>년<%= date.substring(4,6)%>월<%= date.substring(6,8)%>일</td>
					<td><%= rs.getString("seatno")%></td>
					<td><%= rs.getString("office")%></td>
					<td><%= rs.getString("callno")%></td>
				</tr>
				<%
					if(!rs.next()){
						break;
					}
				}%>
			
			<%
		}
%>
		</table><%	
	}catch(Exception e){
			e.printStackTrace();
}
%>
	<input type="button" value="돌아가기" onclick="gofind()" style="margin-left:auto;margin-right:auto;"/>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>