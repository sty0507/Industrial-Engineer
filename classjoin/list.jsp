<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="DBPKG.Util"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./style.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<section>
		<% 
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement stmt = null;
		int week;
		String id = "";
		String mon = "";
		String start = "";
		String end = "";
		%>
		<h1>교과목 목록</h1>
			<table border="1">
				<tr>
					<td>과목코드</td>
					<td>과목명</td>
					<td>학점</td>
					<td>담당강사</td>
					<td>요일</td>
					<td>시작시간</td>
					<td>종료시간</td>
					<td>삭제</td>
				</tr>
				<%
					try {
						conn = Util.getConnection();
						stmt = conn.createStatement();
						String sql = "select c.id as id, c.name as name, c.credit as credit, c.week as week, c.start_hour as start_hour, c.end_hour as  end_hour, l.name as lecturername from course_tbl c, lecturer_tbl l where c.lecturer = l.idx";
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){	
							id = null;
							week = rs.getInt("week");
							id = rs.getString("id");
							switch(week){
								case 1:
									mon = "월요일";
									break;
								case 2:
									mon = "화요일";
									break;
								case 3:
									mon = "수요일";
									break;
								case 4:
									mon = "목요일";
									break;
								case 5:
									mon = "금요일";
									break;
							}
							int starth = rs.getInt("start_hour");
							if(starth / 100 > 9){
								if(starth%100 == 0)
									start = starth/100 + "시" + starth%100 + "0분"; 
								else
									start = starth/100 + "시" + starth%100 + "분"; 
							}
							else{
								if(starth%100 == 0)
									start = "0"+starth/100+"시"+ starth%100 + "0분";
								else
									start = "0"+starth/100+"시"+ starth%100 + "분";
							}
							int endh = rs.getInt("end_hour");
							if(endh / 100 > 9){
								if(endh%100 == 0)
									end = endh/100 + "시" + endh%100 + "0분"; 
								else
									end = endh/100 + "시" + endh%100 + "분";
							}
							else{
								
								if(endh%100 == 0)
									end = "0"+endh/100+"시"+ endh%100 + "0분";
								else
									end = "0"+endh/100+"시"+ endh%100 + "분";
							}
							
				%>
				<tr>
					<td><a href="modify.jsp?id=<%= id %>"><%= id %></a></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getInt("credit") %></td>
					<td><%= rs.getString("lecturername") %></td>
					<td><%= mon %></td>
					<td><%= start %></td>
					<td><%= end %></td>
					<td><a href="action.jsp?id=<%=id %>&mode='delete'">삭제</a></td>
				</tr>
				<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
			</table>
	</section>
<jsp:include page="footer.jsp"/>
</body>
</html>