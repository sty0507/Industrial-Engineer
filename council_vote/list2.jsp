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
	<h1>투표검수조회</h1>
	<table border="1">
		<tr>
			<td>성명</td>
			<td>생년월일</td>
			<td>나이</td>
			<td>성별</td>
			<td>후보번호</td>
			<td>투표시간</td>
			<td>유권자확인</td>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = Utils.getConnection();
			Statement stmt = con.createStatement();
			String sql = "select v_jumin, v_name, m_no, v_time, v_confirm from tbl_vote_202005";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String jumin = rs.getString("v_jumin");
				String month = "19" + jumin.substring(0,2);
				int birth = 2020 - Integer.parseInt(month);
				String time = rs.getString("v_time");
				String gender = "";
				switch(jumin.substring(6,7)){
				case "1":
					gender="남";
					break;
				case "2":
					gender="여";
					break;
				}
				String check = "";
				switch(rs.getString("v_confirm")){
				case "N":
					check = "미확인";
					break;
				case "Y":
					check = "확인";
					break;
				}
				%>
				<tr>
					<td><%= rs.getString("v_name") %></td>
					<td>19<%= jumin.substring(0,2) %>년<%= jumin.substring(2,4) %>월<%= jumin.substring(4,6) %>일생</td>
					<td>만<%= birth %>세</td>
					<td><%= gender %></td>
					<td><%= rs.getString("m_no") %></td>
					<td><%= time.substring(0,2) %>:<%=time.substring(2,4) %></td>
					<td><%= check %></td>
				</tr>
				<%
			}
			
		%>
	</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>